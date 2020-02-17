///@description Enemy Stats/Data Grid/Rows
///@param ["Name", Enum Value, Stats...]

var arg;

//store argument arrays in 1 array
for (var i = 0; i < argument_count; i++) {
	arg[i] = argument[i];
}

var dsGrid = ds_grid_create(7, argument_count);

for (i = 0; i < argument_count;) {
	var array = arg[i];
	var arrLen = array_length_1d(array);
		for (var xx = 0; xx < arrLen; xx++) {
			dsGrid[# xx, i] = array[xx];
		}
	i++;
}

return dsGrid;