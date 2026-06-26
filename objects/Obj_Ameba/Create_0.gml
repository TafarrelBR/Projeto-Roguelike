
#region variaveis
velh = 0;
velv = 0;
max_vel = 1;

dir = 0;
sprites_atuais = 
{
	lado: Spr_Ameba_parado_lado,
	cima: Spr_Ameba_parado_costas,
	baixo: Spr_Ameba_parado_frente
}

//Meus controles
up = 0;
down = 0;
left = 0;
right =0;

#endregion

#region cria estados
estado_parado = new estado();
estado_andando = new estado();
estado_entrando = new estado();
#endregion

#region estados
#region estado parado
estado_parado.inicia = function()
{
	sprites_atuais = 
	{
		lado: Spr_Ameba_parado_lado,
		cima: Spr_Ameba_parado_costas,
		baixo: Spr_Ameba_parado_frente
	}
	
	troca_sprite(dir , sprites_atuais);
}
estado_parado.roda = function()
{
	checa_inputs();
	
	//Condição para ir para o estado de andando
	//Se eu apertei algum botão, mudo de estado
	if(up or down or left or right)
	{
		troca_estado(estado_andando);
	}
}

//Saindo do estado
estado_parado.finaliza = function()
{
	
}
#endregion

#region estado andando
estado_andando.inicia = function()
{
	sprites_atuais = 
	{
		lado: Spr_Ameba_andando_lado,
		cima: Spr_Ameba_andando_costas,
		baixo: Spr_Ameba_andando_frente
	}
	
	troca_sprite(dir , sprites_atuais);
}

estado_andando.roda = function()
{	
	troca_sprite(dir, sprites_atuais);
	checa_inputs();
	aplica_velocidade();
	
	//Entrando no personagem
	if(keyboard_check(vk_enter))
	{
		troca_estado(estado_entrando);
	}
}
#endregion

#region estado entrando

//Iniciando o estado
estado_entrando.inicia = function()
{	
	y-=8;
	image_index = 0;
	
	sprites_atuais = 
	{
		lado: Spr_Ameba_entra,
		cima: Spr_Ameba_entra,
		baixo: Spr_Ameba_entra
	}
	
	troca_sprite(dir, sprites_atuais);
}
estado_entrando.roda = function()
{
    
    //Checando se estou colidendo com buraco
    var _buraco = instance_place(x, y-5, Obj_Buraco_Menu);
    
	//Se minha animação acabou, eu morro
	if(image_index >= image_number-1)
	{
        if (_buraco) 
        {
            //Ativando o buraco
            _buraco.ativo = true;	
        }
		instance_destroy();
	}
}
#endregion

#endregion

#region metodos
checa_inputs = function()
{
	up = keyboard_check(ord("W"));	
	down = keyboard_check(ord("S"));
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
}

ajusta_direcao = function()
{
	//Só faço isso se estiver apertando alguma tecla
	if(up || down || left || right)
	{
		//Encontra a direção e divide por 90, para ter resultaods entre 0 e 3
		dir = point_direction(0, 0, velh, velv) div 90; 
	}
	
	//Ajustando o xscale dele para ele olhar par os dois lados
	if(velh != 0)
	{
		image_xscale = sign(velh);
	}
}

aplica_velocidade = function()
{
	velh = (right - left) * max_vel;
	velv = (down - up) * max_vel;
	
	move_and_collide(velh, velv, all);
}
#endregion

//Iniciando o estado dele
inicia_estado(estado_parado);