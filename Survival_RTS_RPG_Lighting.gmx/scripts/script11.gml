var xx=argument0,
    yy=argument1,
    vx = view_xview,
    vy = view_yview,
    pdi,r,i,
    len = 24;

r = max(0,len-distance_to_point(xx,yy));

draw_primitive_begin(pr_trianglestrip);
    for(i=0;i<pointNum;i++){
        pdi = point_direction(xx,yy,point[i,0],point[i,1]);
        draw_vertex_colour(point[i,0]-vx,point[i,1]-vy,light_ambient,1/max(1,point_distance(xx,yy,point[i,0],point[i,1])) );
        draw_vertex(point[i,0]-vx+lengthdir_x(r,pdi), point[i,1]-vy+lengthdir_y(r,pdi));
    }
    pdi = point_direction(xx,yy,point[0,0],point[0,1]);
    draw_vertex_colour(point[0,0]-vx,point[0,1]-vy,light_ambient,1/max(1,point_distance(xx,yy,point[0,0],point[0,1])) );
    draw_vertex(point[0,0]-vx+lengthdir_x(r,pdi), point[0,1]-vy+lengthdir_y(r,pdi));
/*draw_primitive_end();

draw_primitive_begin(pr_trianglestrip);*/
    for(i=0;i<pointNum;i++){
        pdi = point_direction(xx,yy,point[i,0],point[i,1]);
        draw_vertex(point[i,0]-vx+lengthdir_x(r,pdi), point[i,1]-vy+lengthdir_y(r,pdi));
        draw_vertex(point[i,0]-vx+lengthdir_x(other.light_radius,pdi), point[i,1]-vy+lengthdir_y(other.light_radius,pdi));
    }
    pdi = point_direction(xx,yy,point[0,0],point[0,1]);
    draw_vertex(point[0,0]-vx+lengthdir_x(r,pdi), point[0,1]-vy+lengthdir_y(r,pdi));
    draw_vertex(point[0,0]-vx+lengthdir_x(other.light_radius,pdi), point[0,1]-vy+lengthdir_y(other.light_radius,pdi));
draw_primitive_end();
