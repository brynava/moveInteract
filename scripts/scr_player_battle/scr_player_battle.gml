///@description Handles player inital positioning, menu options, inflicting damage, etc.
/*
playerHPmax
playerHP
playerAtk
playerDef
*/

scr_getinputs();

moveX = 0;
moveY = 0;

if (input_run) {
	enemyHP = enemyHP - playerAtk;
}