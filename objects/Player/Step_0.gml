var on_ground = false;

var will_collide = place_meeting(x,y+y_velocity,COLLISION_LAYER);

if(check_collide_position(x+x_velocity,y+y_velocity) && !check_collide_position(x+x_velocity,y) && !check_collide_position(x,y+y_velocity)){
	var c = 0;
	while(c<1){
		c+=.08;
		if(check_collide_position(x+c*x_velocity,y+c*y_velocity)){
			x+=c*x_velocity;
			y+=c*y_velocity;
			x_velocity -= c*x_velocity;
			y_velocity -= c*y_velocity;
			break;
		}
	}
}

if((y_velocity >= 0) && will_collide){
	on_ground = true;
	ground_timer = JUMP_BUFFER;
	var offset = -5;
	while(!place_meeting(x,y+offset,COLLISION_LAYER) && (offset < y_velocity)){
		offset++;
	}
	y_velocity = 0;
	y = ceil(y) + offset - 1;
}else if(will_collide){
	var offset = 5;
	while(!place_meeting(x,y+offset,COLLISION_LAYER) && (offset > y_velocity)){
		offset--;
	}
	y_velocity = 0;
	y = ceil(y) + offset + 1;
}else{
	if(ground_timer > 0){
		ground_timer -= 1;
	}
}

if(jump_timer > 0){
	jump_timer -= 1;
	if(ground_timer > 0){
		jump_timer = 0;
		ground_timer = 0;
		y_velocity = -14;
	}
}

if(r_key_down){
	x_velocity += on_ground?ground_x_accel:air_x_accel;
}
if(l_key_down){
	x_velocity -= on_ground?ground_x_accel:air_x_accel;
}
x_velocity *= on_ground?.75:.95;

if(place_meeting(x+x_velocity,y,COLLISION_LAYER)){
	var offset = 0;
	while(!place_meeting(x+offset*sign(x_velocity),y,COLLISION_LAYER) && (offset < abs(x_velocity))){
		offset++;
	}
	x_velocity = (offset-1)*sign(x_velocity);
}

if(hook_ref.is_some()){
	if(u_key_down){
		hook_ref.unwrap().hook_distance -= 7;
		hook_ref.unwrap().hook_distance = max(hook_ref.unwrap().hook_distance,0);
	}
	if(d_key_down){
		hook_ref.unwrap().hook_distance += 10;
	}
}

x += x_velocity;
y += y_velocity;
y_velocity += GRAVITY_CONSTANT;
