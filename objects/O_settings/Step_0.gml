// 1. Keyboard Navigation
var _select_keyboard = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_escape);

// 2. Mouse Navigation Setup 
var _btn_x = room_width / 2;
var _btn_y = back_btn_y;

// Invisible click box
var _x1 = _btn_x - 100;
var _x2 = _btn_x + 100;
var _y1 = _btn_y - 20;
var _y2 = _btn_y + 20;

// Check for mouse hover
if (point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)) {
    back_hovered = true;
} else {
    back_hovered = false;
}

var _mouse_click = mouse_check_button_pressed(mb_left) && back_hovered;

// 3. Trigger Room Change
if (_select_keyboard || _mouse_click) {
    room_goto(rm_menu);
}