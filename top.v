module top (

input [3:0] sw,  //operation select
input [15:8] sw_input_data, //8 bit input data
input btnC,   // button operation rising edge clock
output reg [15:8] led_A,  
output reg [7:0] led_B, 
output reg [6:0] segs,
output reg [3:0] an

);


reg [7:0] A, B;  //signed 8 bit register for A and B
reg [7:0] Y;     //Output register for result



always @(posedge btnC | posedge reset)begin
    if(reset) begin

    A <= 8'b0;
    B <= 8'b0;
    Y <= 8'b0;

    end else begin
        case(sw)

        4'b0000: Y = //call full adder
        4'b0001: Y = //call subtractor
        4'b0010: Y = << 1; //shift left
        4'b0011: Y = >> 1; //shift right


        endcase


end

end









endmodule