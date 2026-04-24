//Camer Settings
if (instance_exists(o_player)) {
    var _cam = view_camera[0];
    
    var _target_x = o_player.x - 485;
    var _target_y = o_player.y - 450;
    
    _target_x = clamp(_target_x, 0, room_width - 970);
    _target_y = clamp(_target_y, 0, room_height - 540);
	
    var _curr_x = camera_get_view_x(_cam);
    var _curr_y = camera_get_view_y(_cam);

    var _smooth_x = lerp(_curr_x, _target_x, 0.1);
    var _smooth_y = lerp(_curr_y, _target_y, 0.1);

    
    camera_set_view_pos(_cam, floor(_smooth_x), floor(_smooth_y));
}

