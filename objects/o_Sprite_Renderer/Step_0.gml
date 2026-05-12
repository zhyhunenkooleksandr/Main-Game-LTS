//Playing Sprites
if (o_game_Fight.player_state == "idle") {
    sprite_index = s_idle_MC; 
} else if (o_game_Fight.player_state == "block") {
    sprite_index = s_block_MC; 
} else if (o_game_Fight.player_state == "attack") {
    sprite_index = s_attack_MC; 
}