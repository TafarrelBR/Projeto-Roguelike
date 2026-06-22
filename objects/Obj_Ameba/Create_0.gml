
#region variaveis
velh = 0;
velv = 0;
maxvel = 4;

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
#endregion

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
estado_parado.roda =function()
{
	//Condição para ir para o estado de andando
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
#endregion

#region metodos
checa_inputs = function()
{
	up = keyboard_check(ord("W"));	
	down = keyboard_check(ord("S"));
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
}

#endregion

//Iniciando o estado dele
inicia_estado(estado_parado);