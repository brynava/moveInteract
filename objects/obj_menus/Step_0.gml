///@description Menu Moving
if (keyboard_check_pressed(vk_escape)) { pause = !pause; }

if (pause) {

	var move = 0;

	#region Input Vars
	var leftKey = keyboard_check_pressed(vk_left);
	var upKey = keyboard_check_pressed(vk_up);
	var wKey = keyboard_check_pressed(ord("W"));
	var aKey = keyboard_check_pressed(ord("A"));

	var enterKey = keyboard_check_pressed(vk_enter);
	var spaceKey = keyboard_check_pressed(vk_space);

	var rightKey = keyboard_check_pressed(vk_right);
	var downKey = keyboard_check_pressed(vk_down);
	var sKey = keyboard_check_pressed(ord("S"));
	var dKey = keyboard_check_pressed(ord("D"));
	#endregion

	var dsGrid = menuGrids[pIndex]; //useless right now (was for "accept"/scr_menu, but its in a script)
	var dsHeight = ds_grid_height(dsGrid);

	//adding to move
	move -= max(leftKey, upKey, aKey, wKey, 0);
	move += max(rightKey, downKey, dKey, sKey, 0);

	var accept = max(enterKey, spaceKey, 0);

	//adding move to gridOptions[pIndex] <-- pIndex = number of indice in menuGrids array. indice = grid/page.
	if (!inputting and move != 0) {
		gridOptions[pIndex] += move; //add to page swap
		
	
		if (gridOptions[pIndex] < 0) { gridOptions[pIndex] = dsHeight - 1; }
		if (gridOptions[pIndex] > dsHeight - 1) { gridOptions[pIndex] = 0; }
	} 
	
	if (inputting and move != 0) {
		
		var subPage = gridOptions[pIndex];
		var arrLen = array_length_1d(arrEquip);
		equipOpt[subPage] += move;

		if (equipOpt[subPage] < 0) { equipOpt[subPage] = arrLen - 1; }
		if (equipOpt[subPage] > arrLen - 1) { equipOpt[subPage] = 0; }
		
	}

	if (accept == 1) {
		scr_menu();
	}
	
	if (keyboard_check_pressed(ord("B"))) { inputting = false; }
	
	if (inputting and accept == 1) {
		var dsGrid = menuGrids[pIndex];
		var subPage = gridOptions[pIndex];
		preEquip = weaponinv[equipOpt[subPage]];
	}
}