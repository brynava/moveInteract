///@description Fill Grid with array information on each row

var arg; //indice in arg array = an array/data on weapon

for (var i = 0; i < argument_count; i++) {
	arg[i] = argument[i];
}


//create empty weapon Grid
var dsGrid = ds_grid_create(6, argument_count); //w = length of arrays, height = how many arrays/each new row is a new weapon


//filling a ROW first, then switching columns

//choosing array/row
for (i = 0; i < argument_count;) {
	var array = arg[i]; //ex: arg[0] = ["Sword", etc.]
	var arrLen = array_length_1d(array);
	
	//filling each column
		for (var xx = 0; xx < arrLen; xx++) {
			dsGrid[# xx, i] = array[xx]; //["Sword", weapons.sword, 1, 1, 1, 1]
		}
	i++; //increment row after xx is finished filling columns
}

return dsGrid;