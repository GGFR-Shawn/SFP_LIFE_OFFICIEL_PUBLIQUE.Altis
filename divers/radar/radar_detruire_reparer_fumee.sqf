// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_le_radar";
_la_position = position (_this select 0);
_le_radar = nearestObjects [_la_position, ["SpeedRadar1"], 300];
if (isnil "_la_position") exitwith {};
if (count _le_radar < 1 && isClass(configFile >> "CfgVehicles" >> "SpeedRadar1")) exitwith {};
if (count _le_radar >= 1) then {_le_radar = _le_radar select 0;};

_fumee_radar_sfp = "#particlesource" createVehiclelocal _la_position;
_fumee_radar_sfp setParticleClass "MediumDestructionSmoke";
_fumee_radar_sfp setPosATL _la_position;
_fumee_radar_sfp attachto [_la_position];

waituntil {sleep 2; isnil {_le_radar getvariable "radar_sfp_desactive"}};

deletevehicle _fumee_radar_sfp;
