//Draw Item Pickup GUI
    var _gui_h = display_get_gui_height();
    
if (global.has_item == true) {
	var _scale = 0.9;
    var _ui_x = 80;
    var _ui_y = _gui_h + 10;
    
    draw_sprite_ext(s_book, global.item_id, _ui_x, _ui_y, _scale, _scale, 0, c_white, 1);
}

if (global.has_bush_item) {
	var _scale = 0.6;
    var _ui_x_bush = 80;
    var _ui_y_bush = _gui_h - 240;
    
    draw_sprite_ext(s_bug, global.bush_item_id, _ui_x_bush, _ui_y_bush, _scale, _scale, 0, c_white, 1);
}