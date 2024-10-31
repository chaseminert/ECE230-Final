module eight_bit_adder (
    input [7:0] A,    
    input [7:0] B,    
    output [7:0] Sum,   
    output Cout         
);
    wire [6:0] carry;   

    // First full adder
    full_adder FA0 (
        .A(A[0]), 
        .B(B[0]), 
        .Cin(1'b0), 
        .Sum(Sum[0]), 
        .Cout(carry[0])
    );

    genvar i;
    generate
        for (i = 1; i < 7; i = i + 1) begin : full_adders
            full_adder FA (
                .A(A[i]), 
                .B(B[i]), 
                .Cin(carry[i-1]), 
                .Sum(Sum[i]), 
                .Cout(carry[i])
            );
        end
    endgenerate

    full_adder FA7 (
        .A(A[7]), 
        .B(B[7]), 
        .Cin(carry[6]), 
        .Sum(Sum[7]), 
        .Cout(Cout)
    );

endmodule
