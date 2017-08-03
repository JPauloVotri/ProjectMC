if (place_free(x, y+1))
  grav = m_gForce;  // Aplica a gravidade se o personagem estiver no ar
else
{
  grav = 0;           // Se não, zera a gravidade e a direção do pulo, muda o
  jumpDirection = 0;  // estado e encerra o Script
  state = st_idle;
  exit;
}
