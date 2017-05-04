// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isServer) then {condition_admin_serveur = true;}else{condition_admin_serveur = false;};
if (isnil "sfp_config_liste_moderateur") exitWith {hint "Erreur, la liste des modérateurs est vide !";};					
if (isnil "condition_admin_serveur") exitWith {hint "Erreur detection serveur !";};
if (!(getPlayerUID player in sfp_config_liste_moderateur) && !condition_admin_serveur) exitWith {};					

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

createdialog "Menu_tablette_sfp_menu_admin";

waituntil {!dialog;};
cutText["","BLACK IN"];