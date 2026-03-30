/// @description Insert description here

// 1. Get Input
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _key_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var _key_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

var _input_x = _key_right - _key_left;
var _input_y = _key_down - _key_up;

// 2. Target Velocity (Normalized)
var _target_vx = 0;
var _target_vy = 0;

if (_input_x != 0 || _input_y != 0) {
    var _dir = point_direction(0, 0, _input_x, _input_y);
    _target_vx = lengthdir_x(move_sp, _dir);
    _target_vy = lengthdir_y(move_sp, _dir);
}

// 3. Lerp (Smoothness)
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

// 6. Animation Logic (Fixed for Negatives)
if (_input_x != 0 || _input_y != 0) {
    // Determine which direction is being pressed harder
    if (abs(_input_x) >= abs(_input_y)) {
        if (_input_x > 0)      image_index = 0; // Right
        else if (_input_x < 0) image_index = 1; // Left
    } else {
        if (_input_y > 0)      image_index = 2; // Front
        else if (_input_y < 0) image_index = 3; // Back
    }
} else {
    // Only idle if speed has almost stopped
    if (abs(vx) < 0.2 && abs(vy) < 0.2) {
        image_index = 2;
    }
}

// For future animations
image_speed = 0;