function troca_sprite(_dir, _struct_sprites)
{
	switch(_dir)
	{
		case 0: sprite_index = _struct_sprites.lado; break;
		case 1: sprite_index = _struct_sprites.cima; break;
		case 2: sprite_index = _struct_sprites.lado; break;
		case 3: sprite_index = _struct_sprites.baixo; break;
	}
}