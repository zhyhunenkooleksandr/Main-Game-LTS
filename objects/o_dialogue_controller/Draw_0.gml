// 1. Position of Speech Bubble
var _draw_x = x + 150; 
var _draw_y = y - 150; 

// 2. Adjust Scaling of Speech Bubblw
var _scale = 0.7; 

// 3. Draw the Sprite
draw_sprite_ext(s_speech_bubble, -1, _draw_x, _draw_y, _scale, _scale, 0, c_white, 1);

if (array_length(messages) > 0 && page < array_length(messages)) {
    var _current_text = string_copy(messages[page], 1, floor(char_count));
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    
    // Position of Text
    var _text_x_offset = 100 * _scale;
    var _text_y_offset = 150 * _scale;
    
    draw_text_ext(_draw_x - _text_x_offset, _draw_y - _text_y_offset, _current_text, 22, 240 * _scale);
}