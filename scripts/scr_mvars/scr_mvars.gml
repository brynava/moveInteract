///@param acceleration
///@param deceleration



//Momentum Option Vars (Accel)

balL = balance(moveX, -spd, argument0);
balR = balance(moveX, spd, argument0);
balU = balance(moveY, -spd, argument0);
balD = balance(moveY, spd, argument0);

//Decel
balX = balance(moveX, 0, argument1);
balY = balance(moveY, 0, argument1);