// Check if the player is touching this trigger
if (place_meeting(x, y, o_player)) {
    // If they hit the trigger, update the story state!
    if (global.reached_end == false) {
        global.reached_end = true; 
    }
}