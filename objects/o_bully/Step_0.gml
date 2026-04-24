//Going to next room
var _near_player = (distance_to_object(o_player) < 30);

var _key_interact = keyboard_check_pressed(ord("E"));
var _mouse_interact = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

if (_near_player && (_key_interact || _mouse_interact)) {
    if (room_exists(rm2)) {
        room_goto(rm2);
    }
}