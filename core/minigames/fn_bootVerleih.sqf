/*
  File: fn_bootVerleih.sqf
  Author: TheTotenkopf for SealDrop

  Description:
  Titel :]
*/
private["_price","_boote","_duration","_className","_verleihAction","_player","_vPlayer","_spawnPoint","_timeKeeper"];

// CONFIG & VARIABLEN \\
_price = 5000;
_boote = ["C_Boat_Civil_01_rescue_F","C_Boat_Civil_01_F"];
_duration = (15 * 60);
_className = _boote select floor random count _boote;
_player = player;
_vPlayer = vehicle player;
_spawnPoint = "bootVerleih_spawn";
_timeKeeper = 1;

// Error checks
if(playerSide != civilian) exitWith {hintSilent "Você não é um civil!"};
if(!alive player) exitWith {};
if(_price > life_cash) exitWith {hintSilent format["Você não tem dinheiro suficiente com você! Você está faltando: %1 Reais",_price - life_cash]};
if(license_civ_boat) exitWith {hintSilent "Você não tem uma licença de barco!"};
if(life_bootVerleihInUse) exitWith {hintSilent "Você só pode alugar um barco ao mesmo tempo!"};

_verleihAction = [format["Gostaria de um barco %1 em alguns minutos? isto vai te custar %2",[(_duration),"MM"] call BIS_fnc_secondsToString,_price],"Boot Verleih Altis",localize "STR_Global_YES",localize "STR_Global_NO"] call BIS_fnc_guiMessage;
if(_verleihAction) then {
  hintSilent "A compra foi bem-sucedido o seu barco está agora no pie";
  life_bootVerleihInUse = true;
  sleep 2;
  // Start Boat spawn
  life_cash = life_cash - _price;
  _vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
  waitUntil {!isNil "_vehicle"};
  _vehicle allowDamage false; // Temp no damage
  _vehicle setPos (getMarkerPos _spawnPoint);
  _vehicle setDir (markerDir _spawnPoint);
  _vehicle engineOn true;
  _vehicle lock 2;
  _vehicle allowDamage true; // Can take damage now
  // Prepare the Player now
  _player allowDamage false; // Temp no damage
  _player moveInDriver _vehicle;
  _player allowDamage true; // Can take damage
  _player setDamage 0;
  hintSilent format["Seu barco está pronto! Você tem agora %1 minutos! Esperamos que você goste!",[(_duration),"MM"] call BIS_fnc_secondsToString];
  // Danke an KiloSwiss für den "TimeKeeper" <3
  if(_timeKeeper == 1) then {
    _timeKeeper = 0;
    _wait = time + _duration;
    waitUntil {uiSleep 5; time >= _wait};
    _timeKeeper = 1;
    life_bootVerleihDone = true;
    life_bootVerleihInUse = false;
  };
  // The time is over..
  if(life_bootVerleihDone) then {
    _vPlayer allowDamage false; // Temp no damage
    sleep 0.2;
    deleteVehicle _vPlayer;
    _player setPos (getMarkerPos "bootVerleihTimeOver");
    sleep 1;
    _player allowDamage true; // Can take damage
    _player setDamage 0; // Just for case
    hintSilent "Esperamos que você se divertiu com o seu barco! Estamos ansiosos para sua próxima visita!";
  };
};
