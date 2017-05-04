// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "parametrage_vehicules_prises_de_gang") exitwith {hint "Erreur compil prise de gang, contact maxou.";};

private ["_argent_du_menu","_prix_de_depart"];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = parametrage_vehicules_prises_de_gang select 0;

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = parametrage_vehicules_prises_de_gang select 1;
_titre_add_id = parametrage_vehicules_prises_de_gang select 2;
_numero_add = parametrage_vehicules_prises_de_gang select 3;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable _argent_du_menu) call retour_formatage_chiffre_sfp];

for "_i" from 0 to (count liste_vehicules_prises_de_gang - 1) do 
{	
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbAdd format ["%1 (%2 %3).", liste_vehicules_prises_de_gang select _i select 0, (liste_vehicules_prises_de_gang select _i select 3) call retour_formatage_chiffre_sfp,"€"];
};

for "_i" from 0 to (count liste_vehicules_prises_de_gang - 1) do 
{ 
	_prix_de_depart = liste_vehicules_prises_de_gang select _i select 3;
	
	_vitesse = getnumber (configFile >> "CfgVehicles" >> (liste_vehicules_prises_de_gang select _i select 2) >> "maxSpeed"); if (_vitesse < 1) then {_vitesse = "??";};
	_place = (1 + getnumber (configFile >> "CfgVehicles" >> (liste_vehicules_prises_de_gang select _i select 2) >> "transportSoldier")); if (_place < 2) then {_place = "??";};
	_latence_boite = (getnumber (configFile >> "CfgVehicles" >> (liste_vehicules_prises_de_gang select _i select 2) >> "latency") * 10) / 2; if (_latence_boite < 1) then {_latence_boite = "??";};
	_resistance_feu = getnumber (configFile >> "CfgVehicles" >> (liste_vehicules_prises_de_gang select _i select 2) >> "armor"); if (_resistance_feu < 1) then {_resistance_feu = "??";};
	_niveau_frein = round (getnumber (configFile >> "CfgVehicles" >> (liste_vehicules_prises_de_gang select _i select 2) >> "Wheels" >> "LF" >> "maxBrakeTorque") / 100); if (_niveau_frein < 1) then {_niveau_frein = "??";};
		
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i, format['Vitesse : %1 Km/h; Place : %2; Latence Boite : %3; Resistence Feu : %4 %6; Frein : %5 %6.', _vitesse, _place, _latence_boite, _resistance_feu, _niveau_frein, "%"]];
	if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  
	lbSetColor [_numero_add, _i, couleur_valeur];

	lbSetPicture [_numero_add, _i, "\A3\Soft_F\OffRoad_01\Data\UI\offroad_01_base_ca.paa"];	
};

waituntil {!dialog;};
cutText["","BLACK IN"];