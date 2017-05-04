// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_parametrage_du_tableau", "_prise_en_compte_du_tableau", "_liste_recherche_informations_armes", "_prix_de_depart","_type_chargeur_un","_vitesse_balle","_capacite_chargeur"];
if (isnil "parametrage_armes_pistolets_prises_de_gang") exitwith {hint "Erreur compil prise de gang, contact maxou.";};

_parametrage_du_tableau = parametrage_armes_pistolets_prises_de_gang; 
_prise_en_compte_du_tableau = armes_pistolets_prises_de_gang;
_nom_du_menu = _parametrage_du_tableau select 0;
_argent_du_menu = _parametrage_du_tableau select 1;
_titre_add_id = _parametrage_du_tableau select 2;
_numero_add = _parametrage_du_tableau select 3;
if (isnil "_nom_du_menu" or isnil "_argent_du_menu" or isnil "_titre_add_id" or isnil "_numero_add") exitwith {hint "Erreur configuration du dialogue, recommence !";};

cutText ["","BLACK FADED"]; 
0 cutFadeOut 9999999;

createDialog _nom_du_menu; 
disableSerialization;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable _argent_du_menu)];

for "_i" from 0 to (count _prise_en_compte_du_tableau - 1) do 
{
	lbAdd [_numero_add, format ["%1 : %2 %4 \ Munitions : %3 %4", _prise_en_compte_du_tableau select _i select 0, _prise_en_compte_du_tableau select _i select 3, _prise_en_compte_du_tableau select _i select 5, "€"]];
};

for "_i" from 0 to (count _prise_en_compte_du_tableau - 1) do 
{ 
	prix_calcul_couleur = _prise_en_compte_du_tableau select _i select 3;
	if (player getvariable _argent_du_menu < prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

	lbSetColor [_numero_add, _i, couleur_valeur];	
	
	// ======================================================================================================================================== //
	lbSetPicture [_numero_add, _i, "\A3\ui_f\data\IGUI\Cfg\WeaponIcons\srifle_ca.paa"];

	// ======================================================================================================================================== //
	_type_chargeur_un = []; 
	for "_d" from 0 to (count (_prise_en_compte_du_tableau select _i select 4) - 1) do 
	{
		_type_chargeur_un = _type_chargeur_un + [(_prise_en_compte_du_tableau select _i select 4) select _d];
	};
	
	if (count _type_chargeur_un > 1) then {_vitesse_balle = format ["environ %1", getnumber (configFile >> "CfgMagazines" >> _type_chargeur_un select 0 >> "initSpeed")];}else {_vitesse_balle = getnumber (configFile >> "CfgMagazines" >> _type_chargeur_un select 0 >> "initSpeed");};
	if (count _type_chargeur_un > 1) then {_capacite_chargeur = format ["environ %1",getnumber (configFile >> "CfgMagazines" >> _type_chargeur_un select 0 >> "count")];} else {_capacite_chargeur = getnumber (configFile >> "CfgMagazines" >> _type_chargeur_un select 0 >> "count");};
	if (count _type_chargeur_un > 1) then {_type_chargeur_un = format ["%1, etc ...", _type_chargeur_un select 0];}else{_type_chargeur_un = _type_chargeur_un select 0;};

	if (isnil "_type_chargeur_un") then {_type_chargeur_un = "Inconnu";};
	if (isnil "_vitesse_balle") then {_vitesse_balle = "Inconnu";};
	if (isnil "_capacite_chargeur") then {_capacite_chargeur = "Inconnu";};
	
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i,  format['Vitesse Balle : %1 M/s /.\ Type Chargeur : %2 /.\ Capacite Chargeur : %3 Balles.', _vitesse_balle, _type_chargeur_un, _capacite_chargeur]];
};

waituntil {!dialog;};
cutText["","BLACK IN"];