// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil {player getvariable "avertir_carte_tuer"}) exitwith {hint "! DECLARATION EN MAIRIE ! \n -------------------------------------------- \n \n Opération impossible, tu viens de tuer quelqu'un, patiente ... \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (player getvariable "ma_carte_identite" select 1 != "nom") exitwith {hint "! DECLARATION EN MAIRIE ! \n -------------------------------------------- \n \n Opération impossible, tu es déjà déclaré en mairie ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil "choix_avatar_carte_identite") then {choix_avatar_carte_identite = round (random 36);};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "menu_carte_identite_sfp_maxou_creation";

createDialog _nom_du_menu;
disableSerialization;

((findDisplay 456987) displayCtrl 1200) ctrlSetText (listes_des_avatars_carte_identite select choix_avatar_carte_identite);

waituntil {!dialog;};
cutText["","BLACK IN"];