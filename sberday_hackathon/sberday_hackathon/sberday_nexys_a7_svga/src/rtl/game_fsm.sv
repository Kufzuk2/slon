module game_fsm #(
    parameter int unsigned MAX_CELL_WIDTH =  30,
    parameter int unsigned MAX_CELL_HEIGHT = 16,
    localparam int unsigned CELL_X_WIDTH = $clog2(MAX_CELL_WIDTH),
    localparam int unsigned CELL_Y_WIDTH = $clog2(MAX_CELL_HEIGHT),
    localparam int unsigned CELL_COUNT = MAX_CELL_WIDTH * MAX_CELL_HEIGHT,
    localparam int unsigned MINES_COUNT = CELL_COUNT / 4,
    localparam int unsigned MINES_COUNT_FF_WIDTH = $clog2(CELL_COUNT / 4), 
)
(
    input logic clk,
    input logic rst,

    input logic button_c_short,
    input logic button_c_long,

    input logic button_u,
    input logic button_d,
    input logic button_r,
    input logic button_l,

    input logic [CELL_X_WIDTH - 1 : 0] field_width_i,
    input logic [CELL_Y_WIDTH - 1 : 0] field_height_i,
    input logic [MINES_COUNT_FF_WIDTH - 1 : 0] mines_count_i,

    output logic [3:0] cells_state_o [MAX_CELL_WIDTH - 1 : 0][MAX_CELL_HEIGHT - 1 : 0],
    output vis_state cells_vis_o [MAX_CELL_WIDTH - 1 : 0][MAX_CELL_HEIGHT - 1 : 0],
    output logic [CELL_X_WIDTH - 1 : 0] player_x_o,
    output logic [CELL_Y_WIDTH - 1 : 0] player_y_o
);

logic [3:0] cell_state_ff [MAX_CELL_WIDTH - 1 : 0][MAX_CELL_HEIGHT - 1 : 0];
// 0 - fully empty cell, no mines around
// 1
//...
// 9 - digits around cell with mines in asshole
//10 - mine

typedef enum logic[1:0] { CELL_CLOSE, CELL_OPEN, CELL_FLAG } vis_state;

vis_state cell_vis_ff   [MAX_CELL_WIDTH - 1 : 0][MAX_CELL_HEIGHT - 1 : 0]; 
// 00 - closed cell
// 01 - open cell
// 10 - flag
// 11 - player

assign cells_state_o = cell_state_ff;
assign cells_vis_o   = cell_vis_ff;

logic [CELL_X_WIDTH - 1 : 0] field_width_ff;
logic [CELL_Y_WIDTH - 1 : 0] field_height_ff;
logic [MINES_COUNT_FF_WIDTH - 1 : 0] mines_count_ff;

logic move_button_clicked;
logic open_cell_clicked;
logic flag_clicked;

assign move_button_clicked = button_u | button_d | button_l | button_r;
assign open_cell_clicked = button_c_long;
assign flag_clicked = button_c_short;

logic [CELL_X_WIDTH - 1 : 0] player_x_ff;
logic [CELL_Y_WIDTH - 1 : 0] player_y_ff;

logic [CELL_X_WIDTH - 1 : 0] player_x_next;
logic [CELL_Y_WIDTH - 1 : 0] player_y_next;
logic player_coord_en;



// gameplay state machine

typedef enum logic [2:0] 
{
    GAME_START  ,
    FIELD_GEN   ,
    IDLE        ,
    CURSOR_MOVE ,
    OPEN_CELL   ,
    FLAG_PUT    ,
    GAME_WIN    ,
    GAME_LOSE
} game_state;

game_state game_state_ff;
game_state game_state_next;

always_comb begin
    game_state_next = game_state_ff;

    case (game_state_ff)
    GAME_START:  if (button_c) game_state_next = FIELD_GEN;
    FIELD_GEN:   if (field_generated) game_state_next = IDLE; 
    IDLE:             if (move_button_clicked)  game_state_next = CURSOR_MOVE;
                 else if (open_cell_clicked)    game_state_next = OPEN_CELL;
                 else if (flag_clicked)         game_state_next = FLAG_PUT;
    CURSOR_MOVE: game_state_next = IDLE;
    FLAG_PUT:    game_state_next = IDLE;
    OPEN_CELL: 
    endcase
end

always_ff @(posedge clk) 
    if (!rst)
        game_state_ff <= GAME_START;
    else
        game_state_ff <= game_state_next;

// field filling stage

logic field_generate_start_next;
logic field_generate_start_ff;

field_filler #(
    .MAX_CELL_WIDTH(MAX_CELL_WIDTH), .MAX_CELL_HEIGHT(MAX_CELL_HEIGHT)
) miner 
(
    .clk(clk), 
    .rst(rst), 
    .game_field_o(cell_state_ff),  
    .mines_count_i(mines_count_ff), 
    .field_width_i(field_width_ff), 
    .field_height_i(field_height_ff),
    .fill_start_i(field_generate_start_ff),
    .fill_finished_o(field_generated),
);

assign field_generate_start_next = (game_state_ff   == GAME_START) & 
                                   (game_state_next == FIELD_GEN );

always_ff @(posedge clk)
    if (!rst)
        field_generate_start_ff <= 'b0;
    else
        field_generate_start_ff <= field_generate_start_next;

always_ff @(posedge clk) begin
    if (game_state_next == FIELD_GEN) begin
       field_width_ff  <= field_width_i;
       field_height_ff <= field_height_i;
       mines_count_ff  <= mines_count_i; 
    end
end

//// gameplay stage

//player move stage
always_comb begin
    player_x_next = player_x_ff;

    if (field_generate_start_ff) 
        player_x_next = field_width_ff >> 1;
    else if (button_l)
        player_x_next = ((player_x_ff == 0) ? field_width_ff : player_x_ff) - 'd1;
    else if (button_r)
        player_x_next = (player_x_ff != (field_width_ff - 'd1)) ? (field_width_ff + 'd1) : 'd0; 
end 

always_comb begin
    player_y_next = player_y_ff;

    if (field_generate_start_ff) 
        player_y_next = field_height_ff >> 1;
    else if (button_d)
        player_y_next = ((player_y_ff == 0) ? field_height_ff : player_y_ff) - 'd1;
    else if (button_u)
        player_y_next = (player_y_ff != (field_height_ff - 'd1)) ? (field_height_ff + 'd1) : 'd0; 
end 

assign player_coord_en = (game_state_ff == CURSOR_MOVE) | field_generate_start_ff;

always_ff @(posedge clk) begin
    if (player_coord_en) begin
        player_x_ff <= player_x_next;
        player_y_ff <= player_y_next;
    end
end

assign player_x_o = player_x_ff;
assign player_y_o = player_y_ff;

vis_state cell_vis_next;
vis_state cell_vis_curr;
assign cell_vis_curr = cell_vis_ff[player_x_ff][player_y_ff];

always_comb begin
    cell_vis_next = cell_vis_curr;

    case (game_state_ff) 
        FLAG_PUT: if (cell_vis_curr == CELL_CLOSE)     cell_vis_next = CELL_FLAG;
                  else if (cell_vis_curr == CELL_FLAG) cell_vis_next = CELL_CLOSE;
        OPEN_CELL: if (cell_vis_curr == CELL_CLOSE) cell_vis_next = CELL_OPEN;
    endcase
end

always_ff @(posedge clk) begin
    if (rst | game_state_ff == GAME_START) begin
        generate
            for (genvar i = 0; i < MAX_CELL_HEIGHT; i = i + 1) begin
                for (genvar j = 0; j < MAX_CELL_WIDTH; j = j + 1) begin
                    cell_vis_ff[i][j] <= 'd0;
                end 
            end
        endgenerate
    end
    else if (game_state_ff == FLAG_PUT | game_state_ff == OPEN_CELL)
        cell_vis_ff[player_x_ff][player_y_ff] <= cell_vis_next;
end

// TODO: NEED A LOT OF TODO, WILL THINK MORE ACCURATELLY ABOUT GAME FSM CONTROLLER 

endmodule