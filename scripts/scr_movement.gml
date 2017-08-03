//Adiciona gravidade
ySpeed += grav;

//Horizontal
xSign = sign(xSpeed);

repeat(abs(xSpeed)){
    if (!place_meeting(x+xSign, y, obj_block)){ // Checa colisÃ£o logo a frente do player
        x += xSign;
    }else if (!place_meeting(x+xSign, y-1, obj_block)){ // Identifica quando hÃ¡ uma rampa a frente
        x += xSign;
        y--;
    }else{
        xSpeed = 0;
    }
    
    if (!place_meeting(x, y+1, obj_block) && place_meeting(x, y+2, obj_block)) // Identifica quando hÃ¡ uma rampa logo abaixo do player
        y++;
    
    if (place_free(x, y+1) && state = st_idle)
        state = st_air;
}

//Vertical
ySign = sign(ySpeed);

repeat(abs(ySpeed)){
    if (place_free(x, y+ySign)){
        y += ySign;
    }else{
        ySpeed = 0;
    }
}
