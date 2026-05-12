if (ready_to_search) {
    var _near = (distance_to_object(o_player) < 10);
    var _key = keyboard_check_pressed(ord("E"));
    var _click = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);
	
	//Check if interacted with charater
	if (_near && _key) {
        if (global.can_search_bush) {
            instance_change(o_locker_open, true);
        }
	
	 var _item = instance_create_layer(x +15, y - 170, layer, o_pickup_locker);
    
    _item.image_xscale = _saved_xscale * 3.75;
    _item.image_yscale = _saved_yscale * 3.75;
    
    
    _item.depth = depth - 1;
	}
}
