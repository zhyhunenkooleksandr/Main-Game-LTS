//Intro
if (global.player_locked == true) {
    vx = 0;
    vy = 0;
    image_speed = 0;
    if (last_dir == "right") sprite_index = s_idle_animation_right;
    else sprite_index = s_idle_animation_left;
    exit;
}
//Camera
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

var _target_x = x - (_cam_w / 2);
var _target_y = y - (_cam_h / 2);

_target_x = clamp(_target_x, 0, room_width - _cam_w);
_target_y = clamp(_target_y, 0, room_height - _cam_h);

var _current_x = camera_get_view_x(view_camera[0]);
var _current_y = camera_get_view_y(view_camera[0]);

var _smooth_x = lerp(_current_x, _target_x, 0.03);
var _smooth_y = lerp(_current_y, _target_y, 0.03);

camera_set_view_pos(view_camera[0], _smooth_x, _smooth_y);

// 1. Get Input
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _key_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var _key_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

var _input_x = _key_right - _key_left;
var _input_y = _key_down - _key_up;

// 2. Target Velocity
var _target_vx = 0;
var _target_vy = 0;

if (_input_x != 0 || _input_y != 0) {
    var _dir = point_direction(0, 0, _input_x, _input_y);
    _target_vx = lengthdir_x(move_sp, _dir);
    _target_vy = lengthdir_y(move_sp, _dir);
}

// 3. Lerp
vx = lerp(vx, _target_vx, 0.2);
vy = lerp(vy, _target_vy, 0.2);

// 4. Horizontal Collision
if (place_meeting(x + vx, y, o_wall)) {
    while (!place_meeting(x + sign(vx), y, o_wall)) {
        x += sign(vx);
    }
    vx = 0;
}
x += vx;

// 5. Vertical Collision
if (place_meeting(x, y + vy, o_wall)) {
    while (!place_meeting(x, y + sign(vy), o_wall)) {
        y += sign(vy);
    }
    vy = 0;
}
y += vy;

// 6. Animation and Sound Logic
if (_input_x != 0 || _input_y != 0) {
    // 1. Turn animation ON
    image_speed = 1;
	image_xscale = -0.55; 
    image_yscale = 0.55;

    if (_input_x > 0)      last_dir = "right";
    else if (_input_x < 0) last_dir = "left";

    // Set walking sprite
    if (last_dir == "right") sprite_index = s_walking_animation_frame_left;
    else                     sprite_index = s_walking_animation_frame_right;
		
	// --- FOOTSTEP SOUND LOGIC ---
	if (walking_sound == -1) {
        walking_sound = choose(snd_walking_2, snd_walking_3);
		audio_sound_gain(snd_walking_2, 0.3, 0);
		audio_sound_gain(snd_walking_3, 0.3, 0);
    }

    // 2. If that specific sound isn't playing yet, start it on a LOOP
    if (!audio_is_playing(walking_sound)) {
        audio_play_sound(walking_sound, 1, true); // 'true' makes it loop!
    }
}

else {
    if (abs(vx) < 0.2 && abs(vy) < 0.2) {
        image_speed = 0.3;
        image_yscale = 0.55;
        image_xscale = 0.55;

        if (last_dir == "right") sprite_index = s_idle_animation_right;
        else                     sprite_index = s_idle_animation_left;
        
        // --- INSTANT STOP ---
        // This kills the "loop" the moment the player stops moving
        if (walking_sound != -1) {
            audio_stop_sound(walking_sound);
            walking_sound = -1;
			
			
        } 
	}
}