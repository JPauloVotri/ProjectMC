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

if (place_free(x, y+1))
{
  jumpDirection = sign(xSpeed);   // Se o personagem não estiver em cima de nada sólido,
  state         = st_air;         // é guardada a direçao na qual o jogador estava andando,
  exit;                           // o estado é mudado e o script é encerrado
}

if (keyboard_check(key.right))
  xSpeed = m_speed;                // Move o personagem dependendo da tecla de direção
else if (keyboard_check(key.left)) // precionada
  xSpeed = -m_speed;
else
{
  state = st_idle;                // Se nenhuma tecla de direção for precionada, muda
  exit;                           // o estado e encerra o script
}

if (keyboard_check_pressed(key.jump) && !place_free(x,y+1))
{
  jumpStart(-m_jumpForce, sign(xSpeed)); // Se a tecla de pulo for precionada, chama a função
  state = st_air;                        // de pulo, muda o estado e encerra o script
  exit;
}

