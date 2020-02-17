event_inherited();

npcpoints = 1;
movetimer = room_speed * .7;
stoptimer = -1;
moveNPC = choose(npcmove.u, npcmove.d, npcmove.l, npcmove.r, npcmove.ur, npcmove.dr, npcmove.ul, npcmove.dl); 

//NPC State
state = states.idle;