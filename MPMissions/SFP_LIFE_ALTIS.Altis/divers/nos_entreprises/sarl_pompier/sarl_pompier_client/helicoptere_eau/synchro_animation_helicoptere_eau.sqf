// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_helico_pompier_sfp","_effet_eau_sfp_maxou"];
_helico_pompier_sfp = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
if (isNull _helico_pompier_sfp) exitWith {};
if (player distance _helico_pompier_sfp > 900) exitwith {};

_vitesse = 10;
_effet_eau_sfp_maxou = "#particlesource" createVehicleLocal (getPosATL _helico_pompier_sfp);
_effet_eau_sfp_maxou setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 0.5, [0,-2.5,0], [0, 0,-12], 1, 18, 7, 0.01, [5, 20, 11], [ [0.55, 0.65, 1.00, 0.01], [0.55, 0.65, 1.00, 0.05], [0.30, 0.35, 0.40, 0.01], [0.00, 0.00, 0.00, 0.00]  ], [0], 0.05, 1.05,"","", _helico_pompier_sfp, 0, false, 0.03, [[0,0,0,0]] ];
_effet_eau_sfp_maxou setParticleRandom [10, [0.0, 0.0, 0], [1, 1, 1], 0.3, 0.1, [0, 0, 0, 0], 0, 0];
_effet_eau_sfp_maxou setParticleCircle [0, [0, 0, 0]];
_effet_eau_sfp_maxou setDropInterval 0.004;
sleep 3.5;
deletevehicle _effet_eau_sfp_maxou;
