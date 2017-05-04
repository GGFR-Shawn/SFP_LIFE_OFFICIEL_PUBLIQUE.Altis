// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_option_wanted_liste = _this select 3 select 0;
nombre_maximum_d_infraction = 15;
if (isnil "_option_wanted_liste") exitwith {hint "Erreur wanted liste, recommence ...";};
if (_option_wanted_liste == 0) then {joueur_wanted_liste = player;};
if (_option_wanted_liste == 1 && !isnil "le_joueur_pour_mettre_amende") then {joueur_wanted_liste = le_joueur_pour_mettre_amende;};
if (_option_wanted_liste == 1 && isnil "le_joueur_pour_mettre_amende") then {joueur_wanted_liste = cursortarget;};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_wanted_liste";
createDialog _nom_du_menu;
disableSerialization;

execvm "divers\gendarmerie\wanted_liste\mise_a_jour_wanted_liste.sqf";

waituntil {!dialog;};
cutText["","BLACK IN"];

le_joueur_pour_mettre_amende = nil;