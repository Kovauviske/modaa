#include <macro.h>
/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991

	Description:
	Spectate the chosen player.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "Você não pode se assistir";};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.05;
  };
};

_unit switchCamera "EXTERNAL";
hint format["Você agora está assistindo %1 \n\n aperte F10 para parar de assistir.",_unit getVariable["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'Você parou o jogador';};false"];