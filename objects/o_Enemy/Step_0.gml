// Just follow the controller's orders
if (o_game_Fight.enemy_state == "idle") {
    sprite_index = s_bully_Idle;
} else if (o_game_Fight.enemy_state == "attack") {
    sprite_index = s_bully_attack;
}
else if (o_game_Fight.enemy_state == "block") {
    sprite_index = s_bully_Block; // <--- ADD THIS
}

// Keep health in sync (Optional but helpful)
if (o_game_Fight.enemy_lives <= 0) instance_destroy();

