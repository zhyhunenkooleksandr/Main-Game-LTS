if (instance_exists(o_player)) {
    var _cam = view_camera[0];
    
    // 1. Where do we want the camera? 
    // We'll take the player's position and SUBTRACT a specific amount.
    // To see more of the CEILING, we want the camera to stay HIGHER.
    var _target_x = o_player.x - 485; // Half of your 970 width
    var _target_y = o_player.y - 450; // We subtract 450 so the player is near the bottom
    
    // 2. The Clamp (The Floor/Ceiling limits)
    // If you want to see the ceiling, the MIN must be 0.
    // If the camera isn't moving down, it's because the MAX is too small.
    _target_x = clamp(_target_x, 0, room_width - 970);
    _target_y = clamp(_target_y, 0, room_height - 540);
	
	// 4. Get where we ARE now
    var _curr_x = camera_get_view_x(_cam);
    var _curr_y = camera_get_view_y(_cam);

    // 5. Calculate the smooth intermediate step (LERP)
    // We store these in variables so we can "floor" them in the next step
    var _smooth_x = lerp(_curr_x, _target_x, 0.1);
    var _smooth_y = lerp(_curr_y, _target_y, 0.1);

    // 6. Apply the position - FLOORING stops the shattering/jitter!
    // This is where those variables are "referenced" and used.
    camera_set_view_pos(_cam, floor(_smooth_x), floor(_smooth_y));
}

