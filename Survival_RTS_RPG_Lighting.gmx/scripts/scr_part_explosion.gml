globalvar part_explosion1,emit_explosion,part_explosion2,part_explosion3;

part_explosion1 = part_type_create();
part_type_shape(part_explosion1,pt_shape_explosion);
part_type_size(part_explosion1,0.50,3,0.02,0.05);
part_type_scale(part_explosion1,1,1);
part_type_color3(part_explosion1,16512,1271701,64);
part_type_alpha2(part_explosion1,1,0.50);
part_type_direction(part_explosion1,0,359,0,0);
part_type_orientation(part_explosion1,0,359,0,0,1);
part_type_blend(part_explosion1,1);
part_type_life(part_explosion1,100,100);

part_explosion2 = part_type_create();
part_type_shape(part_explosion2,pt_shape_explosion);
part_type_size(part_explosion2,3,3,-0.50,0);
part_type_scale(part_explosion2,1,1);
part_type_color2(part_explosion2,64,0);
part_type_alpha2(part_explosion2,0.50,0);
part_type_direction(part_explosion2,0,359,0,0);
part_type_gravity(part_explosion2,0,270);
part_type_orientation(part_explosion2,0,359,0,0,1);
part_type_blend(part_explosion2,1);
part_type_life(part_explosion2,10,10);

part_explosion3 = part_type_create();
part_type_shape(part_explosion3,pt_shape_ring);
part_type_size(part_explosion3,3,3,0.80,0);
part_type_color1(part_explosion3,9030);
part_type_alpha2(part_explosion3,0.50,0);
part_type_blend(part_explosion3,1);
part_type_life(part_explosion3,10,10);

emit_explosion = part_emitter_create(Sname);
part_emitter_region(Sname,emit_explosion,x,x,y,y,0,0);

part_type_death(part_explosion1,1,part_explosion2);

/*
part_emitter_burst(Sname,emit_explosion,part_explosion1,5);
part_emitter_burst(Sname,emit_explosion,part_explosion3,1);
*/
