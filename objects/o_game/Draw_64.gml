if (global.has_item) {
    var _gui_h = display_get_gui_height();
    
    var _ui_x = 80;
    var _ui_y = _gui_h - 90;
    
    var _scale = 1.5;
    draw_sprite_ext(s_book, 0, _ui_x, _ui_y, _scale, _scale, 0, c_white, 1);
}