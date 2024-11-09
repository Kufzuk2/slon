module field_filler #(
    parameter int unsigned MAX_CELL_WIDTH =  30,
    parameter int unsigned MAX_CELL_HEIGHT = 16,

    localparam int unsigned CELL_COUNT   = MAX_CELL_HEIGHT * MAX_CELL_WIDTH,
    localparam int unsigned MINES_COUNT  = CELL_COUNT / 4,
    localparam int unsigned MINES_COUNT_FF_WIDTH = $clog2(MINES_COUNT),
    localparam int unsigned CELL_X_WIDTH = $clog2(MAX_CELL_WIDTH),
    localparam int unsigned CELL_Y_WIDTH = $clog2(MAX_CELL_HEIGHT)
)
(
    input logic clk,
    input logic rst,

    output logic [3:0] game_field_o [MAX_CELL_WIDTH - 1 : 0][MAX_CELL_HEIGHT - 1 : 0],
    output logic fill_finished_o,

    input logic [MINES_COUNT_FF_WIDTH - 1 : 0] mines_count_i,
    input logic [CELL_X_WIDTH - 1 : 0] field_width_i,
    input logic [CELL_Y_WIDTH - 1 : 0] field_height_i,
    input logic fill_start_i
);

// randomization part

logic [31:0] clk_counter_ff;
logic [31:0] clk_counter_next;

assign clk_counter_next = clk_counter_ff + 32'd1;

always_ff @(posedge clk)
    if (!rst)
        clk_counter_ff <= 32'b0;
    else
        clk_counter_ff <= clk_counter_next;

logic [31:0] random_num_ff;

random_generator pos_gen (
    .clk(clk), .rst(rst), .seed_i(clk_counter_ff), .seed_v(fill_start_i), .random_o(random_num_ff)
);

// state machine

logic [MINES_COUNT_FF_WIDTH - 1 : 0] mines_left_ff;
logic [MINES_COUNT_FF_WIDTH - 1 : 0] mines_left_next;

logic [CELL_X_WIDTH - 1 : 0] field_width_ff;
logic [CELL_X_WIDTH - 1 : 0] field_width_next;

logic [CELL_Y_WIDTH - 1 : 0] field_height_ff;
logic [CELL_Y_WIDTH - 1 : 0] field_height_next;

typedef enum logic[1:0] { 
    IDLE,
    GENERATE_NUM,
    WRITE_CELLS,
    FINALIZE
} filler_state;

filler_state state_ff;
filler_state state_next;

always_comb begin
    state_next = state_ff;

    case(state_ff)
        IDLE:         if (fill_start_i) state_next = GENERATE_NUM;
        GENERATE_NUM: if (random_num_valid)          state_next = WRITE_CELLS;
                      else if (mines_left_ff == 'b0) state_next = FINALIZE;
        WRITE_CELLS:  state_next = GENERATE_NUM;
        FINALIZE:     state_next = IDLE;
    endcase
end

always_ff @(posedge clk) 
    if (!rst)
        state_ff <= IDLE;
    else   
        state_ff <= state_next;

// field parameters latching

assign field_width_next  = (state_ff == IDLE) ? field_width_i  : field_width_ff;
assign field_height_next = (state_ff == IDLE) ? field_height_i : field_height_ff;

always_ff @(posedge clk) begin
    if(state_ff == IDLE) begin
        field_width_ff  <= field_width_next;
        field_height_ff <= field_height_next;
    end
end

always_ff @(posedge clk) begin
    if (state_ff == IDLE)
        mines_left_ff <= mines_count_i;
    else if (state_ff == WRITE_CELLS)
        mines_left_ff <= mines_left_ff - 'd1;
end

// coords generation and check

logic [CELL_X_WIDTH - 1 : 0] cell_x_ff;
logic [CELL_Y_WIDTH - 1 : 0] cell_y_ff;
logic [CELL_X_WIDTH - 1 : 0] cell_x_next;
logic [CELL_Y_WIDTH - 1 : 0] cell_y_next;


assign cell_x_next = random_num_ff [CELL_X_WIDTH - 1 : 0];
assign cell_y_next = random_num_ff [CELL_X_WIDTH + CELL_Y_WIDTH - 1 : CELL_X_WIDTH];

logic random_num_valid = (cell_x_next < field_width_ff)  & (cell_x_next != 'd0) & 
                         (cell_y_next < field_height_ff) & (cell_y_next != 'd0) & 
                         (game_field_o[cell_x_next][cell_y_next] != 'd9);

always_ff @(posedge clk)
    if (state_ff != WRITE_CELLS) begin
        cell_x_ff <= cell_x_next;
        cell_y_ff <= cell_y_next;
    end

always_ff @(posedge clk) begin
    if ((~rst) | (state_ff == IDLE)) begin
        for (int i = 0; i < MAX_CELL_HEIGHT; i = i + 1) begin
            for (int j = 0; j < MAX_CELL_WIDTH; j = j + 1) begin
                game_field_o[i][j] = 'd0;
            end 
        end
                
    end
    else if (state_ff == WRITE_CELLS) begin
        game_field_o[cell_x_ff][cell_y_ff] <= 'd9;

        game_field_o[cell_x_ff - 'd1][cell_y_ff - 'd1] <= (game_field_o[cell_x_ff - 'd1][cell_y_ff - 'd1] != 'd9) ? 
                                                           game_field_o[cell_x_ff - 'd1][cell_y_ff - 'd1] + 'd1   :
                                                           'd9;
        game_field_o[cell_x_ff - 'd1][cell_y_ff      ] <= (game_field_o[cell_x_ff - 'd1][cell_y_ff      ] != 'd9) ?
                                                           game_field_o[cell_x_ff - 'd1][cell_y_ff      ] + 'd1   :
                                                           'd9;
        game_field_o[cell_x_ff - 'd1][cell_y_ff + 'd1] <= (game_field_o[cell_x_ff - 'd1][cell_y_ff + 'd1] != 'd9) ?
                                                           game_field_o[cell_x_ff - 'd1][cell_y_ff + 'd1] + 'd1   :
                                                           'd9;
        game_field_o[cell_x_ff      ][cell_y_ff - 'd1] <= (game_field_o[cell_x_ff      ][cell_y_ff - 'd1] != 'd9) ?
                                                           game_field_o[cell_x_ff      ][cell_y_ff - 'd1] + 'd1   :
                                                           'd9;
        game_field_o[cell_x_ff      ][cell_y_ff + 'd1] <= (game_field_o[cell_x_ff      ][cell_y_ff + 'd1] != 'd9) ?
                                                           game_field_o[cell_x_ff      ][cell_y_ff + 'd1] + 'd1   :
                                                           'd9;
        game_field_o[cell_x_ff + 'd1][cell_y_ff - 'd1] <= (game_field_o[cell_x_ff + 'd1][cell_y_ff - 'd1] != 'd9) ?
                                                           game_field_o[cell_x_ff + 'd1][cell_y_ff - 'd1] + 'd1   :
                                                           'd9;
        game_field_o[cell_x_ff + 'd1][cell_y_ff      ] <= (game_field_o[cell_x_ff + 'd1][cell_y_ff      ] != 'd9) ?
                                                           game_field_o[cell_x_ff + 'd1][cell_y_ff      ] + 'd1   :
                                                           'd9;
        game_field_o[cell_x_ff + 'd1][cell_y_ff + 'd1] <= (game_field_o[cell_x_ff + 'd1][cell_y_ff + 'd1] != 'd9) ?
                                                           game_field_o[cell_x_ff + 'd1][cell_y_ff + 'd1] + 'd1   :
                                                           'd9;
    end
end

// finilization

assign fill_finished_o = state_ff == FINALIZE;

endmodule