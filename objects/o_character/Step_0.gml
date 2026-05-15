// --- NEW CODE: Change dialogue if player triggered the end ---
if (global.reached_end == true) {
    // Overwrite the Variable Definition text with new arrays of text
    my_text = ["Ah, you made it back from the end of the room!", "hhhheeee, hhhhhaaaa"];
}

// 2. Triggering Dialogue & Quest Logic
var _near = (distance_to_object(o_player) < 30);
var _input = keyboard_check_pressed(ord("E")) || (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id));

if (_near && _input && alarm[0] <= 0) {
    if (!instance_exists(o_dialogue_controller)) {
        
        // Create the dialogue box
        var _box = instance_create_layer(x, y, "Characters", o_dialogue_controller);
        _box.messages = my_text;
        _box.creator = id;
        alarm[0] = 9999;
        
        // --- THE UNLOCK LOGIC ---
        // Only unlock things if the player has been to the end of the room!
        if (global.reached_end == true) {
            global.can_open_lockers = true;
        }
    }
}