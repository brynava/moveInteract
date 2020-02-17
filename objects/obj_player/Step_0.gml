switch (state) {
	case states.normal: scr_player_normal();	break;
	case states.ice:	scr_player_ice();		break;
	case states.climb:	scr_player_climb();		break;
	case states.swim:	scr_player_swim();		break;
	case states.battle: scr_player_battle();	break;
}