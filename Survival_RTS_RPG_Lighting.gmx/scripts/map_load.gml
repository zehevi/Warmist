var s,Load,Wall;
s = argument0;
Load = ds_map_create();
ds_map_read(Load,s);
Wall = ds_list_create();
for(var i=0; i<ds_map_size(Load); i++)
{
    if( ds_map_exists(Load,"wall"+string(i)) )
    {
        s = Load[? "wall"+string(i)];
        ds_list_read(Wall,s);
        with(instance_create(0,0,oWall))
        {
            for(var j=0; j<ds_list_size(Wall)-1; j+=2)
            {
                point[j*.5,0] = Wall[| j];
                point[j*.5,1] = Wall[| j+1];
            }
            pointNum = j*.5;
            tex = background_get_texture(tex_brick);
            event_user(0);
        }
    }
    if( ds_map_exists(Load,"light"+string(i)) )
    {
        //create light object
    }
}

ds_list_destroy(Wall);
ds_map_destroy(Load);
