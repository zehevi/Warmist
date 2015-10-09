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
        globalvar touch_shoot_rad,touch_shoot_x,touch_shoot_y,touch_shoot_xdraw,touch_shoot_ydraw;
        touch_shoot_rad = 32;
        var w=42,h=42;
        touch_shoot_x = display_get_width()-w*view_wport/view_wview;
        touch_shoot_y = display_get_height()-h*view_hport/view_hview;
        touch_shoot_xdraw = view_wview-w;
        touch_shoot_ydraw = view_hview-h;
    }
}



//TESTING
control_device = ONSCREEN;
globalvar touch_shoot_rad,touch_shoot_x,touch_shoot_y,touch_shoot_xdraw,touch_shoot_ydraw
          touch_move_rad,touch_move_x,touch_move_y,touch_move_xdraw,touch_move_ydraw,touch_move_joyx,touch_move_joyy;
touch_shoot_rad = 32*view_wport/view_wview;
touch_move_rad = 32*view_wport/view_wview;
var w=42,h=42;
touch_shoot_x = display_get_width()-w*view_wport/view_wview;
touch_shoot_y = display_get_height()-h*view_hport/view_hview;
touch_shoot_xdraw = view_wview-w;
touch_shoot_ydraw = view_hview-h;
touch_move_x = w*view_wport/view_wview;
touch_move_y = display_get_height()-h*view_hport/view_hview;
touch_move_xdraw = w;
touch_move_ydraw = view_hview-h;
touch_move_joyx = touch_move_x;
touch_move_joyy = touch_move_y;

