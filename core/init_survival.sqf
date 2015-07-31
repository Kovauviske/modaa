[] spawn  {
	private["_fnc_food","_fnc_water","_fnc_battery"];
	_fnc_food =
	{
		if(life_hunger < 2) then {player setDamage 1; hint "You have starved to death.";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint "You have starved to death.";};
		switch(life_hunger) do {
			case 30: {hint "Você não comeu nada em algum tempo, você deve encontrar algo para comer em breve!";};
			case 20: {hint "Você está começando a morrer de fome, você precisa encontrar algo para comer logo.";};
			case 10: {hint "Agora você está morrendo de fome! COMA RAPIDO";player setFatigue 1;};
			};
		};
	};

	_fnc_water =
	{
		if(life_thirst < 2) then {player setDamage 1; hint "Você morreu de desidratação.";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint "Você morreu de desidratação.";};
			switch(life_thirst) do
			{
				case 30: {hint"Você não bebeu nada em algum tempo, você deve encontrar algo para beber em breve.";};
				case 20: {hint "Você não bebeu nada por um longo do tempo, você deve encontrar algo para beber ou você vai começar a morrer de desidratação"; player setFatigue 1;};
				case 10: {hint "Você agora está sofrendo de desidratação grave encontre algo para beber Rapidamente!"; player setFatigue 1;};
			};
		};
	};

	_fnc_battery =
	{
		if(life_battery < 2) then {hint "A bateria do telefone está vazia.";}
		else
		{
			life_battery = life_battery - 5;
			[] call life_fnc_hudUpdate;
			if(life_battery < 2) then {hint "Sua bateria está vazia.";};
			switch(life_battery) do
			{
				case 30: {hint "A bateria do seu telefone tem 30%.";};
				case 20: {hint "A bateria do seu telefone tem 20%.";};
				case 10: {hint "A bateria do seu telefone tem 10%.";};
			};
		};
	};

	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 10;
		[] call _fnc_battery;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint "Você está muito lento, remova alguns itens para correr de novo";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

//part of alcohol system written by [midgetgrimm]
[] spawn
{
	while {true} do
	{
		waitUntil {(life_drink > 0)};
		while{(life_drink > 0)} do {

			if(life_drink > 0.08) then {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
			"radialBlur" ppEffectCommit 3;
			sleep 240;
			life_drink = life_drink - 0.02;
			} else {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
			"radialBlur" ppEffectCommit 1;
			sleep 180;
			life_drink = life_drink - 0.02;
			};
		};

		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		life_drink = 0;

	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_inv_uranium2 != 0) then {
			player forceWalk true;
			player setFatigue 1;
			hint "O urânio é tão pesado que você pode ficar lento e cansado!";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn  {
	while{true} do
	{
		waitUntil {(player getVariable "missingOrgan")};
		life_max_health = .50;
		while{(player getVariable "missingOrgan")} do {
			life_thirst =  50;
			life_hunger =  50;
			if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			sleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		life_max_health = 1;
	};
};

[] spawn
{
	while {true} do
	{
		private["_damage"];
		sleep 1;
		while {((player distance (getMarkerPos "uran_mine") < 100) && (player getVariable["Revive",TRUE]))} do
		{
			if(uniform player == "U_I_HeliPilotCoveralls") then
			{
				hint "!!! AVISO A zona é RADIOATIVA !!! Use a roupa adequada para RADIAÇÃO!";
				sleep 5;
			}else
			{
				hint "!!! AVISO A zona é RADIOATIVA !!! Você vai morrer se não usa o terno para radiação!";
				_damage = damage player;
				_damage = _damage + 0.1;
				player setDamage (_damage);
				[] call life_fnc_hudUpdate;
				sleep 5;
			};
		};
	};
};