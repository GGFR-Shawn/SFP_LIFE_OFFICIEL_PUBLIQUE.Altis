// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_le_pompier","_effet_eau_sfp_maxou"];
_le_pompier = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_l_extincteur_sfp = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
if (isNull _le_pompier or isNull _l_extincteur_sfp) exitWith {};
if (player distance _le_pompier > 900) exitwith {};

while {!isnil {_le_pompier getvariable "je_deploie_eau_sfp";} && alive _le_pompier} do
{
	[_l_extincteur_sfp, _le_pompier] spawn 
	{	
		_l_extincteur_sfp = _this select 0;
		_le_pompier = _this select 1;
		_vitesse = 20;
		
		_effet_eau_sfp_maxou = "#particlesource" createVehicleLocal (getPosATL _l_extincteur_sfp);
		_effet_eau_sfp_maxou setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 0.5, [0.3,-0.03,0.95], [(vectorDir _le_pompier select 0) * (_vitesse + random 7), (vectorDir _le_pompier select 1) * (_vitesse + random 7), -0.5], 1, 8, 7, 0.01, [0.4, 2, 1], [ [0.55, 0.65, 1.00, 0.01], [0.55, 0.65, 1.00, 0.05], [0.30, 0.35, 0.40, 0.01], [0.00, 0.00, 0.00, 0.00]  ], [0], 0.05, 0.05,"","", _l_extincteur_sfp, 0, false, 0.03, [[0,0,0,0]] ];
		_effet_eau_sfp_maxou setParticleRandom [1, [0.0, 0.0, 0], [1.2, 1.2, 1.2], 0.3, 0.1, [0, 0, 0, 0], 0, 1];
		_effet_eau_sfp_maxou setParticleCircle [0, [0, 0, 0]];
		_effet_eau_sfp_maxou setDropInterval 0.001;
		sleep 0.08;
		deletevehicle _effet_eau_sfp_maxou;
	};
	sleep 0.05;
};