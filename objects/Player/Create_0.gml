y_velocity = 0;
x_velocity = 0;

ground_timer = 0;
jump_timer = 0;

ground_x_accel = 2;
air_x_accel = ground_x_accel/5;

l_key_down = false;
r_key_down = false;
u_key_down = false;
d_key_down = false;

hook_ref = None;

keyboard_set_map(ord("A"),vk_left);
keyboard_set_map(ord("D"),vk_right);
keyboard_set_map(ord("S"),vk_down);
keyboard_set_map(ord("W"),vk_up);
keyboard_set_map(ord("J"),vk_control);

function check_collide_position(_x,_y){
	return place_meeting(_x,_y,COLLISION_LAYER);
}

initial_x = x;
initial_y = y;