if(hooked){
	var rx = parent.x - x;
	var ry = parent.y - y;
	var norm_factor = 1/sqrt(rx * rx + ry * ry);
	rx *= norm_factor * hook_distance;
	ry *= norm_factor * hook_distance;
	if(norm_factor<1/hook_distance){
		var x_accel = (x + rx) - parent.x;
		var y_accel = (y + ry) - parent.y;
		parent.x_velocity *= .99;
		parent.y_velocity *= .8;
		parent.x_velocity += x_accel * .05;
		parent.y_velocity += y_accel * .05;
	}else{
		hook_distance -= 3;
	}
	hook_countdown --;
	if(hook_countdown<0){
		parent.hook_ref = None;
		instance_destroy();
	}
	return;
}

for(var i = 0; i < 8; i++){
	if(place_meeting(x,y,COLLISION_LAYER)){
		hooked = true;
		var dx = x - parent.x;
		var dy = y - parent.y;
		hook_distance = sqrt(dx*dx + dy*dy) - 10;
		return;
	}
	x += 5 * cos(degtorad(image_angle));
	y -= 5 * sin(degtorad(image_angle));
}