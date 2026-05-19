var _near = (distance_to_object(o_player) < 20);
var _key = keyboard_check_pressed(ord("E"));
var _click = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

if (_near && (_key || _click)) {
    
    if (!global.has_bush_item) {
        global.has_bush_item = true;
        global.bush_item_id = my_bush_item_id;
		
        audio_play_sound(snd_Pick_Up, 1, false); 
        
    }
}
