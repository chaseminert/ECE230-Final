module alu (

input [3:0] sw,  //operation select
input [15:8] sw_input_data, //8 bit input data
input btnC,   // button operation rising edge clock
output reg [15:8] led_A,  
output reg [7:0] led_B, 
output reg [6:0] segs,
output reg [3:0] an

);


reg signed [7:0] A, B;  //signed 8 bit register for A and B
reg signed [7:0] Y;     //Output register for result











endmodule