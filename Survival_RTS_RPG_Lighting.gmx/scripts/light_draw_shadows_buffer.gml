var xx=argument0,
    yy=argument1,
    vx = view_xview,
    vy = view_yview,
    pdi,
    r,
    len = 32;

r = max(0,len-distance_to_point(xx,yy));

vertex_begin(light_vBuff,light_vFormat);
    for(i=0;i<pointNum;i++){
        pdi = point_direction(xx,yy,point[i,0],point[i,1]);
        light_vertex(point[i,0]-vx,point[i,1]-vy,light_ambient,1/max(1,point_distance(xx,yy,point[i,0],point[i,1])) );
        light_vertex(point[i,0]-vx+lengthdir_x(r,pdi), point[i,1]-vy+lengthdir_y(r,pdi), 0, 1);
    }i=0;
    pdi = point_direction(xx,yy,point[i,0],point[i,1]);
    light_vertex(point[i,0]-vx,point[i,1]-vy,light_ambient,1/max(1,point_distance(xx,yy,point[i,0],point[i,1])) );
    light_vertex(point[i,0]-vx+lengthdir_x(r,pdi), point[i,1]-vy+lengthdir_y(r,pdi), 0, 1);



    for(i=0;i<pointNum;i++){
        pdi = point_direction(xx,yy,point[i,0],point[i,1]);
        light_vertex(point[i,0]-vx+lengthdir_x(r,pdi), point[i,1]-vy+lengthdir_y(r,pdi), 0, 1);
        light_vertex(point[i,0]-vx+lengthdir_x(other.light_radius,pdi), point[i,1]-vy+lengthdir_y(other.light_radius,pdi), 0, 1);
    }i=0;
    pdi = point_direction(xx,yy,point[i,0],point[i,1]);
    light_vertex(point[i,0]-vx+lengthdir_x(r,pdi), point[i,1]-vy+lengthdir_y(r,pdi), 0, 1);
    light_vertex(point[i,0]-vx+lengthdir_x(other.light_radius,pdi), point[i,1]-vy+lengthdir_y(other.light_radius,pdi), 0, 1);
vertex_end(light_vBuff);
vertex_submit(light_vBuff,pr_trianglestrip,-1);
