/*
	File:fn_radarCam.sqf
*/
waitUntil {(!isNil "life_fnc_moveIn") && !isNull (findDisplay 46)};
if((vehicle player isKindOf "Ship") OR (vehicle player isKindOf "Air")) exitWith {};//exit if not a freaking car
private ["_limit","_speed","_driver","_ticket","_ticketWL"];
_driver = _this select 0;
_speed = _this select 1;
_limit = _this select 2;
//_ticket = 1500;//perm set amount ticket
_ticket = (_speed - _limit) * 100;//variable ticket for licensed driver
_ticketWL = (_speed - _limit) * 200;//variable ticket for unlicensed driver
//diag_log format["Ticket Fine: %1 - Sp: %2 -- Limit: %3",_ticket,_speed,_limit];
if (_speed > _limit) then {
	if (side _driver == civilian) then {
			if(isNil "life_speedTicket") then {life_speedTicket = 0;};
			if(isNil "life_speedCaught") then {life_speedCaught = 0;};
			diag_log format["Dr:%1 :: Sp:%2 :: Lmt:%3 ::Fine: %4",name _driver,round _speed,_limit,[_ticket] call life_fnc_numberText];
			player say3d "PhotoSound";//photosound and ppEffects from prellers radar script
			sleep 0.05;
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
			"colorCorrections" ppEffectCommit 0;
			sleep 0;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
			"colorCorrections" ppEffectCommit 0.05;
			sleep 0.05;
			"colorCorrections" ppEffectEnable false;
			sleep 0.1;
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
			"colorCorrections" ppEffectCommit 0;
			sleep 0;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
			"colorCorrections" ppEffectCommit 0.05;
			sleep 0.05;
			"colorCorrections" ppEffectEnable false;
		if(license_civ_driver OR license_civ_truck ) then {

			life_speedTicket = life_speedTicket + 1;
			if(life_speedTicket <= 3) then {systemChat format["Você recebeu uma multa de numero %1 continue e você vai perder dinheiro",life_speedTicket];};
			if(life_speedTicket == 4) then {systemChat format["Você recebeu uma multa de numero %1 na proxima você vai perder sua licença",life_speedTicket];};
			if(life_speedTicket > 4 && life_speedTicket < 8) exitWith {

					systemChat format["Voce recebeu uma multa de %1",life_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Bilhete de estacionamento<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Velocidade Max: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Você tem varias multas de velocidade, você vai perder suas licenças e agora ta na lista de procurados",round _speed,_limit,name _driver];
					[[4],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
					[[getPlayerUID _driver,name _driver,"120H"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					[2] call SOCK_fnc_updatePartial;
			};
			if(life_speedTicket > 8) exitWith {

					vehicle _driver setFuel 0.1;
					systemChat format["ESTÀ É SUA MULTA %1th!!!",life_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Velocidade do Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Velocidade MAX: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Motorista: %3<br/>Agora você está sendo procurado por ultrapassar o limite de velocidade e vai ser preso no local",round _speed,_limit,name _driver];
					[[getPlayerUID _driver,name _driver,"120FS"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					[[4],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
					[2] call SOCK_fnc_updatePartial;
			};
			if(life_atmcash <= _ticket) then
			{
				if(life_atmcash <= _ticket) exitWith
				{
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar de Velocidade<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Velocidade MAX: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Motorista: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Atenção: $%4<br/>Você está falido e não tem dinheiro para pagar, agora você tem um mandado de prisão",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
					[[getPlayerUID _driver,name _driver,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				};
				life_atmcash = life_atmcash - _ticket;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar de Velocidade<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Velocidade MAX: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Motorista: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Atenção: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
				diag_log "Sua multa foi paga pela sua conta do banco.";
				[1] call SOCK_fnc_updatePartial;
			} else {

				life_atmcash = life_atmcash - _ticket;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar de Velocidade<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>velocidade MAX: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Motorista: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Atenção: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
				diag_log "Você tem dinheiro na carteira, irá pagar sua multa";
				[0] call SOCK_fnc_updatePartial;
			};
		} else {

					life_speedCaught = life_speedCaught + 1;
					if(life_speedCaught <= 5) then { systemChat format["Você foi pego %1 vezes por andar em alta velocidade sem licença",life_speedCaught];};
					if(life_speedCaught == 6) then { systemChat format["Você foi pego %1 vezes por andar em alta velocidade sem licença",life_speedCaught];};

					if(life_speedCaught > 6) exitWith {

							vehicle _driver setFuel 0.1;
							systemChat format["Está é sua multa: %1th !!!",life_speedCaught];
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar de Velocidader<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Velocidade MAX: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Motoristar: %3<br/>Agora você está sendo procurado por ultrapassar o limite de velocidade e vai ser preso no local",round _speed,_limit,name _driver];
							[[getPlayerUID _driver,name _driver,"120FSWL"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

					};
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar de Velocidade<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Velocidade MAX: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Motorista: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Você agora está sendo procurado por dirigir sem licença e estão sujeitos a prisão",round _speed,_limit,name _driver];
					[[getPlayerUID _driver,name _driver,"120WL"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					if(life_atmcash <= _ticketWL) then
					{
						if(life_atmcash <= _ticketWL) exitWith
						{
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar de Velocidade<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Velocidade MAX: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Motorista: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4<br/>Since you are broke and cannot pay, you now have a warrant out for you instead",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
							[[getPlayerUID _driver,name _driver,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
						};
						life_atmcash = life_atmcash - _ticketWL;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar de Velocidade<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Velocidade MAX: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Motorista: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
						//diag_log "Ticket paid from player bank";//for logging
						[1] call SOCK_fnc_updatePartial;
					} else {

						life_atmcash = life_atmcash - _ticketWL;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar de Velocidade<br/><t color='#ff0000'><t align='center'><t size='1.5'>Velocidade: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Velocidade MAX: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Motorista: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
						//diag_log "Ticket paid from player cash";//for logging
						[0] call SOCK_fnc_updatePartial;
					};
		};
	};
};
//diag_log "Speed cam script done";//for logging
sleep 5;