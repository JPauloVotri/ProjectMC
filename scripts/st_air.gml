if (place_meeting(x, y, obj_water) && !inWater)
{
  inWater = true;
  applyWaterFriction(inWater);
}
else if (!place_meeting(x, y, obj_water) && inWater)
{
  inWater = false;
  applyWaterFriction(inWater);
}

applyGravity();

if (keyboard_check_released(key.jump) && ySpeed < 0)
  ySpeed /= 2;  // Se soltar a tecla de pulo enquanto sobre, a velocidade é dividida

if (jumpDirection != 1 || xSpeed == 0){
  if (keyboard_check(key.right))
  {                              // Se a tecla de movimento para a direita for
    jumpDirection = 0;           // pressionada e estiver indo para a esquerda, zera
    xSpeed        = m_airSpeed;  // a direção do pulo, e muda a velocidade no ar
  }
  else if (keyboard_check(key.left))
  {
    jumpDirection = 0;  // Mesma coisa do if acima, porem na direção inversa
    xSpeed        = -m_airSpeed;
  }
}

if (place_meeting(x, y, obj_grab) &&
    !place_meeting(x, y+ySpeed, obj_grab) &&
    !place_free(x+dir, y) &&
    ySpeed > 0)
{
  repeat (abs(ySpeed))
  {
    y++;
    
    if (!place_meeting(x, y, obj_grab))
    {
      hangingDirection = dir;
      ySpeed = 0;
      grav = 0;
      state = st_hanging;
      exit;
    }
  }
}

