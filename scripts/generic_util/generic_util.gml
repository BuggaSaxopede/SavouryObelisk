function approach(value, target, increment = 0.5)
{
	var t = target - value;
	return value + clamp(t, -increment, increment);
}

function animation_end(ind = sprite_index, img = image_index,  i_end = sprite_get_number(ind), i_spd = image_speed)
{
    return (img + (i_spd) * sprite_get_speed(ind) >= i_end);
}