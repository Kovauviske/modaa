/*
	File: welcome.sqf
	Author: TheTotenkopf
	Date: 26.6.2014
*/

//Start erst nach Spawn
waitUntil{ !isNull(findDisplay 38500)};
waitUntil{ isNull(findDisplay 38500)};

//Sound
playSound "welcome";

_onScreenTime = 2;

_role1 = "Seja bem vindo!";
_role1names = ["Servidor OS Delicias"];
_role2 = "Administradores";
_role2names = ["Vinicius e Jailson"];
_role3 = "Map Edit by";
_role3names = ["Kovauviske e Jailson"];
_role4 = "Offizieller TeamSpeak";
_role4names = ["EM BREVE"];
_role8 = "Forum Oficial";
_role8names = ["Em breve"];
 _role9 = "Restart do servidor";
_role9names = ["0,6,9,12,15,18,21"];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.50' color='#1866c7' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role8, _role8names],
[_role9, _role9names]
];