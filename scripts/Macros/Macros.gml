#macro delta_time_ms (delta_time * .001)
#macro dbg show_debug_message
#macro STEP_DISTANCE_CAP 10
#macro COLLISION_LAYER layer_tilemap_get_id(layer_get_id("Collision_Layer"))
#macro JUMP_BUFFER 12
#macro GRAVITY_CONSTANT 1

function panic(err){
	show_error(err,true);
}