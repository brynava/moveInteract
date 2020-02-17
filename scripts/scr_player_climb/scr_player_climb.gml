scr_getinputs();

var meeting = tilemap_get_at_pixel(wallmap, bbox_left, bbox_bottom + 1)
||
tilemap_get_at_pixel(wallmap, bbox_right, bbox_bottom + 1)
||
tilemap_get_at_pixel(S_wallmap, bbox_left, bbox_bottom + 1)
||
tilemap_get_at_pixel(S_wallmap, bbox_right, bbox_bottom + 1);




if (input_run) {											//Climbing

			scr_mvars(0.5, 0.1); 
			spd = speeds.climb; 
			moveX = (input_right - input_left) * spd; 
			moveY = (input_down - input_up) * spd; 
			scr_momentum(true, 1); 
		
	}

else if (meeting) {							//Scaffold

			scr_mvars(1, 1.5); 
			if (input_run) { spd = speeds.run; }
			else		   { spd = speeds.normal; }
			moveX = (input_right - input_left) * spd; 
			moveY = 0; 
			scr_momentum(true, 0.6); 

	} 

else {														//Falling

			scr_mvars(0.17, 0.4); 
			spd = speeds.fall; 
			moveX = 0; 
			moveY = spd; 
			scr_momentum(false, 0); 
			
			if (moveY > speeds.climb and input_up) { moveX = (input_right - input_left) * speeds.climb; } //Steering Fall

}



//Check State

var TL32 = tilemap_get_at_pixel(climbmap, bbox_left, bbox_top) & tile_index_mask;
var TR32 = tilemap_get_at_pixel(climbmap, bbox_right, bbox_top) & tile_index_mask;
var BL32 = tilemap_get_at_pixel(climbmap, bbox_left, bbox_bottom) & tile_index_mask;
var BR32 = tilemap_get_at_pixel(climbmap, bbox_right, bbox_bottom) & tile_index_mask;

if ((TL32 | TR32 | BL32 | BR32) = 0) {
	moveX = 0;
	moveY = 0;
	state = states.normal;
}



scr_fractional();



scr_player_wall();