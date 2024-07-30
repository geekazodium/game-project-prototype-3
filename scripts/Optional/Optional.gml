//@ignore
function Option(_val) constructor{
	self.val = _val;
	var exists = !is_undefined(_val);
	self.is_some = exists?_true: _false;
	self.is_none = exists?_false: _true;
	self.unwrap = function(){
		if(self.is_none())panic("can not unwrap a nonexistient value");
		return self.val;
	};
	self.unwrap_or = function(_def){
		if(self.is_none())return _def;
		return self.val;
	};
	self.map = function(_fn){
		if(self.is_none())return self;
		return new Option(_fn(self.val));
	};
	self.map_or = function(_fn,_def){
		if(self.is_none())return _def;
		return _fn(self.val);
	};
}

//@ignore
function _true(){return true};
//@ignore
function _false(){return false};

function some(_val){
	if(is_undefined(_val))panic("some values can not be set to undefined");
	return new Option(_val);
}

function none(){
	return new Option(undefined);
}

#macro Some some
#macro None none()