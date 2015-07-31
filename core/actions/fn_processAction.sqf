/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",1200,"Processando Oleo"];};
	case "diamond": {["diamond","diamondc",1350,"Lapidando os Diamantes"]};
	case "heroin": {["heroinu","heroinp",2100,"Processando Heroina"]};
	case "copper": {["copperore","copper_r",750,"Processando Cobre"]};
	case "iron": {["ironore","iron_r",1120,"Processando Ferro"]};
	case "sand": {["sand","glass",650,"Processando Areia"]};
	case "salt": {["salt","salt_r",450,"Processando Sal"]};
	case "cocaine": {["cocaine","cocainep",1500,"Processindo Cocaina"]};
	case "marijuana": {["cannabis","marijuana",500,"Processando Maconha"]};
	case "heroin": {["heroinu","heroinp",1720,"Processando Heroina"]};
	case "cement": {["rock","cement",350,"Misturando o cimento"]};
	case "grapes": {["grapes","wine",250,"Processando a uva para Vinho"]};
	case "moonshine": {["yeast","moonshine",250,"Fazendo o Licor de Corno",true,"mash"]};//new
	case "meth": {["methu","methp",5000,"Cozinhar Metafetamina"]};
	case "bottledshine": {["moonshine","bottledshine",500,"Engarragando o Licor de Corno",true,"bottles"]};//new
	case "whiskey": {["yeast","whiskey",1000,"Fermentando o Whysky",true,"rye"]};//new
	case "beer": {["yeast","beerp",1500,"Preparação da bebida",true,"hops"]};//new
	case "bottledbeer": {["beerp","bottledbeer",500,"Preparando a Itaipava",true,"bottles"]};//new
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,"Engarrafando o Whysky",true,"bottles"]};//new
	case "mash": {["water","mash",100,"Triturando os grãos",true,"cornmeal"]};//new
    case "uranium1": {["uranium1","uranium2",5000,"Limpeza de urânio"]}; // Add this
    case "uranium4": {["uranium4","uranium",15000,"Secando o urânio"]}; // Add this
	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};

	if(player distance _vendor > 10) exitWith {hint "Você precisa ficar dentro de 10m para o Processo."; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	5 cutText ["","PLAIN"];
	titleText[format["Você processou %1  %2",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
}
	else
{
	if(life_cash < _cost) exitWith {hint format["Você precisa de $%1 para processar sem a licença",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Você precisa ficar dentro de 10m para processar."; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(life_cash < _cost) exitWith {hint format["Você precisa $%1 para processar sem a licença!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	5 cutText ["","PLAIN"];
	titleText[format["Você processou %1 e %2 para $%3",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash - _cost;
	life_is_processing = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
};