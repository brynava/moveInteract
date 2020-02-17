//In this Create event, we create the number of MAXIMUM slots available. (For loop)

globalvar showInv;
showInv = false; //if true, show inv, if false, deactivate drawings
globalvar maxItems;
maxItems = 5; //max number "i" slots can go up to


//creates amount of slots possible (maxItems = limit)
for (var i = 0; i < maxItems; i += 1) { 
	global.inventory[i] = -1; //placeholder
}