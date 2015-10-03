var xx=argument0,
    yy=argument1,
    vx = view_xview,
    vy = view_yview,
    pdi,r,i,
    len = 7;

//r = max(0,len-distance_to_point(xx,yy));

draw_primitive_begin(pr_trianglestrip);
    ///draw 1
    var i=0;
    pdi = point_direction(xx,yy,point[i,0],point[i,1]);
    draw_vertex(point[i,0]-vx, point[i,1]-vy);
    draw_vertex(point[i,0]-vx+lengthdir_x(other.light_radius,pdi), point[i,1]-vy+lengthdir_y(other.light_radius,pdi));
    //draw odd starting at 1
    for(i=1; i<pointNum; i+=2){
        pdi = point_direction(xx,yy,point[i,0],point[i,1]);
        draw_vertex(point[i,0]-vx, point[i,1]-vy);
        draw_vertex(point[i,0]-vx+lengthdir_x(other.light_radius,pdi), point[i,1]-vy+lengthdir_y(other.light_radius,pdi));
    }
    //draw even starting at pointNum
    a=pointNum-1;
    if((a%2)) a--;
    for(i=a; i>0; i-=2){
        pdi = point_direction(xx,yy,point[i,0],point[i,1]);
        draw_vertex(point[i,0]-vx, point[i,1]-vy);
        draw_vertex(point[i,0]-vx+lengthdir_x(other.light_radius,pdi), point[i,1]-vy+lengthdir_y(other.light_radius,pdi));
    }
    var i=0;
    pdi = point_direction(xx,yy,point[i,0],point[i,1]);
    draw_vertex(point[i,0]-vx, point[i,1]-vy);
    draw_vertex(point[i,0]-vx+lengthdir_x(other.light_radius,pdi), point[i,1]-vy+lengthdir_y(other.light_radius,pdi));
draw_primitive_end();
