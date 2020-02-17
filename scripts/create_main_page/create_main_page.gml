///@arg ["Title1",Type1,Entries1...]
///@arg ["Title2",Type2,Entries2...]

//order: store arguments in 1 array. --> 

//store argument arrays
var arg;
for (var i = 0; i < argument_count; i++) {
	arg[i] = argument[i];
}

//create ds_grid to store entries (neat and organized) (spaces are pre-set, technically setting the dimensions of the grid)
var dsGrid = ds_grid_create(5, argument_count); //argument_count as height: the amount of options/settings on page/screen

//fill ds_grid

//y coord in ds_grid
for (i = 0; i < argument_count; /* After xx-- */) { //no increment UNTIL "xx" loops through ALL Entries in 1 array.
	var array = arg[i]; //access entry in array
	var arrLen = array_length_1d(array); //size(length) of array specified
		//x coord in ds_grid
		for (var xx = 0; xx < arrLen; xx++) { //increment before i++ (i++ changes the row)
			dsGrid[# xx, i] = array[xx]; //dsGrid[x, y] = entry at array[xx] (xx = 0 i, = 0, so array[0] = "STATUS")
		}
		i++;
}

return dsGrid; //return the entire Grid filled in. (Returns to Variable: dsMain)