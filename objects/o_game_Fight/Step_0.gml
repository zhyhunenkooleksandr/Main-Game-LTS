// --- CONTROLS ---
var _key_atk = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("A"));
var _key_blk = mouse_check_button(mb_right) || keyboard_check(ord("D"));

// --- HANDLE PLAYER STATES ---
if (player_state == "idle") {
    if (_key_atk) {
        player_state = "attack";
        player_can_damage = true;
        attack_timer = attack_duration;
    } else if (_key_blk) {
        player_state = "block";
    }
}

if (player_state == "block") {
    if (!mouse_check_button(mb_right) && !keyboard_check(ord("D"))) {
        player_state = "idle";
    }
}

// --- PLAYER ATTACK LOGIC ---
if (player_state == "attack") {
    attack_timer -= 1;
    
    if (attack_timer == 1 && player_can_damage) {
        if (enemy_state == "idle" && irandom(1) == 1) {
            enemy_state = "block";
            enemy_attack_timer = 20;
        } else {
            enemy_lives -= 1;
        }
        player_can_damage = false; 
    }

    if (attack_timer <= 0) {
        player_state = "idle";
    }
}

// --- ENEMY ATTACK LOGIC ---
if (enemy_state == "block") {
    enemy_attack_timer -= 1;
    if (enemy_attack_timer <= 0) {
        enemy_state = "idle";
    }
}

if (enemy_state == "attack") {
    enemy_attack_timer -= 1; 
    
    if (enemy_attack_timer == 1 && enemy_can_damage) {
        if (player_state != "block") {
            player_lives -= 1;
        }
        enemy_can_damage = false; 
    }
    
    if (enemy_attack_timer <= 0) {
        enemy_state = "idle";
    }
}

// --- DEATH CHECK ---
   // --- PLAYER ---
if (player_lives <= 0) {
    instance_destroy();
    show_message("Prototype End: Player Defeated.");
    game_restart();
}
   // --- ENEMY ---
if (enemy_lives <= 0) {
    instance_destroy();
    show_message("Prototype Victory: Enemy Defeated.");
    game_end();
}




