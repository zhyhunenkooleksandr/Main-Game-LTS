if (instance_exists(o_player)) {
// If to far dialogue restarts
    if (point_distance(x, y, o_player.x, o_player.y) > 250) {
        
        instance_destroy(); 
        
    }
}
// Page length
if (page < array_length(messages)) {
    if (char_count < string_length(messages[page])) {
        char_count += text_speed;
    }
}

// Interactive Logic
if (keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left)) {
    if (char_count < string_length(messages[page])) {
        char_count = string_length(messages[page]);
    } 
    else {
        page++;
        char_count = 0;
        
        if (page >= array_length(messages)) {
            instance_destroy();
        }
    }
}
//length of massages
if (page == array_length(messages) - 1) {
    if (char_count >= string_length(messages[page])) {
        
        auto_close_timer -= 1;
        
        if (auto_close_timer <= 0) {
            instance_destroy();
        }
    }
}