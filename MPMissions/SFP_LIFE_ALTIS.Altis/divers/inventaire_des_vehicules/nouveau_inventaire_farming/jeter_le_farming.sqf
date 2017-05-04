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
if (revive_mon_side == west) exitwith {hint "Opération impossible en gendarme ...";};
if (!isnil "operation_en_cours_sur_le_farming") exitwith {hint "Opération impossible, une opération est déja en cours ...";};
operation_en_cours_sur_le_farming = true;

createdialog "Menu_Choix_Montant_Farming";
waituntil {sleep 0.01; !isnil "choix_montant_du_menu_farming" or isnull (findDisplay 125896)};
if (isnil "choix_montant_du_menu_farming") exitwith {hint "Opération annulée";};

_nom_du_produit_de_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 2; 
_nom_de_la_variable_du_farming = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 0;
_nombre_de_place_de_la_variable = liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 1; 

if (isnil {player getvariable _nom_de_la_variable_du_farming}) then {player setvariable [_nom_de_la_variable_du_farming,0,true];};
if (isnil {objet_du_farming_a_scanner getvariable _nom_de_la_variable_du_farming}) then {objet_du_farming_a_scanner setvariable [_nom_de_la_variable_du_farming,0,true];};
if (isnil "_nom_de_la_variable_du_farming" or isnil "_nombre_de_place_de_la_variable" or isnil "_nom_du_produit_de_farming") exitwith {hint "Erreur, recommence ...";};

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

_temps_pour_jeter_farming = (liste_du_farming_colonne_de_gauche select ligne_colone_du_farming_gauche select 3) * choix_montant_du_menu_farming; 
for "_i" from 0 to _temps_pour_jeter_farming do
{
	if (alive player) then
	{
		titleText [format["Encore %1 secondes avant de jeter %2 ...", round (_temps_pour_jeter_farming - _i), _nom_du_produit_de_farming], "PLAIN"];
		sleep 1;
	};
	titleText ["", "PLAIN"];
};

operation_en_cours_sur_le_farming = nil;
if (!alive player) exitwith {};

if (_nom_de_la_variable_du_farming == "mon_argent_poche_by_sfp_maxou") then {autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";};

if (typeName (player getvariable _nom_de_la_variable_du_farming) == "BOOL") then
{
	player setvariable [_nom_de_la_variable_du_farming, nil, true];
}else
{
	player setvariable [_nom_de_la_variable_du_farming, (player getvariable _nom_de_la_variable_du_farming) - choix_montant_du_menu_farming, true];
};

player setvariable ["usedspace", (player getvariable "usedspace") - (choix_montant_du_menu_farming * _nombre_de_place_de_la_variable), true];

hint format ["Vous avez jeté %1 %2.", choix_montant_du_menu_farming, _nom_du_produit_de_farming];

execvm "divers\inventaire_des_vehicules\nouveau_inventaire_farming\mise_a_jour_informations_farming.sqf";
