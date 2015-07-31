#include <macro.h>
/*
	File: fn_sellOil.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells the oil to the oil trader.
	Will be revised.
*/
private["_val"];

_val = life_inv_oilp;

if(life_inv_oilp < 10) exitWith { hint "Você precisa de pelo menos 10 litros de Diesel";};
if(([false,"oilp",_val] call life_fnc_handleInv)) then
{
	titleText[format["Você transferiu com sucesso 10 litros diesel em latas de gasolina"],"PLAIN"];
	life_inv_oilp = life_inv_oilp - 10;
	life_inv_fuelF = life_inv_fuelF + 10;
	life_carryWeight = life_carryWeight + 50;
};