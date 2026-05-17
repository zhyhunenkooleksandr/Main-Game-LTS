// Camera Settings
if (instance_exists(o_player)) {
    var _cam = view_camera[0];
    
    // 1. HANDLE THE ZOOM TIMEOUT
    if (intro_timer > 0) {
        intro_timer--;
        global.player_locked = true;
        
        var _progress = 1 - (intro_timer / 150); 
        
        // Start zoomed in and out
        var _zoom_w = lerp(base_w * 0.5, base_w, _progress);
        var _zoom_h = lerp(base_h * 0.5, base_h, _progress);
        
        camera_set_view_size(_cam, _zoom_w, _zoom_h);
    } else {
        // Lock camera size to normal
        global.player_locked = false;
        camera_set_view_size(_cam, base_w, base_h);
    }
    
   // --- 2. DYNAMIC CAMERA POSITIONING ---
    // Get width and height of camera
    var _cam_w = camera_get_view_width(_cam);
    var _cam_h = camera_get_view_height(_cam);
    
    // Center on the player horizontally
    var _target_x = o_player.x - (_cam_w / 2);
    
    var _target_y = o_player.y - (_cam_h / 2) + cam_offset_y;
    
    // Within boundaries of the room
    _target_x = clamp(_target_x, 0, room_width - _cam_w);
    _target_y = clamp(_target_y, 0, room_height - _cam_h);
    
    var _curr_x = camera_get_view_x(_cam);
    var _curr_y = camera_get_view_y(_cam);
    
    // Smooth camera movement towards target position
    var _smooth_x = lerp(_curr_x, _target_x, 0.1);
    var _smooth_y = lerp(_curr_y, _target_y, 0.1);
    
    camera_set_view_pos(_cam, floor(_smooth_x), floor(_smooth_y));
}