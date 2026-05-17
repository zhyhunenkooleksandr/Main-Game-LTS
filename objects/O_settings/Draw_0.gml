draw_set_valign(fa_middle);

//1. DRAW HEADER
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_transformed(room_width / 2, (room_height / 2) - 250, "SETTINGS", 1.6, 1.6, 0);

//2. DRAW COLUMNS
var _start_y = (room_height / 2) - 100;
var _gap_y = 75;

for (var i = 0; i < array_length(controls); i++) {
    var _current_y = _start_y + (i * _gap_y);
    
    // Left Column (Actions)
    
    draw_set_halign(fa_right);
    draw_set_color(c_gray); 
    draw_text_transformed(room_width / 2 - 35, _current_y, controls[i][0], 1.3, 1.3, 0);
    
    // Right Column (Keys)
    draw_set_halign(fa_left);
    draw_set_color(c_white); 
    draw_text_transformed(room_width / 2 + 35, _current_y, controls[i][1], 1.3, 1.3, 0);
}

//3. DRAW INTERACTABLE BACK BUTTON
draw_set_halign(fa_center);
var _btn_y = back_btn_y

if (back_hovered) {
    draw_set_color(c_yellow);
    draw_text_transformed(room_width / 2, _btn_y, "> Back <", 1.4, 1.4, 0);
} else {
    draw_set_color(c_white);
    draw_text_transformed(room_width / 2, _btn_y, "Back", 1.4, 1.4, 0);
}