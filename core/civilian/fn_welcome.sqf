#include <macro.h>
/*
	File: fn_welcome.sqf
	Author: TheTotenkopf (SealDrop.de)

	Description:
	Erstellt ein schönen Regel Screen
*/

//Start erst nach Spawn
waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};

private ["_text","_intro"];

_intro = [];
_text = [];

switch (playerSide) do
{
	case west:
	{
        _text = [
			format ["<t align='left'><t color='#ff1111'>Por favor, mantenha-o a nosso servidor para organizado, considerar este como seu primeiro e último aviso!</t>"],
			format ["<t align='left'>Se esta é sua primeira visita em nosso servidor, pedimos-lhe para ler as regras cuidadosamente. Isso você pode em nosso fórum: QUE VAMOS CRIAR EM BREVE.</t>"],
			format ["<t align='left'>Se você logou agora equer saber o farme que da mais dinheiro. <t color='#FF8000'>Z</t> vá nas cotações.  O mercado de ações é sempre as informações mais atuais sobre os preços dos melhores farmes para você, porque estamos vivendo em uma economia dinâmica, os preços também sempre pode mudar em proporção à quantidade de matérias-primas que estão atualmente disponíveis.</t>"],
			format ["<t align='left'>Desyncs: A maioria dos desyncs são causados pelo cliente, a uma taxa de quadros de 30 fps no Arma client e pode está sobrecarregado e tem problemas para gerenciar as comunicações de rede.</t>"],
			format ["<t align='left'><t color='#ff1111'>AltisLife está atualmente em fase beta. Perdas e danos causados por RDM, VRDM etc. não será reembolsado!</t>"],
			format ["<t align='left'>Desejamos muita diversão neste servidor.</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : EM BREVE</t>"],
			format ["<t align='left' color='#428BCA'>Forum : EM BREVE</t>"]
		];
	};
	case independent:
	{
        _text = [
			format ["<t align='left'><t color='#ff1111'>Por favor, mantenha-o a nosso servidor para organizado, considerar este como seu primeiro e último aviso!</t>"],
			format ["<t align='left'>Se esta é sua primeira visita em nosso servidor, pedimos-lhe para ler as regras cuidadosamente. Isso você pode em nosso fórum: QUE VAMOS CRIAR EM BREVE.</t>"],
			format ["<t align='left'>Se você logou agora equer saber o farme que da mais dinheiro. <t color='#FF8000'>Z</t> vá nas cotações.  O mercado de ações é sempre as informações mais atuais sobre os preços dos melhores farmes para você, porque estamos vivendo em uma economia dinâmica, os preços também sempre pode mudar em proporção à quantidade de matérias-primas que estão atualmente disponíveis.</t>"],
			format ["<t align='left'>Desyncs: A maioria dos desyncs são causados pelo cliente, a uma taxa de quadros de 30 fps no Arma client e pode está sobrecarregado e tem problemas para gerenciar as comunicações de rede.</t>"],
			format ["<t align='left'><t color='#ff1111'>AltisLife está atualmente em fase beta. Perdas e danos causados por RDM, VRDM etc. não será reembolsado!</t>"],
			format ["<t align='left'>Desejamos muita diversão neste servidor.</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : EM BREVE</t>"],
			format ["<t align='left' color='#428BCA'>Forum : EM BREVE</t>"]
		];
	};
	case civilian:
	{
        _text = [
			format ["<t align='left'><t color='#ff1111'>Por favor, mantenha-o a nosso servidor para organizado, considerar este como seu primeiro e último aviso!</t>"],
			format ["<t align='left'>Se esta é sua primeira visita em nosso servidor, pedimos-lhe para ler as regras cuidadosamente. Isso você pode em nosso fórum: QUE VAMOS CRIAR EM BREVE.</t>"],
			format ["<t align='left'>Se você logou agora equer saber o farme que da mais dinheiro. <t color='#FF8000'>Z</t> vá nas cotações.  O mercado de ações é sempre as informações mais atuais sobre os preços dos melhores farmes para você, porque estamos vivendo em uma economia dinâmica, os preços também sempre pode mudar em proporção à quantidade de matérias-primas que estão atualmente disponíveis.</t>"],
			format ["<t align='left'>Desyncs: A maioria dos desyncs são causados pelo cliente, a uma taxa de quadros de 30 fps no Arma client e pode está sobrecarregado e tem problemas para gerenciar as comunicações de rede.</t>"],
			format ["<t align='left'><t color='#ff1111'>AltisLife está atualmente em fase beta. Perdas e danos causados por RDM, VRDM etc. não será reembolsado!</t>"],
			format ["<t align='left'>Desejamos muita diversão neste servidor.</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : EM BREVE</t>"],
			format ["<t align='left' color='#428BCA'>Forum : EM BREVE</t>"]
		];
	};
};

{
	_intro set [count _intro, (parseText _x)];
} forEach _text;

format ["Olá %1, Bem-vindo ao nosso servidor !", name player] hintC _intro;