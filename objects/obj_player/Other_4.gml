if instance_exists(obj_door_point)
{
	with obj_door_point
	{
		if other.t_door == t_door
		{
			other.x = x + 16 // * other.player / 6 + 490
			other.y = y + 33
		}
	}
}