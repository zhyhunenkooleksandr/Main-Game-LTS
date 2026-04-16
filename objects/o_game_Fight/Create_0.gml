player_lives = 2;
enemy_lives = 2;

// States & Mechanics
player_state = "idle";
enemy_state = "idle";
enemy_can_damage = true;
player_can_damage = true; // For a single hit per swing

// Random Enemy Attack (between 2 and 4 seconds)
alarm[0] = room_speed * random_range(2, 4);

attack_duration = 10; // How many frames the punch stays on screen (about 0.25s)
enemy_attack_duration = 20; // Enemy punch length (slightly longer to see it)
enemy_attack_timer = 0;
attack_timer = 0;


