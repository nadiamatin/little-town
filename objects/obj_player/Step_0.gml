/// @description Player Movement

// check keys for movement
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveUp = keyboard_check(vk_up);
moveDown = keyboard_check(vk_down);

// calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);


// if idle
if (vx == 0 && vy = 0) {
	// change idle sprite based on last direction
	switch dir {
		case 0: sprite_index = spr_player_idle_right; break;
		case 1: sprite_index = spr_player_idle_up; break;
		case 2: sprite_index = spr_player_idle_left; break;
		case 3: sprite_index = spr_player_idle_down; break;
		
	}
}

// if moving
if (vx != 0 || vy != 0) {
	// adding check for object in front of us
	if (!collision_point(x+vx, y, obj_par_environment, true, true)) {
		x += vx;
	}
	
	
	if (!collision_point(x, y+vy, obj_par_environment, true, true)) {
		y += vy;
	}
	
	// change walking sprite based on direction
	if (vx > 0) {
		sprite_index = spr_player_walk_right;
		dir = 0;
	}
	if (vx < 0) {
		sprite_index = spr_player_walk_left;
		dir = 2;
	}
	if (vy > 0) {
		sprite_index = spr_player_walk_down;
		dir = 3;
	}
	if (vy < 0) {
		sprite_index = spr_player_walk_up;
		dir = 1;
	}
	
	// move audio listener with me
	audio_listener_set_position(0, x, y, 0);
}

// check for collision with NPCs
nearbyNPC = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, obj_par_npc, false, true);
if (nearbyNPC) {
	// play greeting sound
	if (hasGreeted == false) {
		audio_play_sound(snd_greeting01, 1, 0);
		hasGreeted = true;
	}
	
	show_debug_message("obj_player has found an NPC!");
	
}
if (!nearbyNPC) {
	// reset greeting
	if (hasGreeted == true) {
		hasGreeted = false;	
	}
	show_debug_message("obj_player has NOT found an NPC!");
}

// depth sorting
depth = -y;