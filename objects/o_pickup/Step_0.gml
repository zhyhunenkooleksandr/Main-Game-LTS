var _near = (distance_to_object(o_player) < 20);
var _key = keyboard_check_pressed(ord("E"));
var _click = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

if (_near && (_key || _click)) {
    global.has_item = true;
    instance_destroy();
}
