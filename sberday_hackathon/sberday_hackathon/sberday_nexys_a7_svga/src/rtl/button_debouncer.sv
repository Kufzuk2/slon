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
  output reg      sw_long
);

reg   [1:0] sw_r;
always @ ( posedge clk or negedge arst_n ) begin //2 stage FF synchronizer (we use it to synchronize pussing with clk)
  if ( !arst_n )
    sw_r <= {2{UNPUSHED_STATE}};
  else
    sw_r <= {sw_r[0], sw_i};
end

reg [CNT_WIDTH-1:0] sw_count;

wire sw_change_f = (sw_state_o != sw_r[1]);
wire sw_cnt_max  = &sw_count;

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
  else begin
    sw_count <= 0;
  end
 end

always @(posedge clk) begin
  sw_down_o <= sw_change_f & sw_cnt_max & ~sw_state_o;
  sw_up_o   <= sw_change_f & sw_cnt_max &  sw_state_o;
end

localparam LONG_SIZE = $clog2(HALF_MS);
reg [LONG_SIZE - 1: 0] long_cnt;


always @(posedge clk) begin
    if (!arst_n)
        long_cnt <= 0;
    else
        long_cnt <= sw_state_o ? long_cnt + 1 : 0;
end


always @(posedge clk) begin
    if (!arst_n)
        sw_long <= 0;
    else
        sw_long <= (long_cnt == HALF_MS) ? 1: sw_long;
end

endmodule
