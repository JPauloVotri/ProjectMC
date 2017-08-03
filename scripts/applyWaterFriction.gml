inWater = argument0;

if (inWater){
  m_speed          *= m_waterFriction;  // Se estiver na água, é reduzida a velocidade,
  xSpeed           *= m_waterFriction;  // força de pulo, gravidade e velocidade de
  m_jumpForce      *= m_waterFriction;  // subida, além de alterar o valor da variavel
  m_gForce         *= m_waterFriction;  // que diz se o personagem está na água ou não
  m_hangingUpSpeed *= m_waterFriction;
}else{
  m_speed          /= m_waterFriction;  // Reseta os valores das váriáveis quando não
  m_jumpForce      /= m_waterFriction;  // está na água
  m_gForce         /= m_waterFriction;
  m_hangingUpSpeed /= m_waterFriction;
}
