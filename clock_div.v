module clock_div
#(
    parameter BIT_COUNT = 17
)
(
    input clock,
    input reset,
    output reg div_clock
);
    reg intreset;
    wire [16:0] intcount;

    counter #(.WIDTH(BIT_COUNT)) count(
        .clock(clock),
        .reset(intreset),
        .count(intcount)
    );

    // Want to create logic that
    // is synchronous to the rest
    // and count signals
    always @(reset, intcount) begin
        if (reset) begin
            // If we get reset, pass it through
            // to the counter
            // and reset out clock output
            intreset = 1;
            div_clock = 0;
        end else if (intcount == 100000) begin
            // Otherwise, if the count is equal
            // to our tickover point, then we
            // need to reset the counter and
            // toggle our output
            intreset = 1;
            div_clock = ~div_clock;
        end else begin
            // Otherwise, just let it count
            intreset = 0;
        end
        
    end


endmodule