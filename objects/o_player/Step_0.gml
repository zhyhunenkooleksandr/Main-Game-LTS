/// @description Insert description here

sprite_index = s_player; // Ensure we are using the correct sprite

// 1. Get Input
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _key_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var _key_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

// 2. Assign the temporary direction variables
var _input_x = _key_right - _key_left;
var _input_y = _key_down - _key_up;

// 3. Calculate the "Target" (where we want to be)
var _target_vx = 0;
var _target_vy = 0;

if (_input_x != 0 || _input_y != 0) {
    var _dir = point_direction(0, 0, _input_x, _input_y);
    _target_vx = lengthdir_x(move_sp, _dir);
    _target_vy = lengthdir_y(move_sp, _dir);
}

// 4. Smoothly Reach Target (Lerp)
vx = lerp(vx, _target_vx, 0.2);
vy = lerp(vy, _target_vy, 0.2);

// 5. Apply Movement
x += vx;
y += vy;

// 6. Animation Logic (FIXED)
// We check if we are moving faster than a tiny "jitter" threshold
if (abs(vx) > 0.2 || abs(vy) > 0.2) {
    
    // DECISION: Are we moving more Horizontally or Vertically?
    if (abs(vx) > abs(vy)) {
        // Horizontal is dominant
        if (vx > 0) image_index = 0; // Right
        else image_index = 1;        // Left
    } else {
        // Vertical is dominant
        if (vy > 0) image_index = 2; // Front
        else image_index = 3;        // Back
    }
    
} else {
    // IDLE: Not moving enough to trigger a walk frame
    image_index = 2; 
}

// Keep the sprite from cycling frames automatically
image_speed = 0;
sprite_index = s_player;