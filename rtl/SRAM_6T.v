module SRAM_6T (
    input  wire WL,
    input  wire BL,
    input  wire BLB,
    input  wire VDD,
    input  wire GND,
    output reg  Q,
    output reg QB
);

always @(*) begin

    if (VDD == 1'b1) begin

        // Write operation
        if (WL == 1'b1) begin

            if (BL == 1'b1 && BLB == 1'b0) begin
                Q  = 1'b1;
                QB = 1'b0;
            end

            else if (BL == 1'b0 && BLB == 1'b1) begin
                Q  = 1'b0;
                QB = 1'b1;
            end

        end

        // Hold operation
        else begin
            Q  = Q;
            QB = QB;
        end
    end

    else begin
        Q  = 1'bx;
        QB = 1'bx;
    end

end

endmodule
