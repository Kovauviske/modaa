/*

	Player clicked arrest/ok

*/

private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hint "Destino inválido."};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call TON_fnc_isnumber)) exitWith
{
	hint "Você tem que digitar um número.";
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 5 || _time > 120) exitWith { hint hint "Você só pode mandar para a cadeia entre 5-120 minutos!"; };

closeDialog 0;
[life_pInact_curTarget, _time] call life_fnc_arrestAction;