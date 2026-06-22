function estado() constructor
{
	//Iniciando o estado
	static inicia = function(){}
	//Roda o estado
	static roda = function(){}
	//Finaliza o estado
	static finaliza = function(){}
}

//Função para  iniciar um estado
function inicia_estado(_estado)
{
	//Vou definir meu estado atual como o estado que foi passado
	estado_atual = _estado;
	//Vou rodar o metodo de iniciar o estado atual
	estado_atual.inicia();
}

//Função para trocar estado
function troca_estado(_estado)
{
	//Vou finalizar o estado atual
	estado_atual.finaliza();
	
	estado_atual = _estado;
	
	//Iniciando o estado atual
	estado_atual.inicia();
}

//Rodar meu estado
function roda_estado()
{
	estado_atual.roda();
}