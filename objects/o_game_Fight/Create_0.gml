//Create a blur effect on crowd
var _crowd_blur = fx_create("_filter_large_blur");
fx_set_parameter(_crowd_blur, "g_Radius", 1);
layer_set_fx("Crowd", _crowd_blur);


// Enemy and Player Lives
player_lives = 2;
enemy_lives = 2;

// States & Mechanics
player_state = "idle";
enemy_state = "idle";
enemy_can_damage = true;
player_can_damage = true;

// Random Enemy Attack
alarm[0] = room_speed * random_range(1, 2);

//Attack Timers
attack_duration = 10;
enemy_attack_duration = 20;
enemy_attack_timer = 0;
attack_timer = 0;