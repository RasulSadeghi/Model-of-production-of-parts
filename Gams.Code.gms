sets
         i production rate /1,2,3/
         j machines /1,2,3,4/
         ;
parameter
         n(i) Minimum production rate /1 100 ,2 150,3 100/;
scalar
         T Weekly working hours /2640/ ;
*2640 = 44*60 *



table c(i,j) The time of production of parts by lathes
         1       2       3       4
1        5       7       4       10
2        6       12      8       15
3        13      14      9       17 ;

table Cp(i,j) Profit per piece produced by machines
         1       2       3       4
1        10      8       6       9
2        18      20      15      17
3        15      16      13      17 ;


variable
Z;
positive variable
x;
equations
Obj
co1(j)
co2(i);

obj              .. z =e= sum((i,j),x(i,j)*Cp(i,j));
co1(j)           ..sum(i,x(i,j)*c(i,j)) =l= T    ;
co2(i)           ..sum(j,x(i,j)) =g= n(i)   ;

model test /all/
solve test using lp max z;
display z.l,obj.l,x.l;





