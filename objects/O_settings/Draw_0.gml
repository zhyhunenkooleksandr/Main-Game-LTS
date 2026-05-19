draw_set_valign(fa_middle);

//1. DRAW HEADER
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_transformed(room_width / 2, header_y, "SETTINGS", 1.6, 1.6, 0);

//2. DRAW COLUMNS
for (var i = 0; i < array_length(controls); i++) {
    var _current_y = controls_start_y + (i * controls_gap);
    
    // Left side (Actions) - clean alignment anchor
    draw_set_halign(fa_right);
    draw_set_color(c_gray); 
    draw_text_transformed(room_width / 2 - 35, _current_y, controls[i][0], 1.3, 1.3, 0);
    
    // Right side (Keys)
    draw_set_halign(fa_left);
    draw_set_color(c_white); 
    draw_text_transformed(room_width / 2 + 35, _current_y, controls[i][1], 1.3, 1.3, 0);
}

//3. DRAW MASTER VOLUME SLIDER
var _slider_left = slider_x - (slider_width / 2);
var _slider_right = slider_x + (slider_width / 2);
var _handle_x = _slider_left + (volume * slider_width);

// Draw background rail line
draw_set_color(c_gray);
draw_line_width(_slider_left, slider_y, _slider_right, slider_y, 4);

// Draw handle node
if (slider_dragging || point_in_circle(mouse_x, mouse_y, _handle_x, slider_y, 15)) {
    draw_set_color(c_yellow);
} else {
    draw_set_color(c_white);
}
draw_circle(_handle_x, slider_y, 8, false);

// Draw slider text percentage label
draw_set_halign(fa_center);
draw_set_color(c_white);
var _percentage = string(round(volume * 100)) + "%";
draw_text_transformed(slider_x, slider_y - 35, "Master Volume: " + _percentage, 1.1, 1.1, 0);

//4. DRAW BACK BUTTON
draw_set_halign(fa_center);
var _btn_y = back_btn_y; 

if (back_hovered) {
    draw_set_color(c_yellow);
    draw_text_transformed(room_width / 2, _btn_y, "> Back <", 1.4, 1.4, 0);
} else {
    draw_set_color(c_white);
    draw_text_transformed(room_width / 2, _btn_y, "Back", 1.4, 1.4, 0);
}