// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_l_etoile_filante_by_maxou = _this select 0;
if (isnil "_l_etoile_filante_by_maxou") exitwith {};
if (!hasInterface) exitwith {};

la_brillance_de_depart = 0.01;
luminosite_etoile_fillante_max = round (20 + (random 30));

_lumiere_etoile_filante_by_maxou = "#lightpoint" createVehicleLocal (getPosATL _l_etoile_filante_by_maxou);
_lumiere_etoile_filante_by_maxou setLightBrightness la_brillance_de_depart;
_lumiere_etoile_filante_by_maxou setLightAmbient [1,1,1];
_lumiere_etoile_filante_by_maxou setLightColor [1, 1, 1];
_lumiere_etoile_filante_by_maxou lightAttachObject [_l_etoile_filante_by_maxou, [0,0,0]];

_fumee_etoile_filante_by_maxou = "#particlesource" createVehicleLocal (getPosATL _l_etoile_filante_by_maxou);
_fumee_etoile_filante_by_maxou setParticleCircle [0, [0, 0, 0]];
_fumee_etoile_filante_by_maxou setParticleRandom [5, [0.01, 0.01, 0.01], [0,0,0], 0.3, 0.5, [1, 1, 1, 1], 0, 0];
_fumee_etoile_filante_by_maxou setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7,48,1], "", "Billboard", 1, 20, [0, 0, 0], [0, 0, 0.5], 0, 10.1, 7.9, 0.01, [1,1,1], [[0.1,0.1,0.1,0.9], [0.6,0.6,0.6,0.6], [0.8,0.8,0.8,0.4],[0.9,0.9,0.9,0.3],[1,1,1,1]], [0.125], 1, 0, "", "", _l_etoile_filante_by_maxou];
_fumee_etoile_filante_by_maxou setDropInterval 0.002;


while {alive _l_etoile_filante_by_maxou && la_brillance_de_depart > 0 && la_brillance_de_depart < luminosite_etoile_fillante_max} do
{
	if (getPosATL _l_etoile_filante_by_maxou select 2 < 200) then 
	{
		la_brillance_de_depart = (la_brillance_de_depart + 0.85);
	}else
	{
		la_brillance_de_depart = (la_brillance_de_depart + 0.17);
	};

	_lumiere_etoile_filante_by_maxou setLightBrightness la_brillance_de_depart;
	sleep 0.01;
};

while {alive _l_etoile_filante_by_maxou && la_brillance_de_depart > 0} do
{
	if (getPosATL _l_etoile_filante_by_maxou select 2 < 200) then 
	{
		la_brillance_de_depart = (la_brillance_de_depart - 0.85);
	}else
	{
		la_brillance_de_depart = (la_brillance_de_depart - 0.17);
	};

	_lumiere_etoile_filante_by_maxou setLightBrightness la_brillance_de_depart;
	sleep 0.01;
};


deletevehicle _lumiere_etoile_filante_by_maxou;
deletevehicle _l_etoile_filante_by_maxou;