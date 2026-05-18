// SAFE SURFACE CAPTURE
if (pause_sprite == -1) {
    display_set_gui_size(970, 540);
    pause_sprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
}

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (sprite_exists(pause_sprite)) {
    draw_sprite_ext(pause_sprite, 0, 0, 0, _gui_w / sprite_get_width(pause_sprite), _gui_h / sprite_get_height(pause_sprite), 0, c_white, 1);
}

draw_set_color(c_black);
draw_set_alpha(0.65); 
draw_rectangle(0, 0, _gui_w, _gui_h, false);
draw_set_alpha(1.0); 

draw_set_font(-1); 
draw_set_valign(fa_middle);

if (!show_settings) {
    // DRAW PAUSE MENU LAYOUT
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text_transformed(_gui_w / 2, _gui_h * 0.25, "GAME PAUSED", 1.5, 1.5, 0);
    
    for (var i = 0; i < array_length(options); i++) {
        var _y_pos = (_gui_h / 2) + (i * menu_space);
        
        if (i == index) {
            draw_set_color(c_yellow);
            draw_text_transformed(_gui_w / 2, _y_pos, "> " + options[i] + " <", 1.3, 1.3, 0);
        } else {
            draw_set_color(c_white);
            draw_text_transformed(_gui_w / 2, _y_pos, options[i], 1.3, 1.3, 0);
        }
    }
} else {
    // DRAW EMBEDDED SETTINGS LAYOUT
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text_transformed(_gui_w / 2, _gui_h * 0.15, "SETTINGS", 1.5, 1.5, 0);
    
    var _start_y = _gui_h * 0.28;
    var _gap_y = 42;
    
    for (var i = 0; i < array_length(controls); i++) {
        var _current_y = _start_y + (i * _gap_y);
        
        draw_set_halign(fa_right);
        draw_set_color(c_gray);
        draw_text_transformed(_gui_w / 2 - 25, _current_y, controls[i][0], 1.2, 1.2, 0);
        
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        draw_text_transformed(_gui_w / 2 + 25, _current_y, controls[i][1], 1.2, 1.2, 0);
    }
    
    // DRAW MASTER VOLUME SLIDER TRACKS
    var _slider_x = _gui_w / 2;
    var _slider_y = _gui_h * 0.68;
    var _slider_left = _slider_x - (slider_width / 2);
    var _slider_right = _slider_x + (slider_width / 2);
    var _handle_x = _slider_left + (volume * slider_width);
    
    // Draw line
    draw_set_color(c_gray);
    draw_line_width(_slider_left, _slider_y, _slider_right, _slider_y, 4);
    
    // Draw bar handle
    if (slider_dragging || point_in_circle(_mx, _my, _handle_x, _slider_y, 15)) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    draw_circle(_handle_x, _slider_y, 8, false);
    
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    var _percentage = string(round(volume * 100)) + "%";
    draw_text_transformed(_slider_x, _slider_y - 28, "Master Volume: " + _percentage, 1.1, 1.1, 0);
    
    // DRAW BACK BUTTON
    draw_set_halign(fa_center);
    var _btn_y = _gui_h * 0.85;
    if (back_hovered) {
        draw_set_color(c_yellow);
        draw_text_transformed(_gui_w / 2, _btn_y, "> Back <", 1.3, 1.3, 0);
    } else {
        draw_set_color(c_white);
        draw_text_transformed(_gui_w / 2, _btn_y, "Back", 1.3, 1.3, 0);
    }
}