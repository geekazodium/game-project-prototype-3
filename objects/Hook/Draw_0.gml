draw_line(x,y,parent.x,parent.y);
draw_self();

if(hooked){
	var rx = parent.x - x;
	var ry = parent.y - y;
	var norm_factor = 1/sqrt(rx * rx + ry * ry);
	rx *= norm_factor * hook_distance;
	ry *= norm_factor * hook_distance;
	draw_set_color(c_blue);
	draw_circle(x + rx,y + ry,10,false);
	draw_line(x + rx,y + ry, parent.x, parent.y);
	draw_set_color(c_white);
}