/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Você não selecionou nada para remover.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Você não digitou um formato de número real."};
if(parseNumber(_value) <= 0) exitWith {hint "Você precisa digitar o montante real que você deseja remover."};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["Este é um item ilegal e policiais estão por perto, você não pode remover as provas","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Você não pode remover um item quando você está em um veículo.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Não foi possível remover, muito desse item, talvez você não tem essa quantia!"};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Você removeu com êxito %1 %2 do seu inventario.",(parseNumber _value), _type];

[] call life_fnc_p_updateMenu;