
//Picking up an object
var _near = (distance_to_object(o_player) < 15);
var _key = keyboard_check_pressed(ord("E"));
var _click = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

if (_near && (_key || _click)) {
	if (global.has_item == false) {
    audio_play_sound(snd_Pick_Up, 1, false);
    
    global.has_item = true;
    global.item_id = my_item_id;
    
    instance_destroy();
	}
}