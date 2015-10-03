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
    control_device = KEYBOARD;
}
