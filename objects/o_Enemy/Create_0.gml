hp = 2; // You can keep this here or use o_game_Fight.enemy_lives
state = "idle";
can_damage = true;
attack_timer = 0;

// Start the first random attack timer
alarm[0] = room_speed * random_range(2, 4);


