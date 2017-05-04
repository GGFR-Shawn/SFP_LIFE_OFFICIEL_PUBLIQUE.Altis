// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "autoriser_maj_habit") then {autoriser_maj_habit = 0;};
if (autoriser_maj_habit >= 1) exitwith {};
autoriser_maj_habit = 1;
tenue_feu_pompier = nil;

while {alive player && isnil "tenue_feu_pompier"} do
{
	sleep 0.5;
	_habbitactuel = uniform player;
	if (_habbitactuel != "U_BG_Guerilla2_3") then 
	{
		player forceAddUniform "U_BG_Guerilla2_3";
		sleep 1;
		player setObjectTextureGlobal [0, "textures\habbit_pompier.jpg"];
	};
	
	if (typeof (vehicle player) in sfp_config_listes_des_vehicules_pompiers && isnil {(vehicle player) getvariable "reservoir_d_eau_pour_pompier"}) then
	{
		(vehicle player) setvariable ["reservoir_d_eau_pour_pompier",0,true];
	};
};

autoriser_maj_habit = nil;