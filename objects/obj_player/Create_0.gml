scr_collision_init()
scr_init_input_var()
#macro p_move (key_right + key_left)
move_dir = p_move
state = "normal"
instakill = false
xscale = 1
angle = 0
states = ds_map_create()
ds_map_add(states,"normal",state_normal)
ds_map_add(states,"jump",state_jump)
ds_map_add(states,"mach2",state_mach2)
ds_map_add(states,"mach3",state_mach3)
t_door = "A"