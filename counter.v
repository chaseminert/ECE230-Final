module counter
#(
    parameter WIDTH = 8
)
(
    input clock,
    input reset,
    output reg [WIDTH-1:0] count 
);
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            count <= 'b0;
        end else begin
            count <= count + 1;
        end
    end
    
endmodule
