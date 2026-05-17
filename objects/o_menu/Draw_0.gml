draw_set_font(fnt_menu);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(options); i++) {
    
    var _y_pos = (room_height / 2) - 50 + (i * 120); 
    
    if (i == index) {
        draw_set_color(c_yellow);
        draw_text(room_width / 2, _y_pos, "> " + options[i] + " <");
    } else {
        draw_set_color(c_white);
        draw_text(room_width / 2, _y_pos, options[i]);
    }
}