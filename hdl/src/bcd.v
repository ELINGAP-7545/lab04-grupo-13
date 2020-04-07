module bcd (DataBus,Bcd1,Bcd2,Bcd3,Bcd4);

input [13:0] DataBus;// entrada de la suma, resuñtado de 14bits

//salidas que van a cada bcd conversor 7 segmentos
output [3:0] Bcd1;//unidades
output [3:0] Bcd2;//decenas
output [3:0] Bcd3;//centenas
output [3:0] Bcd4;//unidades de mil

always @ ( * ) begin


Data=DataBus;
Bcd4=DataBus/1000;
Bcd3=(DataBus%1000)/100;
Bcd2=(DataBus%1100)/10;
Bcd1=(DataBus%1110);


end

endmodule 
