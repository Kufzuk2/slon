module random_generator (
    input logic clk,
    
    input logic [31:0] seed_i,
    input logic        seed_v,

    output logic [31:0] random_o
);

logic next_bit = random_o[31] ^
                 random_o[30] ^
                 random_o[29] ^
                 random_o[27] ^
                 random_o[25] ^
                 random_o[ 0]; 

always_ff @(posedge clk) begin
    if (!rst)
        random_o <= 32'h00000001;
    else if (seed_v)
        random_o <= seed_i;
    else
        random_o <= {next_bit, random_o[31:1]};
end

endmodule