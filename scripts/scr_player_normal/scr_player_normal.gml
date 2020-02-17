scr_getinputs();
scr_mvars(1, 1.5);


//Adding More Speed

if (input_run) { spd = speeds.run; }
else		   { spd = speeds.normal; }


//Movement Intention (0.2 because + 0.2 every step to get to maxspd (accel))

moveX = (input_right - input_left) * 0.2;
moveY = (input_down - input_up) * 0.2;


//STATE CHECK ICE 
var TL32 = tilemap_get_at_pixel(icemap, bbox_left, bbox_top) & tile_index_mask;
var TR32 = tilemap_get_at_pixel(icemap, bbox_right, bbox_top) & tile_index_mask;
var BL32 = tilemap_get_at_pixel(icemap, bbox_left, bbox_bottom) & tile_index_mask;
var BR32 = tilemap_get_at_pixel(icemap, bbox_right, bbox_bottom) & tile_index_mask;

if (TL32 | TR32 | BL32 | BR32) { 
	moveX = 0; 
	moveY = 0; 
	state = states.ice; 
} 

//STATE CHECK BATTLE
batInst = instance_place(x, y, obj_overenemy);

if (place_meeting(x, y, obj_overenemy)) {
	moveX = 0;
	moveY = 0;
	state = states.battle;
}



scr_diagonal(); 

scr_momentum(true, 0.6); 

scr_fractional(); 




scr_player_wall();