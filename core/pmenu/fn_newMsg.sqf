#include <macro.h>
/*

	file: fn_newMsg.sqf
	Author: Silex

*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Mensagem para: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Não vai mandar para ninguem?"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Você deve digitar uma mensagem para enviar!";ctrlShow[88885, true];};
		[[life_smartphoneTarget,_msg,player,0],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Você enviou para %1 uma mensagem: %2",name life_smartphoneTarget,_msg];
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["A polícia não está acessível no momento. Por favor, tente novamente mais tarde."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Você deve digitar uma mensagem para enviar!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "The Police";
		hint format["Você envou para %1 uma mensagem: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Você deve digitar uma mensagem para enviar!";ctrlShow[888896,true];};
		[[ObjNull,_msg,player,2],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "The Admins";
		hint format["Você envou para %1 uma mensagem: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Atualmente, nenhum médico está de plantão."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Você deve digitar uma mensagem para enviar!";ctrlShow[888899,true];};
		[[ObjNull,_msg,player,3],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Você enviou uma mensagem para todas as Unidades Médicas.",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Você não é um administrador!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Não vai selecionar ninguem?"];};
		if(_msg == "") exitWith {hint "Você deve digitar uma mensagem para enviar!";};
		[[life_smartphoneTarget,_msg,player,4],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Admin Message Enviado para: %1 - Mensagem: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Você não é um administrador!";};
		if(_msg == "") exitWith {hint "Você deve digitar uma mensagem para enviar!";};
		[[ObjNull,_msg,player,5],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Admin Message enviada para TODOS: %1",_msg];
		closeDialog 887890;
	};
	//adacrequest
	case 8:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Atualmente não tem ADAC em serviço. Por favor, tente mais tarde."];};
		ctrlShow[888900,false];
		if(_msg == "") exitWith {hint "Você deve digitar uma mensagem para enviar!";ctrlShow[888900,true];};
		[[ObjNull,_msg,player,6],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Emergência foi deposto.",_msg];
		ctrlShow[888900,true];
		closeDialog 887890;
	};
};