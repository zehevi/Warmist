globalvar part_gunSmoke1,emit_gunSmoke,part_gunSmoke2;

part_gunSmoke1 = part_type_create();
part_type_shape(part_gunSmoke1,pt_shape_explosion);
part_type_size(part_gunSmoke1,0.1,0.3,-0.02,0.1);
part_type_scale(part_gunSmoke1,1,1);
part_type_color1(part_gunSmoke1,8421504);
part_type_alpha2(part_gunSmoke1,1,0.4);
part_type_speed(part_gunSmoke1,4,5,-0.2,0);
part_type_direction(part_gunSmoke1,-5,10,0,5);
part_type_orientation(part_gunSmoke1,0,0,0,5,1);
part_type_blend(part_gunSmoke1,0);
part_type_life(part_gunSmoke1,2,20);

emit_gunSmoke = part_emitter_create(Sname);

part_gunSmoke2 = part_type_create();
part_type_shape(part_gunSmoke2,pt_shape_smoke);
part_type_size(part_gunSmoke2,0.2,0.3,0.02,0);
part_type_scale(part_gunSmoke2,1,1);
part_type_color1(part_gunSmoke2,8421504);
part_type_alpha2(part_gunSmoke2,0.25,0);
part_type_speed(part_gunSmoke2,0.1,1,0,0);
part_type_direction(part_gunSmoke2,0,359,0,0);
part_type_orientation(part_gunSmoke2,0,0,2,5,1);
part_type_blend(part_gunSmoke2,0);
part_type_life(part_gunSmoke2,30,120);


part_type_death(part_gunSmoke1,1,part_gunSmoke2);
