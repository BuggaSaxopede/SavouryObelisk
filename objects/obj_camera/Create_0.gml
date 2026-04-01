mag = 0
mag_decel = 0.5
cam_charge = 0
info_visible = false
surface_resize(application_surface, screen_w, screen_h)
window_center()
display_set_gui_size(960, 540)
gpu_set_texfilter(false)
window_set_fullscreen(true)
window_enable_borderless_fullscreen(true)

campos = {
	x: 0,
	y: 0
}

#macro screen_w 960
#macro screen_h 540

depth = -10000