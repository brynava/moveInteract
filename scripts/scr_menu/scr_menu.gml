var dsGrid = menuGrids[pIndex];


switch (dsGrid[# 1, gridOptions[pIndex]]) {
	case menuType.pages: pIndex = dsGrid[# 2,  gridOptions[pIndex]]; break;
	case menuType.equip: inputting = true; break;
}