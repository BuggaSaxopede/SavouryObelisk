function state_normal()
{
	sprite_index = asset_get_index($"spr_{character}_idle")	
    hsp = movespeed * xscale
	if p_move != 0
	{
		xscale = p_move
		movespeed = approach(movespeed, 6, 0.3)
	}
	else
	{
		movespeed = approach(movespeed, 0, 0.43)
	}
		
	if key_jump2 && (grounded || groundedSlope)
	{
		vsp = -11
	}
	
	if key_mach && (grounded || groundedSlope)
	{
		state = "mach2"
		movespeed = approach(movespeed, 6, 0.3)
	}
	
	//do_grab()
	//do_taunt()
}

function state_jump(){

}

function state_mach2(){
	move_dir = lerp(move_dir, p_move, 0.04);
	if sign(hsp) != 0
	{	
		xscale = sign(hsp)
	}
	hsp = movespeed * move_dir

	if (grounded or groundedSlope)
	{
		if movespeed < 12
			movespeed += 0.1
		else
			state = "mach3"
	}
	
	if (place_meeting(x + hsp, y, obj_solid)) {
	    move_dir = -move_dir;   // flip direction
		hsp = movespeed * move_dir;
	}
	
	if (place_meeting(x + hsp, y, obj_solid)) or grounded {
	    changedir = 1
	}
	
	if (!grounded && key_grab) && changedir = 1 {
		move_dir = -move_dir;   // flip direction
		hsp = movespeed * move_dir;
		vsp = -11
		changedir = 0
	}
		
	//if (grounded or groundedSlope) && sprite_index != asset_get_index($"spr_{character}_mach1")
	//	sprite_index = asset_get_index($"spr_{character}_mach2")
		
	//do_wallrun()
	//do_grab()
	
	if key_jump2 && (grounded || groundedSlope)
	{
		vsp = -11
	}
	
	// do a barrel roll
	//if key_down
	//	state = "roll"
	
	if !key_mach
	{
		state = "normal"
		movespeed = approach(movespeed, 0, 1.8)
	}
	if !instance_exists(obj_runningsparkle) && movespeed > 0
	{
		repeat(6)
		{
			instance_create_depth(x - 32 * xscale, y + 32, depth, obj_runningsparkle)
		}
	}
	
	//do_taunt()
}

function state_mach3(){
	move_dir = lerp(move_dir, p_move, 0.04);
	if sign(hsp) != 0
	{	
		xscale = sign(hsp)
	}
	hsp = movespeed * move_dir
	
	if (place_meeting(x + hsp, y, obj_solid)) {
	    move_dir = -move_dir;   // flip direction
		hsp = movespeed * move_dir;
	}
	
	if (place_meeting(x + hsp, y, obj_solid)) or grounded {
	    changedir = 1
	}
	
	if (!grounded && key_grab) && changedir = 1 {
		move_dir = -move_dir;   // flip direction
		hsp = movespeed * move_dir;
		vsp = -11
		changedir = 0
	}
		
	
	if (grounded or groundedSlope)
	{
		if movespeed < 16
		{
			movespeed += 0.025
			//sprite_index = asset_get_index($"spr_{character}_mach3")
		}
		else if movespeed < 20
		{
			movespeed += 0.1
			//sprite_index = asset_get_index($"spr_{character}_crazyrun")
		}
		
		else if movespeed >= 20
		{
			movespeed = 20
		}
	}
	
	//do_wallrun()
	//do_grab()
	
	
	if key_jump2 && (grounded || groundedSlope)
	{
		vsp = -11
	}
	
	//if key_up && (grounded || groundedSlope)
	//{
	//	sprite_index = asset_get_index($"spr_{character}_superjump_crouch")
	//	state = "sjump"
	//	movespeed = floor(movespeed)
	//}
	
	//if key_down
	//	state = "roll"
	
	if !key_mach
	{
		state = "normal"
		movespeed = approach(movespeed, 0, 1.8)
	}
	if !instance_exists(obj_runningsparkle) && movespeed > 0
	{
		repeat(6)
		{
			instance_create_depth(x - 32 * xscale, y + 32, depth, obj_runningsparkle)
		}
	}
	
	instakill = true
	
	//do_taunt()
}