module eight_bit_sub(
    input[7:0] A,
    input[7:0] B,
    output[7:0] Y
);

wire[7:0] twos_comp;

twos_complement twos_comp (
    .Input(B),
    .Output(twos_comp)
);

eight_bit_adder add (
    .A(A),
    .B(twos_comp),
    .Sum(Y)
);


endmodule