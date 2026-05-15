//Draw Item Pickup GUI

    var _gui_h = display_get_gui_height();
	var _scale = 1.6;
    
if (global.has_item) {
    var _ui_x = 80;
    var _ui_y = _gui_h - 90;
    
    draw_sprite_ext(s_book, 0, _ui_x, _ui_y, _scale, _scale, 0, c_white, 1);
}

if (global.has_bush_item) {
    var _ui_x_bush = 35; // Shifted 100 pixels to the right so they don't overlap!
    var _ui_y_bush = _gui_h - 275;
    
    // Change "s_your_bush_item" to whatever sprite you want to show in the UI
    draw_sprite_ext(s_wall_collision, 0, _ui_x_bush, _ui_y_bush, _scale, _scale, 0, c_white, 1);
}