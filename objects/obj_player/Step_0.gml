scr_collision()
scr_get_input()
var _state = ds_map_find_value(states,state)
_state()

if grounded && place_meeting_slope(x ,y + 1)
{
    with (instance_place(x, y + 1, obj_slope))
    {
        var _dir = sign(image_xscale);
        var angle_rad = arctan2(image_yscale * _dir, image_xscale * _dir);
        other.angle = radtodeg(angle_rad);
    }
}
else
{
    angle = 0;
}