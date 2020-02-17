	var x1, x2, y1, y2; //Values for transparent inventory border. (shape and size)

	x1 = view_xport[0];
	x2 = x1 + view_wport[0];
	y1 = view_yport[0];
	y2 = y1 + 64;

if (showInv) {
	draw_set_alpha(0.8);
	draw_rectangle_color(x1, y1, x2, y2, c_gray, c_gray, c_white, c_white, 0); //drawing inv rectangle
	
	
	//draws said slots apart each other with arguments
	for (var i = 0; i < maxItems; i += 1) { 
		draw_sprite(spr_slot, 0, x1 + 24 + (i * 40), y2 - 24);
		
		//also draws subimgs from spr_items, with same distance as spr_slot
		if (global.inventory[i] != -1) { 
			draw_sprite(spr_items, global.inventory[i], x1 + 24 + (i * 40), y2 - 24);
		}//					 array = subimg, (remember, what the array "equals" (create event) is a value/data)
 	}
}