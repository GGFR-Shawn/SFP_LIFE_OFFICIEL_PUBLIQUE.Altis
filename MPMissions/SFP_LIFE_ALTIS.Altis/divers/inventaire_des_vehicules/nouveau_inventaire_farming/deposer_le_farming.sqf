// =====================================================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

private "_message";
ligne_colone_du_farming_gauche = lbcursel 1501;
ligne_colone_du_farming_droite = lbcursel 1500;
choix_montant_du_menu_farming = nil;
if (lbtext ([1501,0]) == "Rien dans l'inventaire.") exitwith {hint "Rien n'est selectionné ...";};
if (lbcursel 1501 == -1) exitwith {hint "Rien n'est selectionné ...";};
if !(autorisation_objet_du_farming_a_scanner) exitwith {hint "Opération impossible, vous n'avez pas l'autorisation de faire ceci ...";};
if (!isnil "operation_en_cours_sur_le_farming") exitwith {hint "Opération impossible, une opération est déja en cours ...";};

createdialog "Menu_Choix_Montant_Farming";
waituntil {sleep 0.01; !isnil "choix_montant_du_menu_farming" or isnull (findDisplay 125896)};
if (isnil "choix_montant_du_menu_farming") exitwith {hint "Opération annulée";};

_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 

_espace_de_l_objet_du_farming = objet_du_farming_a_scanner getvariable "usedspace";
_espace_total_de_l_objet_du_farming = objet_du_farming_a_scanner getvariable "totalspace";
_calcul_pour_resultat_place_disponible = round ((_espace_de_l_objet_du_farming + (choix_montant_du_menu_farming * _nombre_de_place_de_la_variable)) - _espace_total_de_l_objet_du_farming);

if (isnil {player getvariable _nom_de_la_variable_du_farming}) then {player setvariable [_nom_de_la_variable_du_farming,0,true];};
if (isnil {objet_du_farming_a_scanner getvariable _nom_de_la_variable_du_farming}) then {objet_du_farming_a_scanner setvariable [_nom_de_la_variable_du_farming,0,true];};
if (isnil "_nom_de_la_variable_du_farming" or isnil "_nombre_de_place_de_la_variable" or isnil "_nom_du_produit_de_farming" or isnil "_espace_de_l_objet_du_farming" or isnil "_espace_total_de_l_objet_du_farming") exitwith {hint "Erreur, recommence ...";};
if ((_espace_de_l_objet_du_farming + (choix_montant_du_menu_farming * _nombre_de_place_de_la_variable)) > _espace_total_de_l_objet_du_farming) exitwith {hint format ["Opération impossible, il manque %1 place dans l'inventaire d'en face ...", _calcul_pour_resultat_place_disponible];};

_condition_quantite_suffisante = true;
if (typeName (player getvariable _nom_de_la_variable_du_farming) == "BOOL") then 
{
	if (choix_montant_du_menu_farming > 1) then
	{
		_condition_quantite_suffisante = false;
		_message = format ["Opération impossible, %1 %2 maximum ...", 1, _nom_du_produit_de_farming];
	};
}else
{
	if (player getvariable _nom_de_la_variable_du_farming < choix_montant_du_menu_farming) then
	{
		_condition_quantite_suffisante = false;
		_message = format ["Opération impossible, %1 %2 maximum ...", player getvariable _nom_de_la_variable_du_farming, _nom_du_produit_de_farming];
	};		
};
if (!_condition_quantite_suffisante) exitwith {hint format ["%1", _message];};
if (_nom_de_la_variable_du_farming == "mon_argent_poche_by_sfp_maxou") then {autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";};

if (typeName (player getvariable _nom_de_la_variable_du_farming) == "BOOL") then
{
	player setvariable [_nom_de_la_variable_du_farming, nil, true];
	objet_du_farming_a_scanner setvariable [_nom_de_la_variable_du_farming, true, true];
}else
{
	player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - choix_montant_du_menu_farming, true];
	objet_du_farming_a_scanner setvariable [_nom_de_la_variable_du_farming, (objet_du_farming_a_scanner getvariable _nom_de_la_variable_du_farming) + choix_montant_du_menu_farming, true];	
};

player setvariable ["usedspace", (player getvariable "usedspace") - (choix_montant_du_menu_farming * _nombre_de_place_de_la_variable), true];
objet_du_farming_a_scanner setvariable ["usedspace", (objet_du_farming_a_scanner getvariable "usedspace") + (choix_montant_du_menu_farming * _nombre_de_place_de_la_variable), true];

hint format ["Vous avez déposé %1 %2.", choix_montant_du_menu_farming, _nom_du_produit_de_farming];
[[[player, objet_du_farming_a_scanner, choix_montant_du_menu_farming, _nom_du_produit_de_farming],"divers\inventaire_des_vehicules\nouveau_inventaire_farming\message_sur_joueur_farming.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

execvm "divers\inventaire_des_vehicules\nouveau_inventaire_farming\mise_a_jour_informations_farming.sqf";
