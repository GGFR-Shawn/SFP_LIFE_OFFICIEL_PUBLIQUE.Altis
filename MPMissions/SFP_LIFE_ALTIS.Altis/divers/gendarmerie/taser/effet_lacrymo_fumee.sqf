// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_le_gendarme","_temps_lacrymogene"];
_le_gendarme = _this select 0;
_temps_lacrymogene = (_this select 1) / 2.84;
if (isNull _le_gendarme or isnil "_temps_lacrymogene") exitWith {};
if (player distance _le_gendarme > 100) exitwith {};
if (!hasInterface) exitwith {};

_le_gendarme say "son_des_lacrymo_par_sfp_maxou";

while {_temps_lacrymogene > 0} do
{
	[_le_gendarme] spawn 
	{
		_le_gendarme = _this select 0;
		_vitesse = 60;
		
		_point_de_repere_maxou = "FxExploArmor3" createVehicleLocal (position _le_gendarme);
		_point_de_repere_maxou attachto [_le_gendarme,[0,0,0],"righthand"];
		_point_de_repere_maxou hideobject true;

		_effet_fumee_sfp_maxou = "#particlesource" createVehicleLocal (getPosATL _point_de_repere_maxou);
		_effet_fumee_sfp_maxou setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 0.5, [-0.03,0.12,-0.03], [(vectorDir _le_gendarme select 0) * (_vitesse + random 1), (vectorDir _le_gendarme select 1) * (_vitesse + random 1), -0.5], 0, 1, 1, 0, [0.1, 0.2, 0.6], [ [1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]  ], [0], 0.05, 0.05,"","", _point_de_repere_maxou, 0, false, 0.03, [[0,0,0,0]] ];
		_effet_fumee_sfp_maxou setParticleRandom [1, [0.0, 0.0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0.1];
		_effet_fumee_sfp_maxou setParticleCircle [0, [0, 0, 0]];
		_effet_fumee_sfp_maxou setDropInterval 0.1;
		sleep 0.2;
		deletevehicle _effet_fumee_sfp_maxou;
		deletevehicle _point_de_repere_maxou;
	};
	
	_temps_lacrymogene = _temps_lacrymogene - 0.01;
	sleep 0.01;
};