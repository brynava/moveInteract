///@description Destroy DS_Grids

var arrLen = array_length_1d(menuGrids);
for (var i = 0; i < arrLen; i++) { ds_grid_destroy(menuGrids[i]); } //destroy grid after use