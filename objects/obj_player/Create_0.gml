scr_collision_init()
scr_init_input_var()
global.font_small = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._1234567890:?", true, -2)
#macro p_move (key_right + key_left)
move_dir = p_move
state = "normal"
instakill = false
xscale = 1
scale_xs = 1
yscale = 1
scale_ys = 1
angle = 0
states = ds_map_create()
ds_map_add(states,"nothing",state_nothing)
ds_map_add(states,"normal",state_normal)
ds_map_add(states,"jump",state_jump)
ds_map_add(states,"mach2",state_mach2)
ds_map_add(states,"mach3",state_mach3)
ds_map_add(states,"slap",state_slap)
t_door = "A"
spr_palette = pal_peppinilo
paletteselect = 1
savehsp = hsp
savevsp = vsp
savesprite = sprite_index
saveindex = image_index
savestate = state
debugstats = true