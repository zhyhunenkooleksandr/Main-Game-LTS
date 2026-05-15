// o_bush_interactable: Step Event

// 1. Check if player is close enough and pressing 'E' (or clicking)
var _near = (distance_to_object(o_player) < 20);
var _key = keyboard_check_pressed(ord("E"));
var _click = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

if (_near && (_key || _click)) {
    
    // 2. Give the player the item if they don't already have it
    if (!global.has_bush_item) {
        global.has_bush_item = true;
        
        // Optional: Play a sound
        audio_play_sound(snd_Pick_Up, 1, false); 
        
    }
}
