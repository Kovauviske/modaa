/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "Você precisa selecionar um item primeiro!";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};

	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "painkillers"):
	{
		if(vehicle player != player) exitWith {hint "Você não pode curar em um veículo..."};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setDamage 0;
			player setFatigue 0;
			player allowDamage true;
			player enableSimulation true;
			closeDialog 0;
			hint "Os analgésicos fizeram efeito! Sua vida ta cheia."
		};
	};

	case (_item == "morphium"):
	{
		if(playerSide in [west,independent]) exitWith {hint "Você está no serviço!"};
		if(vehicle player != player) exitWith {hint "Você não pode curar em um veículo ..."};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			player setFatigue 1;
			player setDamage 0;
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.1;
			life_thirst = life_thirst - 65;
			life_hunger = life_hunger - 75;
			if (life_drink < 0.08) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
			closeDialog 0;
		};
	};

	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};

	case (_item == "battery"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_battery = 100;
			hint "Deine Battery ist nun auf 100%.";
		};
	};

	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText["Redbull lhe deu asas e agora têm por 5 minutos mais resistência.","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (5 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint "Você ja tem a faixa de pregos na mão"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (_item == "mauer"):
	{
		if(!isNull life_mauer) exitWith {hint "Você colocou uma barreira já!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_mauer;
		};
	};

	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "Você está acessando um veículo"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};

	case (_item =="bottledwhiskey"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
		};
	};

	case (_item =="bottledshine"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
		};
	};

	case (_item =="bottledbeer"):
	{

		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};

	case (_item == "methp"):
	{
		if(playerSide in [west,independent]) exitWith {hint "Nenhuma droga no serviço! Se comporte!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useMarihuana;
		};
	};

	case (_item == "heroinp"):
	{
		if(playerSide in [west,independent]) exitWith {hint "Nenhuma droga no serviço! Se comporte!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};

	case (_item == "cocainep"):
	{
		if(playerSide in [west,independent]) exitWith {hint "Nenhuma droga no serviço! Se comporte!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useKokain;
		};
	};

	case (_item == "kidney"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setVariable["missingOrgan",false,true];
			life_thirst = 100;
			life_hunger = 100;
			player setFatigue .5;
		};
	};

	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_weed;
		};
	};

	default
	{
		hint "Você não pode usar esse item.";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;