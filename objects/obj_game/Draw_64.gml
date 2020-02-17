draw_set_color(c_white);

draw_set_halign(fa_left);

draw_text(view_xport[0] + 24, view_hport[0] - 56, "moveX: " + string(obj_player.moveX));

draw_text(view_xport[0] + 24, view_hport[0] - 42, "moveY: " + string(obj_player.moveY));

draw_text(view_xport[0] + 24, view_hport[0] - 72, "state: " + string(obj_player.state));

draw_text(view_xport[0] + 24, view_hport[0] - 90, "npc posx: " + string(obj_NPC.x));

draw_text(view_xport[0] + 24, view_hport[0] - 110, "npc posy: " + string(obj_NPC.y));

draw_text(view_xport[0] + 24, view_hport[0] - 125, "npc moveX: " + string(obj_NPC.moveX));

draw_text(view_xport[0] + 24, view_hport[0] - 140, "npc moveY: " + string(obj_NPC.moveY));




/*
diagonal movement fix (climbing), fractional movement fixes, revamping ICE, 
making climb solid UNLESS shift, momentum movement, changing spd vars to enums (maybe), sliding past corners
fix directional influence on falling (shift + DIR) (climb state), collide climb state when !input_run,
pixel based collisons (buffers, loops, binary, arrays, grids), climb (snaps) to a safe spot when not in 
*/
