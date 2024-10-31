module full_adder (
    // Declare inputs
    input A,
    input B,
    input Cin,
    // Declare outputs
    output Sum,
    output Cout
);

    wire S1, C1, C2;

    // First half adder
    adder ha1 (
        .A(A),
        .B(B),
        .Y(S1),
        .Carry(C1)
    );

    // Second half adder
    adder ha2 (
        .A(S1),
        .B(Cin),
        .Y(Sum),
        .Carry(C2)
    );

    assign Cout = C1 | C2;

endmodule