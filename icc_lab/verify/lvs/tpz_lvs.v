module PADIN(PAD,C);
input PAD;
output C; 
endmodule

module PADBI(PAD,OEN,C,I);
inout PAD;
input OEN;
output C;
input I; 
endmodule

module PADIOVDD(VDDIO);
inout VDDIO;
endmodule

module PADIOVSS(VSSIO);
inout VSSIO;
endmodule

module PADVDD(VDD);
inout VDD;
endmodule

module PADVSS(VSS);
inout VSS;
endmodule

module PADIOVDDPOC(VDDIO);
inout VDDIO;
endmodule
