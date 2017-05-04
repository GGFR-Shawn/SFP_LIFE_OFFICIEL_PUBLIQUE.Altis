// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_temps_un","_temps_deux","_parametre_cam"];

while {!isnil {player getvariable "jaibu_by_sfp_maxou"}} do
{
	if (player getVariable "jaibu_by_sfp_maxou" >= 3) then {_temps_un = 10; _temps_deux = (4 + (random 10)); _parametre_cam = [400, 35, 1];};
	if (player getVariable "jaibu_by_sfp_maxou" >= 2 && player getVariable "jaibu_by_sfp_maxou" < 3) then {_temps_un = 8; _temps_deux = (6 + (random 10)); _parametre_cam = [224, 28, 1];};
	if (player getVariable "jaibu_by_sfp_maxou" >= 1 && player getVariable "jaibu_by_sfp_maxou" < 2) then {_temps_un = 6; _temps_deux = (8 + (random 10)); _parametre_cam = [110, 28, 1];};
	if (player getVariable "jaibu_by_sfp_maxou" >= 0 && player getVariable "jaibu_by_sfp_maxou" < 1) then {_temps_un = 4; _temps_deux = (10 + (random 10)); _parametre_cam = [31, 28, 1];};
	
	player setVariable ['jaibu_by_sfp_maxou',(player getVariable 'jaibu_by_sfp_maxou') - 0.16,true]; 
	
	if (player getVariable "jaibu_by_sfp_maxou" < 0) then 
	{
		player setVariable ["jaibu_by_sfp_maxou",nil,true]; resetCamShake ;
	};
	
	cutText["","BLACK OUT",4]; 
	sleep _temps_un; 
	cutText["","BLACK IN",4]; 
	
	addCamShake _parametre_cam;
	sleep _temps_deux;
};