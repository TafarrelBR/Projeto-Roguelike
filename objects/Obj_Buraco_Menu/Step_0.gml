//Se eu estou ativo, eu vou para a room destino
if (ativo) 
{
    //só vou para a room, se ela existe
    if (room_exists(destino)) 
        {
            room_goto(destino);
            ativo = false;	
        }	
}