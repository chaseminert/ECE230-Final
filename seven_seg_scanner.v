module seven_seg_scanner(
    input div_clock,
    input reset,
    output reg [3:0] anode
);

    reg [1:0] count;

    always @(posedge div_clock or posedge reset)
    begin
        if (reset)
        begin
            count <= 2'b00;
        end
        else
        begin
            count <= count + 1;
            if (count == 2'd3)
            begin
                count <= 2'd0;
            end
        end
    end

    always @(*) begin
        case (count)
            4'd0: anode = 4'b1110;
            4'd1: anode = 4'b1101;
            4'd2: anode = 4'b1011;
            4'd3: anode = 4'b0111;
        endcase
    end

    // This block should count through from zero to three, and only activate one
    // anode at a time in the seven segment displays. Keep in mind THEY ARE
    // INVERSE DRIVE, that is that 0 is on 1 is off

    // The reset line should set things back to segment 0

    // Anodes are:
    // 0: R
    // 1: RC
    // 2: LC
    // 3: L

endmodule