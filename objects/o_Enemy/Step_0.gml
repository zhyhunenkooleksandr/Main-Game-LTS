// IDLE // ATTACK // BLOCK // HURT // Enemy
if (o_game_Fight.enemy_state == "idle") {
	image_xscale = 0.9
	image_yscale = 0.9
    sprite_index = s_bully_idle;
} else if (o_game_Fight.enemy_state == "attack") {
    sprite_index = s_bully_Attack;
	image_xscale = 0.9
	image_yscale = 0.9
}
else if (o_game_Fight.enemy_state == "block") {
	image_xscale = 0.9
	image_yscale = 0.9
    sprite_index = s_bully_block;

} else if (o_game_Fight.enemy_state == "hurt") {
    image_xscale = 0.9;
    image_yscale = 0.9;
    sprite_index = s_bully_damaged;
}

//Enemy Dies
if (o_game_Fight.enemy_lives <= 0) instance_destroy();

