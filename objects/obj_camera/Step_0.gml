//clamp x coord between (player x coord) - 80 (left), and (player x coord) - 50 (right)
x = clamp(x, following.x - h_border, following.x + h_border);
y = clamp(y, following.y - v_border, following.y + v_border);

