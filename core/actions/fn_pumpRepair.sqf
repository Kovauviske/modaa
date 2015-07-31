/*
	File: fn_pumpRepair.sqf

	Description:
	Quick simple action that is only temp.
*/
private["_method"];
if(life_cash < 500) then
{
	if(life_atmcash < 500) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "Você não tem 500 Reais."};
	case 1: {vehicle player setDamage 0; life_cash = life_cash - 500; hint "Você reparou o veiculo por $ 500";};
	case 2: {vehicle player setDamage 0; life_atmcash = life_atmcash - 500; hint "Você reparou o veiculo por $ 500";};
};