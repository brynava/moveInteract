///@arg [title1, type1, execute1, entries....]
///@arg [title2, type2, execute2, entries....]

//storing each array arguments in a var array
var arg;
for (var i = 0; i < argument_count; i++) {
	arg[i] = argument[i];
}

//create ds_grid
var dsGrid = ds_grid_create(5, argument_count);

//fill ds_grid
for (i = 0; i < argument_count;) {
	var array = arg[i];
	var arrLen = array_length_1d(array);
		for (var xx = 0; xx < arrLen; xx++) {
			dsGrid[# xx, i] = array[xx];
		}
	i++; //increment y column once xx finished filling the row with information
}

//return filled ds_grid.
return dsGrid;