
if(hook_ref.is_some()){
	instance_destroy(hook_ref.unwrap());
	hook_ref = None;
}
