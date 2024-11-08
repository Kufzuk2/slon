module button_debouncer #(
  parameter    CNT_WIDTH      = 16,
  parameter    UNPUSHED_STATE = 1'b0,
  parameter    HALF_MS        =  'd12500000



)(
  input  wire     clk         ,
  input  wire     arst_n      ,
  input  wire     sw_i        ,
  output reg      sw_state_o  ,
  output reg      sw_down_o   ,
  output reg      sw_up_o     ,
  output reg      short_tact  ,
  output reg      long_tact 

);
reg sw_long;

localparam LONG_SIZE = $clog2(HALF_MS);
reg [LONG_SIZE - 1: 0] counter;
reg   [1:0] sw_r;


always @ ( posedge clk or negedge arst_n ) begin //2 stage FF synchronizer (we use it to synchronize pussing with clk)
  if ( !arst_n )
    sw_r <= {2{UNPUSHED_STATE}};
  else
    sw_r <= {sw_r[0], sw_i};
end



reg [10: 0] neg_cnt;
always @( posedge clk or negedge arst_n  ) begin
    if ( !arst_n )
        neg_cnt <= 0;
    else
        neg_cnt <= ~sw_state_o ? neg_cnt + 1 : 0;
end
    wire enough_neg;
    assign enough_neg = (neg_cnt == 10'h3ff);


reg [CNT_WIDTH-1:0] sw_count;

/*
wire [CNT_WIDTH - 1: 0]         s1 = counter[CNT_WIDTH - 1: 0];
wire [LONG_SIZE - 1: CNT_WIDTH] s2 = counter[LONG_SIZE - 1: CNT_WIDTH];


wire right_1     = &counter[CNT_WIDTH - 1: 0];

wire left_0      = (counter[LONG_SIZE - 1: CNT_WIDTH] == 0);
wire sw_cnt_max2  = right_1 & left_0;
*/


wire sw_change_f = (sw_state_o != sw_r[1]);
wire sw_cnt_max  = &sw_count[CNT_WIDTH - 1: 0];






always @( posedge clk or negedge arst_n  ) begin
  if ( !arst_n ) begin
    sw_count   <= 0;
    sw_state_o <= UNPUSHED_STATE;
  end
  else if(sw_change_f) begin
    sw_count <= sw_count + 'd1;
    if ( sw_cnt_max )
      sw_state_o <= ~sw_state_o;
  end
  else
      sw_count <= 0;
 end

always @(posedge clk) begin
  sw_down_o <= sw_change_f & sw_cnt_max & ~sw_state_o;
  sw_up_o   <= sw_change_f & sw_cnt_max &  sw_state_o;
end



always @(posedge clk) begin
    if (!arst_n)
        counter <= 0;
    else
        counter <= (sw_state_o & ~(counter == HALF_MS))  |  sw_change_f  ? counter + 1 :
                   (~sw_state_o) | (sw_state_o & (counter == 16'hffff) & sw_change_f) ? 0: counter;
end


always @(posedge clk) begin
    if (!arst_n)
        sw_long <= 0;
    else
        sw_long <= (counter == HALF_MS) ? 1: 
                    sw_state_o ? sw_long : 0;
end


reg short_was;
    
always @(posedge clk) begin
    if (!arst_n)
        short_tact <= 0;
    else
        short_tact <= (short_was & enough_neg) ? 1: 0;

end

always @(posedge clk) begin
    if (!arst_n)
        short_was <= 0;
    else
        short_was <= ((~sw_state_o) & (counter == 16'hffff) & sw_change_f) ? 1: 
                     (short_was & enough_neg) | ((~sw_long) & (counter == HALF_MS)) ? 0 : short_was;
end


always @(posedge clk) begin
    if (!arst_n)
        long_tact <= 0;
    else
        long_tact <= ((~sw_long) & (counter == HALF_MS)) ? 1: 0;
end

endmodule
