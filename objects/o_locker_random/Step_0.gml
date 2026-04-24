if (can_be_opened and global.can_open_lockers) {
if (ready_to_open) {
    var _near = (distance_to_object(o_player) < 10);
    var _key = keyboard_check_pressed(ord("E"));
    var _click = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

	if (_near && _key) {
        if (global.can_open_lockers) {
            instance_change(o_locker_open, true);
        }
    if (_near && (_key || _click)) {
		var _saved_xscale = image_xscale;
		var _saved_yscale = image_yscale;
		
        instance_change(o_locker_open, true);
		
		image_xscale = _saved_xscale * 4;
		image_yscale = _saved_yscale * 4;
		
	// 2. Spawn the item inside
    var _item = instance_create_layer(x +15, y - 170, layer, o_pickup);
    
    
    _item.image_xscale = _saved_xscale * 3.75;
    _item.image_yscale = _saved_yscale * 3.75;
    
    
    _item.depth = depth - 1;
    }
}
}

}
