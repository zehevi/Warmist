tex = surface_get_texture(surfOut);
var n;
draw_set_color(c_white);
surface_set_target(surfOut);
//draw_clear_alpha(0,1);

    for(var j=0;j<dg_vCells-1;j++)
    {
        draw_primitive_begin_texture(pr_trianglestrip,tex);
        for(var i=0;i<dg_hCells;i++)
        {
            n = dg_hCells*j+i;
            m = dg_hCells*(j+1)+i;
            draw_vertex_texture(dg_xOrigin[n]+dg_xOff[n],dg_yOrigin[n]+dg_yOff[n],dg_u[n],dg_v[n]);
            draw_vertex_texture(dg_xOrigin[m]+dg_xOff[m],dg_yOrigin[m]+dg_yOff[m],dg_u[m],dg_v[m]);
        }
        draw_primitive_end();
    }

surface_reset_target();
draw_set_color(c_black);
