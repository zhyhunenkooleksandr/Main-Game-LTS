image_speed = 0.5;

// NEW Dialogue

//If player picked up the bug
if (global.has_bush_item == true) {
    my_text = [
        "My hair isn't red...",
        "Even though my name is Redd",
        "It'll make me look like a lesbian..."
    ];
}

//If player hit trigger
else if (global.reached_end == true) {
    my_text = ["Hey, you're back.", 
	"Seems you've been getting in a trouble with that big guy.", 
	"If you want some advice", 
	"I've heard my students say he's terrified of bugs.", 
	"Maybe that information could be useful.", 
	"He hates the opposite colour of the lockers!"]
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
            global.can_search_bushes = true;
        }
    }
}