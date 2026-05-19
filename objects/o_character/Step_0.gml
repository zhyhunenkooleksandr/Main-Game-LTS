image_speed = 0.5;

// NEW Dialogue

//If player picked up the locker item
if (global.has_item == true) {
    my_text = [
        "I'm not paid enough for this",
    ];
}

//If player hit trigger
else if (global.reached_end == true) {
    // Overwrite the Variable Definition text with new arrays of text
    my_text = ["Ohh, it YOU again", 
	"You want help from me?", 
	"What am I going to get out of this?", 
	"Hmmm...", "Okay, don't reply.", "I'll only help this once.", 
	"Me and big B aren't on good terms.", 
	"You should DEFINITELY use Hair Spray.", 
	"He has SOOO much hair."] ;
}

// Triggering Dialogue
var _near = (distance_to_object(o_player) < 30);
var _input = keyboard_check_pressed(ord("E")) || (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id));

if (_near && _input && alarm[0] <= 0) {
    if (!instance_exists(o_dialogue_controller)) {
        
        // Create the dialogue box
        var _box = instance_create_layer(x, y, "Characters", o_dialogue_controller);
        _box.messages = my_text;
        _box.creator = id;
        alarm[0] = 9999;
        
        // UNLOCK new dialugue
        if (global.reached_end == true) {
            global.can_open_lockers = true;
        }
    }
}