options = ["Resume", "Settings", "Quit"];
index = 0;

// 1. SNIPE THE FOOTSTEP LOOPS BEFORE FREEZING
audio_stop_sound(snd_walking_2);
audio_stop_sound(snd_walking_3);

if (instance_exists(o_player)) {
    o_player.walking_sound = -1;
}

// 2. FREEZE THE ROOM
instance_deactivate_all(true);
instance_activate_object(o_camera); 

// 3. LAYOUT INITIALIZATION
pause_sprite = -1; 
menu_space = 75; 
show_settings = false;

controls = [
    ["Interaction", "E"],
    ["Walking",     "WASD"],
    ["Attacking",   "A"],
    ["Defence",     "D"]
];
back_hovered = false;

volume = 1.0;            
slider_width = 200;      
slider_dragging = false;