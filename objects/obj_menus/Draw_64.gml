///@description Menu drawing
if (pause) {

	//gaps to use for axis on line/words
	var xBuffer = 96;
	var yBuffer = 16;

	//store number "pageIndex" grid, to find height.
	var dsGrid = menuGrids[pIndex]; //remember its a ds_grid, not array
	var dsHeight = ds_grid_height(dsGrid);


	//"origin" point of the elements/line. (dividing line spawn point)
	var xStart = (camWidth / 2) - (((dsHeight - 1) / 2) * xBuffer);
	var yStart = camHeight / 4;

	//Align words above line
	var uAlign = yStart - yBuffer;
	var xuAlign;

	//align word origin (point where words spawn) to space a little more
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);

	//incrementing word spacing
	for (var i = 0; i < dsHeight; i++) {
		xuAlign = xStart + (i * xBuffer);
		var c = c_silver;
		var bump = 0;
	
		if (gridOptions[pIndex] == i) { //link between menus and gridOptions
			c = c_fuchsia;
			bump = yBuffer / 2;
		}
	
		draw_text_color(xuAlign, uAlign + bump, dsGrid[# 0, i], c, c, c, c, 255);
	}

	//draw line
	draw_line(xStart, yStart, xuAlign, yStart);


	//draw bottom elements
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);

	var dAlign = yStart + yBuffer;
	var xdAlign;

	//draw values/options
	for (i = 0; i < dsHeight;) {
		xdAlign = xStart + (i * xBuffer);
	
		switch (dsGrid[# 1, i]) {
			case menuType.shift: 
				var presetValue = dsGrid[# 3, i];
				var optionalValues = dsGrid[# 4, i];
				var shiftL = "<< ";
				var shiftR = " >>";
				c = c_silver;
			
				if (presetValue == 0) { shiftL = ""; }
				if (presetValue == array_length_1d(dsGrid[# 4, i]) - 1) { shiftR = ""; }
			
				draw_text_color(xdAlign, dAlign, shiftL + optionalValues[presetValue] + shiftR, c, c, c, c, 255);
			break;
		
			case menuType.equip: 
				var presetValue = dsGrid[# 2, i];
				var optionalValues = dsGrid[# 3, i];
				var array = dsGrid[# 3, i];
				var arrLen = array_length_1d(weaponinv);
				
				
				for (var xx = 0; xx < arrLen; xx++) {
					xdAlign = xStart + (xx * xBuffer);
					
					var bump = 0;
					var c = c_silver;
					var subPage = gridOptions[pIndex];
					if (inputting and equipOpt[subPage] == xx) { c = c_fuchsia; bump = yBuffer; }
					
					
					draw_text_color(xdAlign, dAlign + bump, dsWeaponsGrid[# 0, weaponinv[xx]], c, c, c, c, 255);
				}
				
			break;
		}
	  i++;
	}
}

var subPage = gridOptions[pIndex];

draw_text(view_xport[0] + 24, view_hport[0] - 200, "equipOpt[subPage] = " + string(equipOpt[subPage]));

draw_text(view_xport[0] + 24, view_hport[0] - 220, "preEquip = " + string(preEquip));


