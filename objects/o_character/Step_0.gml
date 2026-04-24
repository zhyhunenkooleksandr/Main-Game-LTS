var _near = (distance_to_object(o_player) < 30);
var _input = keyboard_check_pressed(ord("E")) || (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id));

if (_near && _input && alarm[0] <= 0) {
    if (!instance_exists(o_dialogue_controller)) {
        var _box = instance_create_layer(x, y, "Characters", o_dialogue_controller);
        _box.messages = my_text;
        _box.creator = id;
        alarm[0] = 9999; 
    }
}