// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

titletext ["Veuillez choisir votre destination de ferry sur la liste qui c'est affichée ...","BLACK IN", 10];

if (!visibleMap) then {openMap [true, false];};

createdialog "Menu_liste_choix_destination_ferry_sfp";

for "_i" from 0 to ((count sfp_config_position_du_ferry_sfp) - 1) do
{
	((uiNamespace getVariable "Menu_liste_choix_destination_ferry_sfp") displayCtrl 1500) lbAdd format ["- %1 à %2 mètres pour %3 Euros (%4 Secondes).", (sfp_config_position_du_ferry_sfp select _i select 0), round (player distance (sfp_config_position_du_ferry_sfp select _i select 1)), sfp_config_position_du_ferry_sfp select _i select 2, sfp_config_position_du_ferry_sfp select _i select 3];	
	lbSetColor [1500, _i, [0,0.91,0.07,1]];
};

waituntil {!visibleMap or isNull (findDisplay 7896)};

if (!isnil "markeur_position_respawn") then
{
	deletemarkerlocal markeur_position_respawn;
	markeur_position_respawn = nil;
};

if (visibleMap) then {openMap [false, false];};

closedialog 0;