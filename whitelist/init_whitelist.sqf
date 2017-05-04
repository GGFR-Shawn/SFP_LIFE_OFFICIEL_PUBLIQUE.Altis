// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

cutText["","BLACK FADED"];

0 cutFadeOut 9999999; 
0 fadeSound 0; 
0 fadeMusic 0;

execVM "whitelist\whitelist_gouverneur.sqf";
execVM "whitelist\whitelist_GIGN.sqf";
execVM "whitelist\whitelist_flics.sqf";
execVM "whitelist\whitelist_gendarmes_stagiaire.sqf";

_temps_d_attente = 25;
fin_check_whitelist = nil;
while {isnil "fin_check_whitelist" && (isnil "fin_ecriture_gouverneur" or isnil "fin_ecriture_GIGN" or isnil "fin_ecriture_flic")} do
{
	sleep 0.1;
	_temps_d_attente = round (_temps_d_attente - 1);
	if (_temps_d_attente <= 0) then {fin_check_whitelist = 1;};
};
if (_temps_d_attente <= 0) exitwith {execvm "whitelist\init_whitelist.sqf";}; 


while {isnil "fin_ecriture_white_list"} do {fin_ecriture_white_list = 1;sleep 0.1;};
sleep 20;
fin_ecriture_gouverneur = nil;
fin_ecriture_GIGN = nil;
fin_ecriture_flic = nil;
fin_ecriture_white_list = nil;
