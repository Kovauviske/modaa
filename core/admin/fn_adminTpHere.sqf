#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991

	Description:
	Teleport selected player to you.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_target == player) exitWith {hint "Você não pode se teletransportar-se a si mesmo";};

_target setPos (getPos player);
hint format["Você teleportou ate %1 ",_target getVariable["realname",name _target]];