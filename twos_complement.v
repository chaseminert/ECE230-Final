module twos_complement(
    input [7:0] Input,   
    output [7:0] Output  
);

    wire [7:0] ones_comp;
    wire [7:0] sum;       
    wire [7:0] carry;     

    assign ones_comp = ~Input;


    full_adder fa0(
        .A(ones_comp[0]),
        .B(1'b1),          
        .Cin(1'b0),       
        .Sum(sum[0]),
        .Cout(carry[0])
    );

    full_adder fa1(
        .A(ones_comp[1]),
        .B(1'b0),          
        .Cin(carry[0]),    
        .Sum(sum[1]),
        .Cout(carry[1])
    );

    full_adder fa2(
        .A(ones_comp[2]),
        .B(1'b0),          
        .Cin(carry[1]),    
        .Sum(sum[2]),
        .Cout(carry[2])
    );

    full_adder fa3(
        .A(ones_comp[3]),
        .B(1'b0),          
        .Cin(carry[2]),    
        .Sum(sum[3]),
        .Cout(carry[3])
    );

    full_adder fa4(
        .A(ones_comp[4]),
        .B(1'b0),         
        .Cin(carry[3]),   
        .Sum(sum[4]),
        .Cout(carry[4])
    );

    full_adder fa5(
        .A(ones_comp[5]),
        .B(1'b0),          
        .Cin(carry[4]),   
        .Sum(sum[5]),
        .Cout(carry[5])
    );

    full_adder fa6(
        .A(ones_comp[6]),
        .B(1'b0),          
        .Cin(carry[5]),    
        .Sum(sum[6]),
        .Cout(carry[6])
    );

    full_adder fa7(
        .A(ones_comp[7]),
        .B(1'b0),          
        .Cin(carry[6]),    
        .Sum(sum[7]),
        .Cout(carry[7])
    );

    // Assign the sum to the output
    assign Output = sum;

endmodule