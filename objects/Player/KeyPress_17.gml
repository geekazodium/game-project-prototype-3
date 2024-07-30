if(hook_ref.is_none()){
	var dx = l_key_down?-1:(r_key_down?1:0);
	var dy = u_key_down?-1:(d_key_down?1:0);
	if((dx == 0) && (dy == 0)){
		return;
	}
	hook_ref = Some(instance_create_layer(x,y,layer,Hook,{parent:id,image_angle:radtodeg(arctan2(-dy,dx))}));
}