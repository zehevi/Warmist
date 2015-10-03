surface_set_target(surfBlurA);
draw_clear_alpha(0,0);
    draw_surface_stretched( surfLightA,0,0, surface_get_width(surfBlurA), surface_get_height(surfBlurA) );
surface_reset_target();

surface_set_target(surfBlurB);
draw_clear_alpha(0,0);
    draw_surface_stretched( surfBlurA,0,0, surface_get_width(surfBlurB), surface_get_height(surfBlurB) );
surface_reset_target();

surface_set_target(surfLightA);
draw_clear_alpha(0,0);
    draw_surface_stretched( surfBlurB,0,0, surface_get_width(surfLightA), surface_get_height(surfLightA) );
surface_reset_target();

