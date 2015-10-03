smokew = view_wview; smokeh = view_hview;
SmokeSurf = surface_create(smokew,smokeh);

//  PREP THE SURFACE TO DISGUISE MINIMAS
surface_set_target(SmokeSurf);
draw_clear_alpha(0,0);
surface_reset_target();
    
//  MAGIC NUMBERS
pushx = 0;
ampx = 1;
offx = 0;
freqx = 10;
pushy = 0;
ampy = 0.5;
offy = 0;
freqy = 25;
persist = 250;

//  COMPUTE THE DISTORTION FIELD
s = 8;
for (j=0; j<smokeh+s; j+=s) {
    for (i=0; i<smokew+s; i+=s) {
        wx = i+pushx+ampx*sin((offx+freqx*j)/smokeh);
        wy = j+pushy+ampy*sin((offy+freqy*i)/smokew);
        u[i,j] = wx/smokew;
        v[i,j] = wy/smokeh;
    }
}

//  CREATE THE DISTORTION GRID MODEL
model = d3d_model_create();
c = make_color_hsv(0,0,persist);
for (var j=0; j<smokeh; j+=s) {
    d3d_model_primitive_begin(model,pr_trianglestrip);
    for (var i=0; i<smokew+s; i+=s) {
        d3d_model_vertex_texture_color(model,i,j,0,u[i,j],v[i,j],c,1);
        d3d_model_vertex_texture_color(model,i,j+s,0,u[i,j+s],v[i,j+s],c,1);
    }
    d3d_model_primitive_end(model);
}
