///dg_effect_fire(x,y,radius,height)
if(!point_in_rectangle(argument0,argument1,view_xview,view_yview,view_xview+view_wview,view_yview+view_hview)) exit;
var dir,dist,amp;
for(var n=0; n<dg_cellNum; n++)
{
    dir = point_direction(argument0,argument1,dg_xOrigin[n]+view_xview,dg_yOrigin[n]+view_yview);
    dist = min(point_distance(argument0,argument1,dg_xOrigin[n]+view_xview,dg_yOrigin[n]+view_yview),argument2);
    //amp = argument3*sin((pi/argument2)*(argument2-dist));
    amp = argument3*sin((argument2));
    dg_xForce[n] += lengthdir_x(amp,dir);
    dg_yForce[n] += lengthdir_y(amp,dir);
    dg_xOff[n] += dg_xForce[n];
    dg_yOff[n] += dg_yForce[n];
}
