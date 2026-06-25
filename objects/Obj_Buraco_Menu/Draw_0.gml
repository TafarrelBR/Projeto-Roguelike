//Vou me desenhar
draw_self();

//Definindo a minha fonte
draw_set_font(Fnt_Buracos);

//Ajustando o alinhamento do meu texticulo
draw_set_halign(1);
draw_set_valign(1);

//Eu vou desenhar o  meu texticulo
draw_text(x, bbox_top - 10, texto);

//Resetando minha fonte
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);