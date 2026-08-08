`timescale 1ns/1ps

module MUX_8_to_1_tb;

reg  [7:0] D;
reg  [2:0] S;
wire       Y;

reg expected;
integer i;

MUX_8_to_1 uut (
    .D(D),
    .S(S),
    .Y(Y)
);

initial begin

    $dumpfile("waveform.vcd");
    $dumpvars(0, MUX_8_to_1_tb);

    $display("==========================================");
    $display("       8x1 MUX VERIFICATION");
    $display("==========================================");

    // Test Pattern 1
    D = 8'b10101010;

    for (i = 0; i < 8; i = i + 1) begin
        S = i;
        #10;

        expected = D[i];

        if (Y === expected)
            $display("PASS: D=%b S=%b Y=%b",
                     D, S, Y);
        else
            $display("FAIL: D=%b S=%b Y=%b Expected=%b",
                     D, S, Y, expected);
    end

    // Test Pattern 2
    D = 8'b11001100;

    for (i = 0; i < 8; i = i + 1) begin
        S = i;
        #10;

        expected = D[i];

        if (Y === expected)
            $display("PASS: D=%b S=%b Y=%b",
                     D, S, Y);
        else
            $display("FAIL: D=%b S=%b Y=%b Expected=%b",
                     D, S, Y, expected);
    end

    $display("==========================================");
    $display("       SIMULATION COMPLETED");
    $display("==========================================");

    $finish;
end

endmodule
