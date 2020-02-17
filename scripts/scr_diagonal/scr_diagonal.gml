//Diag division Var
var diag = sqrt((spd * spd) / 2);


//If diagonal, set speed
if (moveX > 0 and moveY > 0) { moveX = diag; moveY = diag; }
else if (moveX < 0 and moveY < 0) { moveX = -diag; moveY = -diag; }