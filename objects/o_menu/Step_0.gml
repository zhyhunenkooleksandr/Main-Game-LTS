// 1, Keyboard
var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _select_keyboard = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"));

var _move = _down - _up;
if (_move != 0) {
    index += _move;
    if (index < 0) index = array_length(options) - 1;
    if (index >= array_length(options)) index = 0;
}

// 2. Mouse Navigation
var _mouse_hovering_any = false;

for (var i = 0; i < array_length(options); i++) {
    var _item_x = room_width / 2;
    var _item_y = (room_height / 2) - 50 + (i * 120);
    
    // Createinvisible clickable box
    var _x1 = _item_x - 100;
    var _x2 = _item_x + 100;
    var _y1 = _item_y - 20;
    var _y2 = _item_y + 20;
    

    if (point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)) {
        index = i;
        _mouse_hovering_any = true;
    }
}

// 3. Selection
var _mouse_click = mouse_check_button_pressed(mb_left) && _mouse_hovering_any;

if (_select_keyboard || _mouse_click) {
    switch(index) {
        case 0: // PLAY BUTTON
            audio_stop_sound(snd_soundtrack); 
            room_goto(rm1);
            break;
            
        case 1: // SETTINGS BUTTON
            room_goto(rm_settings); 
            break;
            
        case 2: // QUIT BUTTON
            game_end();
            break;
    }
}