module top (

input [15:0] sw,  //operation select
input btnC,   // button operation rising edge clock
input btnU,
input clk,
output [15:0] led,
output [6:0] seg,
output [3:0] an
);

wire div_clock_wire;

wire reset;
assign reset = btnU;


wire [7:0] sw_input_data;
assign sw_input_data = sw[15:8];

wire[3:0] operation_select;
assign operation_select = sw[3:0];


reg [7:0] Y;
reg [7:0] A, B;  //signed 8 bit register for A and B
reg [7:0] tmp;
wire [7:0] adder_output;
wire [7:0] sub_output;
wire [7:0] twos_comp_output;

wire[3:0] y_lower_four;
assign y_lower_four = Y[3:0];

wire[3:0] y_upper_four;
assign y_upper_four = Y[7:4];

assign led[15:8] = A; 

assign led[7:0] = B; 

clock_div div_clock(
    .clock(clk),
    .reset(btnC),
    .div_clock(div_clock_wire)
);

seven_seg_scanner scanner(
    .div_clock(div_clock_wire),
    .reset(btnC),
    .anode(an)
);

seven_seg_decoder decoder(
    .Y_upper_four(y_upper_four),
    .Y_lower_four(y_lower_four),
    .operation_selector(operation_select),
    .anode(anode),
    .segs(seg)
);

eight_bit_adder add(
    .A(A),
    .B(B),
    .Sum(adder_output)
);

eight_bit_sub sub(
    .A(A),
    .B(B),
    .Y(sub_output)
);

twos_complement comp(
    .Input(A),
    .Output(twos_comp_output)
);


always @(posedge btnC or posedge reset)begin
    if(reset) begin

    A <= 8'b0;
    B <= 8'b0;
    Y <= 8'b0;

    end else begin
        case(operation_select)

        4'd0: Y = adder_output;
        4'd1: Y = sub_output;
        4'd2: Y = A << 1; //shift left
        4'd3: Y = A >> 1; //shift right
        4'd4: begin
            if (A == B) begin
                Y <= 0;
            end else if (A > B) begin
                Y <= 1;
            end else begin
                Y <= -1;
            end
        end
        4'd5: Y <= A & B;
        4'd6: Y <= A | B;
        4'd7: Y <= A ^ B;
        4'd8: Y <= ~(A & B);
        4'd9: Y <= ~(A | B);
        4'd10: Y <= ~(A ^ B);
        4'd11: Y <= ~A;
        4'd12: Y <= twos_comp_output;
        4'd13: A <= Y;
        4'd14: begin
            tmp <= A;
            A <= B;
            B <= tmp;
        end
        4'd15: A <= sw_input_data;
        endcase

    end

end







endmodule