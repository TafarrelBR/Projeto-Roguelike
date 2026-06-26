#region variaveis



#endregion
#region inicia estados

estado_vazio = new estado();
estado_preenche = new estado();
estado_cheio = new estado();

#endregion
#region estados
#region estado vazio
estado_vazio.inicia = function()
{
    sprite_index = Spr_Personagem_vazio;
}
#endregion
#region estado preeche
estado_preenche.inicia = function()
{
    sprite_index = Spr_Personagem_enche;
    image_index = 0;
}
#endregion

#endregion
#region metodos

#endregion

inicia_estado(estado_preenche);