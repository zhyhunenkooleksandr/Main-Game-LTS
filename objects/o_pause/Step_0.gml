var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (!show_settings) {
    // PAUSE NAVIGATION
    var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
    var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
    var _select_keyboard = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"));
    
    var _move = _down - _up;
    if (_move != 0) {
        index += _move;
        if (index < 0) index = array_length(options) - 1;
        if (index >= array_length(options)) index = 0;
    }
    
    var _mouse_hovering_any = false;
    for (var i = 0; i < array_length(options); i++) {
        var _item_x = _gui_w / 2;
        var _item_y = (_gui_h / 2) + (i * menu_space);
        
        if (point_in_rectangle(_mx, _my, _item_x - 120, _item_y - 20, _item_x + 120, _item_y + 20)) {
            index = i;
            _mouse_hovering_any = true;
        }
    }
    
    var _mouse_click = mouse_check_button_pressed(mb_left) && _mouse_hovering_any;
    
    if (_select_keyboard || _mouse_click) {
        switch(index) {
            case 0: // RESUME
				audio_play_sound(snd_menu_forward, 1, false);
                instance_activate_all();
                if (sprite_exists(pause_sprite)) sprite_delete(pause_sprite);
                instance_destroy();
                break;
                
            case 1: // SETTINGS
                show_settings = true;
				audio_play_sound(snd_menu_forward, 1, false);
                break;
                
            case 2: // QUIT
				audio_play_sound(snd_menu_back, 1, false);
                game_end();
                break;
        }
    }
} else {
    // SETTINGS INTERIOR
    
    // 1. Volume Slider Logic
    var _slider_x = _gui_w / 2;
    var _slider_y = _gui_h * 0.68;
    var _slider_left = _slider_x - (slider_width / 2);
    var _slider_right = _slider_x + (slider_width / 2);
    var _handle_x = _slider_left + (volume * slider_width);
    
    if (mouse_check_button_pressed(mb_left)) {
        if (point_in_circle(_mx, _my, _handle_x, _slider_y, 15)) {
            slider_dragging = true;
        }
    }
    
    if (mouse_check_button_released(mb_left)) {
        slider_dragging = false;
    }
    
    if (slider_dragging) {
        var _new_volume = (_mx - _slider_left) / slider_width;
        volume = clamp(_new_volume, 0, 1);
        audio_master_gain(volume);
    }
    
    // 2. Back Button
    var _back_keyboard = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"));
    
    var _btn_x = _gui_w / 2;
    var _btn_y = _gui_h * 0.85;
    
    if (point_in_rectangle(_mx, _my, _btn_x - 120, _btn_y - 20, _btn_x + 120, _btn_y + 20)) {
        back_hovered = true;
    } else {
        back_hovered = false;
    }
    
    var _mouse_click = mouse_check_button_pressed(mb_left) && back_hovered;
    
    if (_back_keyboard || _mouse_click) {
		audio_play_sound(snd_menu_back, 1, false);
        show_settings = false; 
        slider_dragging = false;
    }
}