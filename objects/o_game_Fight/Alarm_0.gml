enemy_state = "attack";
enemy_can_damage = true; 
enemy_attack_timer = enemy_attack_duration;

// Reset the random timer for next attack
alarm[0] = room_speed * random_range(2, 5);