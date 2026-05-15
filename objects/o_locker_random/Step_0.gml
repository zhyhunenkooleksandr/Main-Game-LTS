if (ready_to_open == true && global.can_open_lockers == true) {
    var _near = (distance_to_object(o_player) < 10);
    var _key = keyboard_check_pressed(ord("E"));
    var _click = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

    // 1. Did the player try to interact?
    if (_near && (_key || _click)) {
		
		show_debug_message("INTERACTION DETECTED! Can open is: " + string(global.can_open_lockers));
        
        // 2. Are they ALLOWED to open lockers yet? (Story progress)
        if (global.can_open_lockers == true) {
            
            // 3. Does this specific locker hold the item?
            if (can_be_opened == true) {
                
                audio_play_sound(snd_locker_open, 1, false);
                
                var _saved_xscale = image_xscale;
                var _saved_yscale = image_yscale;
                
                instance_change(o_locker_open, true);
                
                image_xscale = _saved_xscale * 4;
                image_yscale = _saved_yscale * 4;
                
                // Spawn the pickup inside
                var _item = instance_create_layer(x + 15, y - 170, layer, o_pickup);
                _item.image_xscale = _saved_xscale * 3.75;
                _item.image_yscale = _saved_yscale * 3.75;
                _item.depth = depth - 1;
                
            }
        }
    }
}
