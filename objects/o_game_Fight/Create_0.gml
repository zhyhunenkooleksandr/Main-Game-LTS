// Enemy and Player Lives
player_lives = 15;
enemy_lives = 20;

// APPLY ITEMS EFFECTS

//Locker Items
if (global.has_item == true) {
    if (global.item_id == 0) {
        //Bad Item
        enemy_lives += 10;
    } else if (global.item_id == 1) {
        //Good Item
        enemy_lives -= 10;
    }
    
    global.has_item = false; 
}

//Bush Items
if (global.has_bush_item == true) {
	//Bad bug
    if (global.bush_item_id == 0) {
        player_lives -= 5;
	//Good bug
    } else if (global.bush_item_id == 1) {
        player_lives += 5;
    }
    
    global.has_bush_item = false; 
}

// States & Mechanics
player_state = "idle";
enemy_state = "idle";
var _crowd_blur = fx_create("_filter_large_blur");
fx_set_parameter(_crowd_blur, "g_Radius", 1);
layer_set_fx("Crowd", _crowd_blur);

enemy_can_damage = true;
player_can_damage = true;

// Random Enemy Attack
alarm[0] = room_speed * random_range(1, 2);

//Attack Timers
attack_duration = 10;
enemy_attack_duration = 20;
enemy_attack_timer = 0;
attack_timer = 0;