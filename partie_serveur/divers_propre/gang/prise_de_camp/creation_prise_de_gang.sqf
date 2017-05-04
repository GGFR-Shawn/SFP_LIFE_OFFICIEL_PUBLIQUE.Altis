// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

/* 
	Explication :
	Valeur 1 = Gang actuellement le possédant
	Valeur 2 = Gang qui est entrain de le prendre
*/

capture_de_gang_reprit = 0;	// Autoriser a prendre 0 fois par reboot
temps_capture_camp_de_gang = round (60 * 15);
publicvariable "capture_de_gang_reprit";
publicvariable "temps_capture_camp_de_gang";

_check_whitelist = ("Gang - prise de camp") call base_de_donnee_existante; 

if !(_check_whitelist) then 
{
	possession_camp_gang = ["",""];
	publicvariable "possession_camp_gang";
	
	["Gang - prise de camp", "Gang - prise de camp", 'possession_camp_gang', possession_camp_gang] call saveToDB;
}else
{
	possession_camp_gang = ["Gang - prise de camp", "Gang - prise de camp", "possession_camp_gang", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
	publicvariable "possession_camp_gang";
};

"possession_camp_gang" addPublicVariableEventHandler 
{
	["Gang - prise de camp", "Gang - prise de camp", 'possession_camp_gang', possession_camp_gang] call saveToDB;
};

