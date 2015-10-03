///point_in_triangle(x1,y1,x2,y2,x3,y3,x4,y4)
var a, b, c;
a = (argument0 - argument6)*(argument3 - argument7) - (argument2 - argument6)*(argument1 - argument7);
b = (argument2 - argument6)*(argument5 - argument7) - (argument4 - argument6)*(argument3 - argument7);
c = (argument4 - argument6)*(argument1 - argument7) - (argument0 - argument6)*(argument5 - argument7);
return (sign(a) == sign(b) && sign(b) == sign(c));
