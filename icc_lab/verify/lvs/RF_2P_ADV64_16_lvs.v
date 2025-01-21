module RF_2P_ADV64_16 (
                QA,
                CLKA,
                CENA,
                AA,
                CLKB,
                CENB,
                AB,
                DB,
                EMAA,
                EMAB
                );
	
   output [15:0]            QA;
   input                    CLKA;
   input                    CENA;
   input [5:0]              AA;
   input                    CLKB;
   input                    CENB;
   input [5:0]              AB;
   input [15:0]             DB;
   input [2:0]              EMAA;
   input [2:0]              EMAB;

endmodule
