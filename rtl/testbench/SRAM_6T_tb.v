`timescale 1ns/1ps

module SRAM_6T_tb;

reg WL;
reg BL;
reg BLB;
reg VDD;
reg GND;

wire Q;
wire QB;

SRAM_6T DUT (
    .WL(WL),
    .BL(BL),
    .BLB(BLB),
    .VDD(VDD),
    .GND(GND),
    .Q(Q),
    .QB(QB)
);

initial begin

    VDD = 1'b1;
    GND = 1'b0;

    // Initial condition
    WL  = 1'b0;
    BL  = 1'b0;
    BLB = 1'b1;

    #10;

    // Write 1
    WL  = 1'b1;
    BL  = 1'b1;
    BLB = 1'b0;

    #10;

    // Hold
    WL  = 1'b0;

    #10;

    // Write 0
    WL  = 1'b1;
    BL  = 1'b0;
    BLB = 1'b1;

    #10;

    // Hold
    WL = 1'b0;

    #10;

    $finish;

end

endmodule
