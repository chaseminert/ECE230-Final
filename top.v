module top (

input [15:0] sw,  //operation select
input btnC,   // button operation rising edge clock
input clk,
output [15:0] led,
output reg [6:0] seg,
output reg [3:0] an,
);

wire div_clock_wire;


wire [7:0] sw_input_data;
assign sw_input_data = sw[15:8];

wire[3:0] operation_select;
assign operation_select = sw[3:0];

wire[7:0] led_A;
assign led[15:8] = led_A; 

wire[7:0] led_B;
assign led[7:0] = led_B; 

reg [7:0] Y;
reg [7:0] A, B;  //signed 8 bit register for A and B
reg [7:0] tmp;
wire [7:0] adder_output;
wire [7:0] sub_output;
wire [7:0] twos_comp_output

clock_div div_clock(
    .clock(clk),
    .reset(btnC),
    .div_clock(div_clock_wire);
)

eight_bit_adder add(
    .A(A),
    .B(B),
    .Sum(full_adder_output)
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
        case(sw)

        4'd0: Y = full_adder_output;
        4'd1: Y = sub_output;
        4'd2: Y = << 1; //shift left
        4'd3: Y = >> 1; //shift right
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
        4'd8: Y <= A ~& B;
        4'd9: Y <= A ~| B;
        4'd10: Y <= A ~^ B;
        4'd11: Y <= ~A;
        4'd12: Y <= twos_comp_output;
        4'd13: A <= Y;
        4'd14: begin
            B <= A;
            A <= B; 
        end
        4'd15: A <= sw_input_data;
        endcase


end

end

assign led[]









endmodule