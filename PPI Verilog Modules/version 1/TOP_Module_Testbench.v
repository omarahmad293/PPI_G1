module tompmodule_testbench();

reg [1:0]A;
reg READ,WRITE,CS,RESET;

wire [7:0]DATA;
wire [7:0]PortA;
wire [7:0]PortB;
wire [7:0]PortC;

reg [7:0]DATA_reg;
reg [7:0]PortA_reg;
reg [7:0]PortB_reg;
reg [7:0]PortC_reg;

assign DATA = DATA_reg;
assign PortA = PortA_reg;
assign PortB = PortB_reg;
assign PortC = PortC_reg;


initial
begin
$monitor($time,,"CS=%b Reset=%b A=%b read=%b write=%b DATA=%d Port A=%d Port B=%d Port C=%d",
CS,RESET,A,READ,WRITE,DATA,PortA,PortB,PortC);
#5
RESET<=1;
#10
RESET<=0;
CS<=0;
A<=11;
WRITE<=0;
READ<=1;
DATA_reg<=8'b1001_1011;
PortA_reg<=10;
PortB_reg<=20;
PortC_reg<=30;


#20
A<=00;
//DATA_reg <= 14;

#5
A<= 01;
#5
A<= 10;

#5
A<=00;

#30
CS<=0;
A<=10;
WRITE<=1;
READ<=0;


#40
RESET<=0;

#50
CS<=0;
A<=01;
WRITE<=1;
READ<=0;


#60
CS<=0;
A<=01;
WRITE<=1;
READ<=0;


end

//PPI_8255 PPI(A,READ,WRITE,CS,RESET,DATA,PortA,PortB,PortC);
Top_Module_v2 T(A,READ,WRITE,CS,RESET,DATA,PortA,PortB,PortC);
endmodule 