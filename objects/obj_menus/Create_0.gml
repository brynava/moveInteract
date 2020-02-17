///@description Menu Create

display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

globalvar pause;
globalvar camHeight;
globalvar camWidth;

pause = false;
camHeight = camera_get_view_height(view_camera[0]);
camWidth = camera_get_view_width(view_camera[0]);


//weapon index
enum weapon {
	sword,
	spear,
	axe,
	glove,
	chain,
	gun,
	mace,
}

globalvar weaponinv;

for (var i = 3; i >= 0; i--) {
	weaponinv[i] = -1; //4 slots created to equip/store/hold weapons with
}

weaponinv[0] = weapon.axe;
weaponinv[1] = weapon.gun;
weaponinv[2] = weapon.glove;
weaponinv[3] = weapon.sword;

/*
[Name, enum value(index), atk, def, agi, lck] add: sprites, equip: true/false, description, etc.
*/
globalvar dsWeaponsGrid;


dsWeaponsGrid = create_weapon_grid(
	["Sword", weapon.sword, 8, 0, 5, 7],
	["Spear", weapon.spear, 6, 1, -1, 10],
	["Axe",	  weapon.axe, 10, -3, -1, 8],
	["Glove", weapon.glove, 4, 2, 4, 9],
	["Chain", weapon.chain, 7, 1, 1, 8],
	["Gun",   weapon.gun, 8, 0, 2, 5],
	["Mace",  weapon.mace, 7, 1, 0, 3],
);


//page index
enum page { 
	status = 1,
	equip = 5,
	items,
	pouch,
	keyitems,
	collectables,
	records,
	enemylog,
	chapters,
	characterlog,
	worldmap,
	system = 2,
	audio,
	display,
	controls,
	text = 4,
	armor,
	weapons,
	specials,
	height,
}


//type of option (if enter -> run script, select slider, etc.)
enum menuType { 
	script,
	pages,
	slider,
	shift,
	toggle,
	input,
	read,
	equip,
}

#region ds_grids/Menus options/content
//filled ds_grids stored in a variable (contains arrays in grid for accessor ease)
dsMain = create_main_page( //0
	["STATUS",		menuType.pages,		page.status],
	["EQUIP",		menuType.pages,		page.equip],
	["ITEMS",		menuType.pages,		page.items],
	["RECORDS",		menuType.pages,		page.records],
	["SYSTEM",		menuType.pages,		page.system],
);

dsStatus = create_status_page( //1
	["HP",	menuType.read,	"100/100"],
	["FP",	menuType.read,	"50/50"],
	["Coins",	menuType.read,	"500,000"],
);



dsSystem = create_system_page( //2
	["Audio",			menuType.pages,		page.audio],
	["Display",			menuType.pages,		page.display],
	["Controls",		menuType.pages,		page.controls],
	["Text",			menuType.pages,		page.text],       
	["Title Screen",	menuType.script,	to_title_screen],
);

dsAudio = create_audio_page( //3
	["Master Volume",	menuType.slider,	change_volume,	1,	[0, 1]], 
	["Battles", menuType.slider,	change_volume,	1,	[0, 1]],
	["Music",	menuType.slider,	change_volume,	1,	[0, 1]],
);

dsText = create_text_page( //4
	["Text Size",	menuType.shift,	change_font_size,	0,	["Small", "Normal", "Large"]],
	["Highlight",	menuType.shift,	change_highlight_color,	1,	["Red", "Fuschia", "Cyan"]],
);

dsEquip = create_equip_page( //5	//slots..................................................
	["Weapons", menuType.equip, 3, weaponinv],
	//["Armor", menuType.pages, page.armor],
	//["Specials", menuType.pages, page.specials],
);


/*
dsArmor = create_armor_page(

);

dsSpecials = create_specials_page(

);
*/

#endregion

//Equipped/Preset Weapon
globalvar setWeapon;
setWeapon = dsEquip[# 2, 0];

//the arrays/content of grids (selectable number)
pIndex = 0;
inputting = false;
menuGrids = [dsMain, dsStatus, dsSystem, dsAudio, dsText, dsEquip]; 

//gridOptions = the arrays/content of grids.
var arrLen = array_length_1d(menuGrids);
for (var i = 0; i < arrLen; i++) { 
	gridOptions[i] = 0;	
}

var dsGrid = menuGrids[5];
var dsHeight = ds_grid_height(dsGrid);
	for (var i = 0; i < dsHeight;) {
	arrEquip = dsGrid[# 3, i];
	preEquip = dsGrid[# 2, i];
	var arrLen = array_length_1d(arrEquip);
		for (var xx = 0; xx < arrLen; xx++) {
			equipOpt[xx] = 0;
	}
	i++;
}





