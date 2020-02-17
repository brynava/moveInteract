event_inherited();

/*
[Name, Enum Value, Stats....] (Stats: HP, Atk, Def, Agi, Lck)
*/

enum enemy {
	skelly,
	bear,
	ant,
	whale,
}

globalvar dsEnemy;

dsEnemy = create_enemy_grid(
	["Skelly", enemy.skelly, 50, 2, 2, 5, 3],
	["Bear", enemy.bear, 135, 6, 4, 3, 4],
	["Ant", enemy.ant, 30, 6, 1, 10, 5],
	["Whale", enemy.whale, 200, 5, 5, 1, 2],
);

eneIndex = irandom_range(0, 3);