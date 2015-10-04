globalvar control_device,gamepad_num;

gamepad_num = -1;
//if(gamepad_is_supported())
{
    for(var i=0;i<gamepad_get_device_count();i++)
    {
        if(gamepad_is_connected(i)){
            gamepad_num = i;
            break;
        }
    }
}

//gamepad_num = -1;

if(gamepad_num>=0)
{
    control_device = XBOX360;
    gamepad_set_axis_deadzone(gamepad_num,0.2);
}
else
{
    if(os_type == os_windows)
    {
        control_device = KEYBOARD;
    }
    else
    {
        control_device = ONSCREEN;
        globalvar touch_shoot_rad,touch_shoot_x,touch_shoot_y;
        touch_shoot_rad = 32;
        touch_shoot_x = view_wview-42;
        touch_shoot_y = view_hview-42;
    }
}
