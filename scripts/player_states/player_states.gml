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
	
	do_slap()
	do_taunt()
	image_speed = 0.35
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
	do_slap()
	
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
	
	do_taunt()
	image_speed = 0.35
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
	do_slap()
	
	
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
	image_speed = 0.35
	
	do_taunt()
}

function state_slap(){
	hsp = movespeed * xscale

		
	if sprite_index == spr_peppinilo_slap && animation_end()
	{
		movespeed = approach(movespeed, 12, 1)
		image_index = 0
		sprite_index = spr_peppinilo_slaploop
	}
		
	if floor(image_index) >= 5
		movespeed -= 0.7
		
	if movespeed <= 0
	{
		if !key_mach
			state = "mach2"
		else
		{
			movespeed = 0;
			state = "normal"
		}
	}
	
	image_speed = 0.45
	
	instakill = true
}


function do_slap(){
    if key_grab2
    {
		if key_up
		{
			//sprite_index = asset_get_index($"spr_{character}_uppercut1")
			image_index = 0
			//state = p_states.uppercut
			vsp = -15
		}
		else
		{
			sprite_index = spr_peppinilo_slap
			image_index = 0
			state = "slap"
			movespeed = 6
		}
    }
}

function do_taunt(){
	if key_taunt2
	{
		savehsp = hsp
		savevsp = vsp
		savesprite = sprite_index
		saveindex = image_index
		savestate = state
		
		hsp = 0
		vsp = 0
		grav = 0
		sprite_index = asset_get_index($"spr_{character}_taunts")
		image_index = irandom(image_number - 1)
		image_speed = 0
		state = "nothing"
		alarm[0] = 20
	}
}

function state_nothing(){
	
}