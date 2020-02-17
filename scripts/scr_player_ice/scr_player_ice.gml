scr_getinputs();

var moveR = moveX > 0;
var moveL = moveX < 0;
var moveD = moveY > 0;
var moveU = moveY < 0;

if (moveX != 0 and moveY != 0) { moveX = 0; }

spd = speeds.ice;

enum dir {
	none,
	left,
	right,
	up,
	down,
}

var moving = false;
var direct = dir.none;


if (moveR) { direct = dir.right; moving = true; }
if (moveL) { direct = dir.left; moving = true; }
if (moveD) { direct = dir.down; moving = true; }
if (moveU) { direct = dir.up; moving = true; }


if (moving == false) {
	if (moveY == 0) { moveX = (input_right - input_left) * spd; }
	if (moveX == 0) { moveY = (input_down - input_up) * spd; }
}


switch (direct) {
	case dir.left: moveX = -spd;	break;
	case dir.right: moveX = spd;	break;
	case dir.up: moveY = -spd;		break;
	case dir.down: moveY = spd;		break;
}

#region Meeting Vars
var meeting = tilemap_get_at_pixel(wallmap, bbox_left + sign(moveX), bbox_top)
||
tilemap_get_at_pixel(wallmap, bbox_left + sign(moveX), bbox_bottom)
||
tilemap_get_at_pixel(wallmap, bbox_right + sign(moveX), bbox_top)
||
tilemap_get_at_pixel(wallmap, bbox_right + sign(moveX), bbox_bottom)
||
tilemap_get_at_pixel(wallmap, bbox_left, bbox_top + sign(moveY))
||
tilemap_get_at_pixel(wallmap, bbox_left, bbox_bottom + sign(moveY))
||
tilemap_get_at_pixel(wallmap, bbox_right, bbox_top + sign(moveY))
||
tilemap_get_at_pixel(wallmap, bbox_right, bbox_bottom + sign(moveY));
//---------------------------------------------------------------------
var meeting16 = tilemap_get_at_pixel(S_wallmap, bbox_left + sign(moveX), bbox_top)
||
tilemap_get_at_pixel(S_wallmap, bbox_left + sign(moveX), bbox_bottom)
||
tilemap_get_at_pixel(S_wallmap, bbox_right + sign(moveX), bbox_top)
||
tilemap_get_at_pixel(S_wallmap, bbox_right + sign(moveX), bbox_bottom)
||
tilemap_get_at_pixel(S_wallmap, bbox_left, bbox_top + sign(moveY))
||
tilemap_get_at_pixel(S_wallmap, bbox_left, bbox_bottom + sign(moveY))
||
tilemap_get_at_pixel(S_wallmap, bbox_right, bbox_top + sign(moveY))
||
tilemap_get_at_pixel(S_wallmap, bbox_right, bbox_bottom + sign(moveY))
||
tilemap_get_at_pixel(S_wallmap, bbox_left + sign(moveX), bbox_top + sprite_height / 2)
||
tilemap_get_at_pixel(S_wallmap, bbox_right + sign(moveX), bbox_top + sprite_height / 2)
||
tilemap_get_at_pixel(S_wallmap, bbox_left + sprite_width / 2, bbox_top + sign(moveY))
||
tilemap_get_at_pixel(S_wallmap, bbox_left + sprite_width / 2, bbox_bottom + sign(moveY));
#endregion

if (meeting or meeting16) { moveX = 0; moveY = 0; }

var TL32 = tilemap_get_at_pixel(icemap, bbox_left, bbox_top) & tile_index_mask;
var TR32 = tilemap_get_at_pixel(icemap, bbox_right, bbox_top) & tile_index_mask;
var BL32 = tilemap_get_at_pixel(icemap, bbox_left, bbox_bottom) & tile_index_mask;
var BR32 = tilemap_get_at_pixel(icemap, bbox_right, bbox_bottom) & tile_index_mask;

if ((TL32 | TR32 | BL32 | BR32) = 0) {
	moveX = 0;
	moveY = 0;
	state = states.normal;
}



scr_player_wall();