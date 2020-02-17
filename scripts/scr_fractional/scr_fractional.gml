//Re-Adding Fractions

moveX += frac_moveX;
moveY += frac_moveY;



//Fractional movement

frac_moveX = moveX mod 1;
moveX -= frac_moveX;
frac_moveY = moveY mod 1;
moveY -= frac_moveY;