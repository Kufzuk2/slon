module game (
  //--------- Clock & Resets                     --------//
    input  wire           pixel_clk ,  // Pixel clock 36 MHz
    input  wire           rst_n     ,  // Active low synchronous reset
  //--------- Buttons                            --------//
    input  wire           button_c  ,
    input  wire           button_u  ,
    input  wire           button_d  ,
    input  wire           button_r  ,
    input  wire           button_l  ,
  //--------- Accelerometer                      --------//
    input  wire  [7:0]    accel_data_x         ,
    input  wire  [7:0]    accel_data_y         ,
    output logic [7:0]    accel_x_end_of_frame ,
    output logic [7:0]    accel_y_end_of_frame ,
  //--------- Pixcels Coordinates                --------//
    input  wire  [10:0]   h_coord   ,
    input  wire  [ 9:0]   v_coord   ,
  //--------- VGA outputs                        --------//
    output wire  [3:0]    red       ,  // 4-bit color output
    output wire  [3:0]    green     ,  // 4-bit color output
    output wire  [3:0]    blue      ,  // 4-bit color output
  //--------- Switches for background colour     --------//
    input  wire  [2:0]    SW        ,
  //--------- Regime                             --------//
    output wire  [1:0]    demo_regime_status
);

//------------------------- Variables                    ----------------------------//
  //----------------------- Regime control               --------------------------//
    wire              change_regime ;
    reg       [1:0]   regime_store  ;         // Two demonstration regimes
  //----------------------- Counters                     --------------------------//
    parameter         FRAMES_PER_ACTION = 2;  // Action delay
    logic     [31:0]  frames_cntr ;
    logic             end_of_frame;           // End of frame's active zone
  //----------------------- Accelerometr                 --------------------------//
    parameter     ACCEL_X_CORR = 8'd3;        // Accelerometer x correction
    parameter     ACCEL_Y_CORR = 8'd1;        // Accelerometer y correction
    wire   [7:0]  accel_data_x_corr  ;        // Accelerometer x corrected data
    wire   [7:0]  accel_data_y_corr  ;        // Accelerometer y corrected data
  //----------------------- Object (Stick)               --------------------------//
    //   0 1         X
    //  +------------->
    // 0|
    // 1|  P.<v,h>-> width
    //  |   |
    // Y|   |
    //  |   V heigh
    //  |
    //  V
    parameter     object_width  = 8  ;         // Horizontal width
    parameter     object_height = 20 ;         // Vertical height
    logic         object_draw        ;         // Is Sber Logo or demo object coordinate (with width and height)?
    logic [9:0]   object_h_coord     ;         // Object Point(P) horizontal coodrinate
    logic [9:0]   object_v_coord     ;         // Object Point(P) vertical coordinate
    logic [9:0]   object_h_speed     ;         // Horizontal Object movement speed
    logic [9:0]   object_v_speed     ;         // Vertical Object movement speed
  //----------------------- Sber logo timer              --------------------------//

    // Read only memory (ROM) for sber logo file
    wire  [11:0]  sber_logo_rom_out [12:0];
    wire  [10:0]  sber_logo_read_address;
//------------------------- End of Frame                 ----------------------------//
  // We recount game object once at the end of display counter //
  always_ff @( posedge pixel_clk ) begin
    if ( !rst_n )
      end_of_frame <= 1'b0;
    else
      end_of_frame <= (h_coord[9:0]==10'd799) && (v_coord==10'd599); // 799 x 599
  end
  always_ff @( posedge pixel_clk ) begin
    if ( !rst_n )
      frames_cntr <= 0;
    else if ( frames_cntr == FRAMES_PER_ACTION )
      frames_cntr <= 0;
    else if (end_of_frame)
      frames_cntr <= frames_cntr + 1;
  end

//------------------------- Regime control               ----------------------------//
  always @ ( posedge pixel_clk ) begin //Right now there are 2 regimes
    if ( !rst_n ) begin
      regime_store <= 2'b11;
    end
    else if (change_regime && (regime_store == 2'b10)) begin
      regime_store <= 2'b11;
    end
    else if ( change_regime ) begin
      regime_store <= regime_store - 1'b1;
    end
  end
  assign change_regime      = button_c    ;
  assign demo_regime_status = regime_store;

//------------------------- Accelerometr at the end of frame-------------------------//
  always @ ( posedge pixel_clk ) begin
    if ( !rst_n ) begin
      accel_x_end_of_frame <= 8'h0000000;
      accel_y_end_of_frame <= 8'h0000000;
    end
    else if ( end_of_frame && (frames_cntr == 0) ) begin
      accel_x_end_of_frame <= accel_data_x_corr;
      accel_y_end_of_frame <= accel_data_y_corr;
    end
  end
  // Accelerometr corrections
  assign accel_data_x_corr = accel_data_x + ACCEL_X_CORR;
  assign accel_data_y_corr = accel_data_y + ACCEL_Y_CORR;
//------------------------- Object movement in 2 regimes  ----------------------------//
  assign object_v_speed = 10'd1;
  assign object_h_speed = 10'd1;
  always @ ( posedge pixel_clk ) begin
    if ( !rst_n ) begin // Put object in the center
      object_h_coord <= 399;
      object_v_coord <= 299;
    end
    else if ( end_of_frame && (frames_cntr == 0) ) begin
      if (regime_store == 2'b11) begin  // Buttons regime
        if ( button_l ) begin           // Moving left
          if ( object_h_coord < object_h_speed)
            object_h_coord <= 0;
          else
            object_h_coord <= object_h_coord - object_h_speed;
        end
        else if ( button_r ) begin
          if ( object_h_coord + object_h_speed + object_width >= 10'd799 )
            object_h_coord <= 10'd799 - object_width;
          else
            object_h_coord <= object_h_coord + object_h_speed;
        end
        //
        if      ( button_u ) begin
          if ( object_v_coord < object_v_speed )
            object_v_coord <= 0;
          else
            object_v_coord <= object_v_coord - object_v_speed;
        end
        else if ( button_d  ) begin
          if ( object_v_coord + object_v_speed + object_height >= 10'd599 )
            object_v_coord <= 10'd599 - object_height;
          else
            object_v_coord <= object_v_coord + object_v_speed;
        end
      end
      else if (regime_store == 2'b10) begin  // Accelerometer regime
        if      ( !accel_data_y_corr[7] && ( accel_data_y_corr != 8'h00 )) begin
          if ( object_h_coord < object_h_speed)
            object_h_coord <= 0;
          else
            object_h_coord <= object_h_coord - object_h_speed;
        end
        else if ( accel_data_y_corr[7] && ( accel_data_y_corr != 8'h00 ) ) begin
          if ( object_h_coord + object_h_speed + object_width >= 10'd799 )
            object_h_coord <= 10'd799 - object_width;
          else
            object_h_coord <= object_h_coord + object_h_speed;
        end
        //
        if      ( accel_data_x_corr[7] && ( accel_data_x_corr != 8'h00 ) ) begin
          if ( object_v_coord < object_v_speed )
            object_v_coord <= 0;
          else
            object_v_coord <= object_v_coord - object_v_speed;
        end
        else if (!accel_data_x_corr[7] && ( accel_data_x_corr != 8'h00 ) )  begin
          if ( object_v_coord + object_v_speed + object_height >= 10'd599 )
            object_v_coord <= 10'd599 - object_height;
          else
            object_v_coord <= object_v_coord + object_v_speed;
        end
      end
    end
  end

//------------- Sber logo on reset                               -------------//
  //----------- SBER logo ROM                                    -----------//
    // Screen resoulution is 800x600, the logo size is 128x128. We need to put the logo in the center.
    // Logo offset = (800-128)/2=336 from the left edge; Logo v coord = (600-128)/2 = 236
    // Cause we need 1 clock for reading, we start erlier
    assign sber_logo_read_address = (h_coord - (h_coord >> 5)*11'd32) + (({1'd0,(v_coord + 10'd7) - (v_coord + 10'd7 >> 5)*10'd32}))*11'd32;

    //for picture with size 128x128 we need 16384 pixel information

  localparam int unsigned MAX_CELL_WIDTH  = 25;
  localparam int unsigned MAX_CELL_HEIGHT = 17;
  localparam int unsigned CELL_X_WIDTH = $clog2(MAX_CELL_WIDTH);
  localparam int unsigned CELL_Y_WIDTH = $clog2(MAX_CELL_HEIGHT);

  logic [3:0] cells_state [MAX_CELL_WIDTH - 1 : 0][MAX_CELL_HEIGHT - 1 : 0];
  logic [1:0] cells_vis [MAX_CELL_WIDTH - 1 : 0][MAX_CELL_HEIGHT - 1 : 0];
  logic [CELL_X_WIDTH - 1 : 0] player_x;
  logic [CELL_Y_WIDTH - 1 : 0] player_y;

  game_fsm #(
    .MAX_CELL_WIDTH(MAX_CELL_WIDTH), .MAX_CELL_HEIGHT(MAX_CELL_HEIGHT)
  ) game_logic (
    .clk (pixel_clk), 
    .rst (rst_n),

    .button_c_short (button_c), 
    .button_c_long  (1'b0),

    .button_u (button_u),
    .button_d (button_d),
    .button_r (button_r),
    .button_l (button_l),

    .field_width_i  ('d25),
    .field_height_i ('d16),
    .mines_count_i  ('d72),

    .cells_state_o (cells_state),
    .cells_vis_o   (cells_vis),
    .player_x_o    (player_x),
    .player_y_o    (player_y)
  );

    tile_rom tile_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[0]      ) 
    );
    tile_flag_rom tile_flag_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[1]    ) 
    );
    one_rom one_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[2]    ) 
    );
    two_rom two_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[3]    ) 
    );
    tree_rom tree_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[4]    ) 
    );
    four_rom four_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[5]    ) 
    );
    five_rom five_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[6]    ) 
    );
    six_rom six_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[7]    ) 
    );
    seven_rom seven_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[8]    ) 
    );
    eight_rom eight_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[9]    ) 
    );
    tile_mine_rom tile_mine_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[10]    ) 
    );
        tile_mine_exp_rom tile_mine_exp_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[11]    ) 
    );
        tile_empty_rom tile_empty_rom (
      .addr ( sber_logo_read_address ),
      .word ( sber_logo_rom_out[12]    ) 
    );
//____________________________________________________________________________//
wire [155:0] mask;
reg  [155:0] sber_logo_rom_out_mask = 156'b0;
assign mask = 156'b1111_1111_1111 << 5*12;

always @(posedge pixel_clk) begin
  sber_logo_rom_out_mask <= (mask & {sber_logo_rom_out[12],sber_logo_rom_out[11],
                                     sber_logo_rom_out[10], sber_logo_rom_out[9],
                                     sber_logo_rom_out[8], sber_logo_rom_out[7],
                                     sber_logo_rom_out[6], sber_logo_rom_out[5],
                                     sber_logo_rom_out[4],sber_logo_rom_out[3],
                                     sber_logo_rom_out[2],sber_logo_rom_out[1],
                                     sber_logo_rom_out[0]}) >> 5*12;
end

//------------- RGB MUX outputs                                  -------------//
  always_comb begin
      object_draw = /*(h_coord[9:0] >= 10'd0) & */(h_coord[9:0] < 10'd799) & (v_coord >= 10'd88) & (v_coord < 10'd599) /*& ~(sber_logo_rom_out[10:0]==11'h000)*/ ; // Logo size is 128x128 Pixcels
  end

  assign  red     = object_draw ? (sber_logo_rom_out_mask[3:0]  ) : (SW[0] ? 4'h8 : 4'h0);
  assign  green   = object_draw ? (sber_logo_rom_out_mask[7:4]  ) : (SW[1] ? 4'h8 : 4'h0);
  assign  blue    = object_draw ? (sber_logo_rom_out_mask[11:8] ) : (SW[2] ? 4'h8 : 4'h0);
//____________________________________________________________________________//
endmodule
