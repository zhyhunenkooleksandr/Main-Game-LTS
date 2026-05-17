// 1. Keyboard Navigation
var _select_keyboard = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_escape);

// 2. Audio Slider Dragging Logic
var _slider_left = slider_x - (slider_width / 2);
var _slider_right = slider_x + (slider_width / 2);
var _handle_x = _slider_left + (volume * slider_width);

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_circle(mouse_x, mouse_y, _handle_x, slider_y, 15)) {
        slider_dragging = true;
    }
}

if (mouse_check_button_released(mb_left)) {
    slider_dragging = false;
}

if (slider_dragging) {
    var _new_volume = (mouse_x - _slider_left) / slider_width;
    volume = clamp(_new_volume, 0, 1);
    audio_master_gain(volume); 
}

// 3. Back Button Mouse Hover Logic
var _btn_x = room_width / 2;
var _btn_y = back_btn_y; 

var _x1 = _btn_x - 120;
var _x2 = _btn_x + 120;
var _y1 = _btn_y - 25;
var _y2 = _btn_y + 25;

if (point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)) {
    back_hovered = true;
} else {
    back_hovered = false;
}

var _mouse_click = mouse_check_button_pressed(mb_left) && back_hovered;

if (_select_keyboard || _mouse_click) {
    room_goto(rm_menu); 
}