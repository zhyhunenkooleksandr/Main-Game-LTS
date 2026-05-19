if (ready_to_open == true && global.can_open_lockers == true) {
    var _near = (distance_to_object(o_player) < 10);
    var _key = keyboard_check_pressed(ord("E"));
    var _click = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

//Interaction
    if (_near && (_key || _click)) {
		
		//did they touch the trigger
        if (global.can_open_lockers == true) {
            
        
             if (can_be_opened == true) {
    audio_play_sound(snd_locker_open, 1, false);
    
    var _saved_xscale = image_xscale;
    var _saved_yscale = image_yscale;
    
    instance_change(o_locker_open, true);
    
    image_xscale = _saved_xscale * 4;
    image_yscale = _saved_yscale * 4;
    
    // Ceck for pickup and posters
	
	//Add Pickup
    if (has_item == true) {
              
        var _item = instance_create_depth(x + 15, y - 147, depth - 1, o_pickup);
        _item.image_xscale = _saved_xscale * 1.65;
        _item.image_yscale = _saved_yscale * 1.65;
		
		var _rolled_id = choose(0, 1);
        _item.image_index = _rolled_id;
        _item.my_item_id = _rolled_id;
		
    //Add poster    
    } else if (has_poster == true) {
        		
        var _poster = instance_create_depth(x - 5, y - 100, depth - 1, o_posters);
        
        _poster.image_xscale = _saved_xscale * 6; 
        _poster.image_yscale = _saved_yscale * 6;
		 
    }
}
}
}
}
