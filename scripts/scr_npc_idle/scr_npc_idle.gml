scr_mvars(.2, .3);
/*
movetimer = measures time moving
stoptimer = measures time standing still/stopping
*/
enum npcmove {
	u,
	d,
	l,
	r,
	ur,
	dr,
	ul,
	dl,
	stop,
	none
}


if (movetimer > 0) { movetimer--; }
if (stoptimer > 0) { stoptimer--; }

show_debug_message("movetimer: " + string(movetimer));
show_debug_message("stoptimer: " + string(stoptimer));

if (movetimer == 0) { 
	npcpoints++; 
	if (npcpoints mod 3 == 0) { stoptimer = room_speed * 1.5; } else { stoptimer = room_speed / 2; } 
	moveNPC = npcmove.stop; 
	movetimer = -1; 
}

if (stoptimer == 0) { 
	movetimer = room_speed * .3;
	moveNPC = choose(npcmove.u, npcmove.d, npcmove.l, npcmove.r, npcmove.ur, npcmove.dr, npcmove.ul, npcmove.dl); 
	stoptimer = -1;
}



switch (moveNPC) {
	case npcmove.u:		moveY = -spd;						break;
	case npcmove.d:		moveY = spd;						break;
	case npcmove.l:		moveX = -spd;						break;
	case npcmove.r:		moveX = spd;						break;
	case npcmove.ur:	moveX = spd;  moveY = -spd;			break;
	case npcmove.dr:	moveX = spd;  moveY = spd;			break;
	case npcmove.ul:	moveX = -spd; moveY = -spd;			break;
	case npcmove.dl:	moveX = -spd; moveY = spd;			break;
	case npcmove.stop:  moveX = 0;	  moveY = 0;			break;
}


#region Collision Prevention
var meeting = tilemap_get_at_pixel(wallmap, bbox_left + (sign(moveX) * 16), bbox_top)
||
tilemap_get_at_pixel(wallmap, bbox_left + (sign(moveX) * 16), bbox_bottom)
||
tilemap_get_at_pixel(wallmap, bbox_right + (sign(moveX) * 16), bbox_top)
||
tilemap_get_at_pixel(wallmap, bbox_right + (sign(moveX) * 16), bbox_bottom)
||
tilemap_get_at_pixel(wallmap, bbox_left, bbox_top + (sign(moveY) * 16))
||
tilemap_get_at_pixel(wallmap, bbox_left, bbox_bottom + (sign(moveY) * 16))
||
tilemap_get_at_pixel(wallmap, bbox_right, bbox_top + (sign(moveY) * 16))
||
tilemap_get_at_pixel(wallmap, bbox_right, bbox_bottom + (sign(moveY) * 16));
//---------------------------------------------------------------------
var meeting16 = tilemap_get_at_pixel(S_wallmap, bbox_left + (sign(moveX) * 8), bbox_top)
||
tilemap_get_at_pixel(S_wallmap, bbox_left + (sign(moveX) * 8), bbox_bottom)
||
tilemap_get_at_pixel(S_wallmap, bbox_right + (sign(moveX) * 8), bbox_top)
||
tilemap_get_at_pixel(S_wallmap, bbox_right + (sign(moveX) * 8), bbox_bottom)
||
tilemap_get_at_pixel(S_wallmap, bbox_left, bbox_top + (sign(moveY) * 8))
||
tilemap_get_at_pixel(S_wallmap, bbox_left, bbox_bottom + (sign(moveY) * 8))
||
tilemap_get_at_pixel(S_wallmap, bbox_right, bbox_top + (sign(moveY) * 8))
||
tilemap_get_at_pixel(S_wallmap, bbox_right, bbox_bottom + (sign(moveY) * 8))
||
tilemap_get_at_pixel(S_wallmap, bbox_left + (sign(moveX) * 8), bbox_top + sprite_height / 2)
||
tilemap_get_at_pixel(S_wallmap, bbox_right + (sign(moveX) * 8), bbox_top + sprite_height / 2)
||
tilemap_get_at_pixel(S_wallmap, bbox_left + sprite_width / 2, bbox_top + (sign(moveY) * 8))
||
tilemap_get_at_pixel(S_wallmap, bbox_left + sprite_width / 2, bbox_bottom + (sign(moveY) * 8));
#endregion


if (meeting || meeting16) {
	if (moveX > 0) { moveX = moveX * -1; }
	if (moveX < 0) { moveX = abs(moveX); }
	if (moveY > 0) { moveY = moveY * -1; }
	if (moveY < 0) { moveY = abs(moveY); }
}


show_debug_message(string(moveNPC));
show_debug_message("points: " + string(npcpoints));

scr_diagonal(); 

scr_momentum(false, 0); 

scr_fractional(); 


scr_player_wall(); 