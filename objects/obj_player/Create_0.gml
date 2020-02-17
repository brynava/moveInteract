//Speed States/Alternatives

enum speeds {
	ice = 5,
	fall = 6,
	normal = 2,
	run = 4,
	climb = 1,
}



//Movement Application Vars

moveX = 0;
moveY = 0;



//Fractional Remains of Speed Value

frac_moveX = 0;
frac_moveY = 0;



//Speed State, Main State of Speed (Also Max Limit of Speed (Balancef))

spd = speeds.normal;



//Collision Variable (Name of Layer ID)

wallmap = layer_tilemap_get_id("Collision");
S_wallmap = layer_tilemap_get_id("Small_Collision");
icemap = layer_tilemap_get_id("Ice");
climbmap = layer_tilemap_get_id("Climb");


//Setting BBOX as Origin Point for system (side of bbox - distance to point) <- closing the gap to refer to origin as bbox

left_bbox = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
right_bbox = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
top_bbox = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
bottom_bbox = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);


//Stat(s) Values
globalvar playerHP;
globalvar playerHPmax;
globalvar playerAtk;
globalvar playerDef;


playerHPmax = 20; //playerHPmax is a "limit/cap" for healing and lvl up boost, as well as the starting value of playerHP
playerHP = playerHPmax; //when attacked, decrease playerHP.
 //using equipped weapon to find ATK VALUE in dsWeaponGrid
 //our ATK = dsWeaponGrid[# 2(ATK column), 0("Weapon Array/dsHeight")]



//Current State/State Change

state = states.normal;