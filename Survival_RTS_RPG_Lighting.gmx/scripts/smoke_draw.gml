///smoke_draw()
if(!surface_exists(SmokeSurf)) SmokeSurf = surface_create(smokew,smokeh);

surface_set_target(SmokeSurf);
draw_set_color(c_white);
var tex = surface_get_texture(SmokeSurf);
d3d_model_draw(model,0,0,0,tex);

//  RESTORE ALPHA TO 100%
draw_set_blend_mode_ext(bm_one,bm_one);
draw_rectangle_color(0,0,smokew,smokeh,0,0,0,0,false);
draw_set_blend_mode(bm_normal);

//  TOUCH UP NOISE TO HIDE MINIMAS
//c = make_color_hsv(0,0,23);
//draw_rectangle_color(0,h-5,w,h,c,c,c,c,false);

draw_set_blend_mode_ext(bm_src_alpha,bm_one);
with(oSmoke)
{
    draw_sprite_ext(sprite_index,image_index,x-view_xview,y-view_yview,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}

surface_reset_target();
