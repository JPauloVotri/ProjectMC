if !(hangingUp)
{
  if (keyboard_check_pressed(key.down)) // Precionar pra baixo, ele cai
  {
    state = st_air;
    exit;
  }
  else if (keyboard_check_pressed(key.up))  // Precionar pra cima, ele sobe
  {
    tempY = y;
    tempX = x;
    hangingUp = true;
  }
}
else
{
  if (y > tempY - 96)            // Aqui ele ira subir o personagem até o ponto em que
    ySpeed = -m_hangingUpSpeed;  // os pés ficarão na altura do bloco
  else
  {
    ySpeed = 0;                                    // Depois de chegar no ponto, ele vai em
    xSpeed = m_hangingUpSpeed * hangingDirection;  // direção ao bloco
  }
  
  if ((xSpeed < 0 && x == tempX - 32) || (xSpeed > 0 && x == tempX + 32))
  {
    xSpeed = 0;         // Aqui ele para o personagem quando estiver todo em cima
    hangingUp = false;  // do bloco e muda o estado
    state = st_idle;
  }
}

