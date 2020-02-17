///@description true or false to disable for swimming, etc.
///@param true/false
///@param turnaround_drag



//Momentum Balance

if (sign(moveX) = -1) { moveX = balL; } else if (sign(moveX) = 1) { moveX = balR; } else { moveX = balX; }
if (sign(moveY) = -1) { moveY = balU; } else if (sign(moveY) = 1) { moveY = balD; } else { moveY = balY; }



//------Turnaround/Changing Direction

if (argument0 == true) {

//X

	if (input_left and moveX > 0) { moveX = balance(moveX, 0, lerp(0, moveX, argument1)); }
	if (input_right and moveX < 0) { moveX = balance(moveX, 0, lerp(0, -moveX, argument1)); }


//Y

	if (input_up and moveY > 0) { moveY = balance(moveY, 0, lerp(0, moveY, argument1)); }
	if (input_down and moveY < 0) { moveY = balance(moveY, 0, lerp(0, -moveY, argument1)); }

}