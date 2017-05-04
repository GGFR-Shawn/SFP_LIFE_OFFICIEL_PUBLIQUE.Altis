// =====================================================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

private "_message";
ligne_colone_du_farming_gauche = lbcursel 1501;
choix_montant_du_menu_farming = nil;
if (lbtext ([1501,0]) == "Rien dans l'inventaire.") exitwith {hint "Rien n'est selectionné ...";};
if (lbcursel 1501 == -1) exitwith {hint "Rien n'est selectionné ...";};

createdialog "Menu_Choix_Montant_Farming";
waituntil {sleep 0.01; !isnil "choix_montant_du_menu_farming" or isnull (findDisplay 125896)};
if (isnil "choix_montant_du_menu_farming") exitwith {hint "Opération annulée";};

_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 

if (isnil {player getvariable _nom_de_la_variable_du_farming}) exitWith {hint "Variable inconnu ... Contact Maxou";};
if (isnil "_nom_de_la_variable_du_farming" or isnil "_nombre_de_place_de_la_variable" or isnil "_nom_du_produit_de_farming") exitwith {hint "Erreur, recommence ...";};
if (player getvariable _nom_de_la_variable_du_farming < choix_montant_du_menu_farming) exitwith {hint format ["Opération impossible, %1 %2 maximum ...", player getvariable _nom_de_la_variable_du_farming, _nom_du_produit_de_farming];};

player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - choix_montant_du_menu_farming, true];
player setvariable ["usedspace", (player getvariable "usedspace") - (choix_montant_du_menu_farming * _nombre_de_place_de_la_variable), true];

hint format ["! MARCHE SFP ! \n -------------------------------------------- \n\n Vous avez jeté %1 %2.\n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", choix_montant_du_menu_farming, _nom_du_produit_de_farming];

execvm "menu\nouveau_menu_vendre_au_marche\mise_a_jour_informations_farming_marche.sqf";
