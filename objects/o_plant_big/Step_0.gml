// 1. First, check if THIS specific bush actually holds the item
if (holds_item == true && global.can_search_bushes == true) {
    
    // 2. Check if player is near and interacting
    var _near = (distance_to_object(o_player) < 20);
    var _key = keyboard_check_pressed(ord("E"));
    var _click = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

    if (_near && (_key || _click)) {
        
        // 3. Give the player the item
        if (!global.has_bush_item) {
            global.has_bush_item = true;
            audio_play_sound(snd_Pick_Up, 1, false); 
            
            // 4. Stop them from picking it up again
            holds_item = false; 
        }
    }
}