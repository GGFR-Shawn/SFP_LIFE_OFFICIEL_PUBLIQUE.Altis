// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "nombre_de_vehicule_autorise_max_actuellement"};

if (!isnil "operation_sur_la_sauvegarde") exitwith {hint "Patiente, une opération est déja en cours sur la sauvegarde !";};

// =====================================================================================================================================================================================================================
													// INITIALISATION VALEUR DE LA SAUVEGARDE POUR CHARGEMENT
// =====================================================================================================================================================================================================================
if (le_serveur_va_redemarrer_dans_20_minutes < 1 && nombre_de_vehicule_autorise_max_actuellement <= 0) exitwith {hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Vous ne pouvez plus charger de nouveau véhicule ! \n\n Cette option sera de nouveau disponible dans %1 secondes et vous serez à %2 vehicule autorisé sur un total de %3. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", temps_avant_de_pouvoir_utiliser_la_sauvegarde, nombre_de_vehicule_autorise_max_actuellement + 1, nombre_de_vehicule_autorise_max_par_default ];};
if (le_serveur_va_redemarrer_dans_20_minutes < 1) then
{
	if (nombre_de_vehicule_autorise_max_actuellement + 1 < nombre_de_vehicule_autorise_max_par_default + 1) then
	{
		hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Initialisation et detection de votre sauvegarde ! \n\n Véhicule restant autorisé à etre chargé : %1/%2 ; %3/%2 dans %4 secondes. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", nombre_de_vehicule_autorise_max_actuellement, nombre_de_vehicule_autorise_max_par_default, round (nombre_de_vehicule_autorise_max_actuellement + 1), temps_avant_de_pouvoir_utiliser_la_sauvegarde];
	}else
	{
		hint format ["! NEW SYSTEME DE SAUVEGARDE ! \n -------------------------------------------- \n \n Initialisation et detection de votre sauvegarde ! \n\n Véhicule restant autorisé à etre chargé : %1/%2. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", nombre_de_vehicule_autorise_max_actuellement, nombre_de_vehicule_autorise_max_par_default];
	};
};

_temps_attente = time + 5; // 5 Secondes
while {(!isnil "sauvegarde_vehicules_nombre_de_vehicules_total" or !isnil "sauvegarde_vehicules_ordre_de_rangement") && time < _temps_attente} do
{
	sauvegarde_vehicules_nombre_de_vehicules_total = nil; 
	sauvegarde_vehicules_ordre_de_rangement = nil; 
	sleep 0.001;
};
if (time > _temps_attente) exitwith {hint "Erreur (1), recommence ...";};

[uid_sav_voiture_fichier_listes_des_vehicules, uid_sav_voiture_fichier_listes_des_vehicules, "Nombre De Vehicules Total", "test_valeur_existe"] call LoadToServer;
[uid_sav_voiture_fichier_listes_des_vehicules, "Ordre_De_Rangement", "Ordre De Rangement Vehicules", "test_valeur_existe"] call LoadToServer;

_temps_attente = time + 7; // 7 Secondes
while {(isnil "sauvegarde_vehicules_nombre_de_vehicules_total" or isnil "sauvegarde_vehicules_ordre_de_rangement") && time < _temps_attente} do
{
	sleep 0.001;
};

_lancement_protection_debug_vehicule_rangement =
{
	private "_cote_de_la_sauvegarde_vehicule_ordre_de_rangement";
	_cote_de_la_sauvegarde_vehicule_ordre_de_rangement = format ["sauvegarde_vehicules_ordre_de_rangement_%1", revive_mon_side];
	
	if (!isnil {[_cote_de_la_sauvegarde_vehicule_ordre_de_rangement] call uid_sauvegarde_lire_local_joueur_sfp}) then
	{
		sauvegarde_vehicules_ordre_de_rangement = [_cote_de_la_sauvegarde_vehicule_ordre_de_rangement] call uid_sauvegarde_lire_local_joueur_sfp;
	}else
	{
		sauvegarde_vehicules_ordre_de_rangement = [];
	};
};
if (isnil "sauvegarde_vehicules_ordre_de_rangement") then {[] call _lancement_protection_debug_vehicule_rangement;};
if (count sauvegarde_vehicules_ordre_de_rangement < 1) then {[] call _lancement_protection_debug_vehicule_rangement;};

_lancement_protection_debug_vehicule_nombre =
{
	private "_cote_de_la_sauvegarde_vehicule_nombre_de_vehicules_total";
	_cote_de_la_sauvegarde_vehicule_nombre_de_vehicules_total = format ["sauvegarde_vehicules_nombre_de_vehicules_total_%1", revive_mon_side];
	
	if (!isnil {[_cote_de_la_sauvegarde_vehicule_nombre_de_vehicules_total] call uid_sauvegarde_lire_local_joueur_sfp}) then
	{
		sauvegarde_vehicules_nombre_de_vehicules_total = [_cote_de_la_sauvegarde_vehicule_nombre_de_vehicules_total] call uid_sauvegarde_lire_local_joueur_sfp;
	}else
	{
		sauvegarde_vehicules_nombre_de_vehicules_total = 0;
	};
};
if (isnil "sauvegarde_vehicules_nombre_de_vehicules_total") then {[] call _lancement_protection_debug_vehicule_nombre;};
if (sauvegarde_vehicules_nombre_de_vehicules_total < 1) then {[] call _lancement_protection_debug_vehicule_nombre;};

// =====================================================================================================================================================================================================================
																// LANCEMENT TABLEAU SAUVEGARDE
// =====================================================================================================================================================================================================================
// closedialog 0;

// cutText["","BLACK FADED"];
// 0 cutFadeOut 9999999;

_nom_du_menu = "Menu_tablette_sfp_Choix_Vehicule_A_Sauvegarder";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1004;
_titre_add_limite_vehicule = 1006;
_numero_add = 1500;
_numero_tableau = 0;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_couleur_blanche = [1,1,1,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText "Choix du véhicule à sauvegarder";
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_limite_vehicule) ctrlSetText format ["Nombre véhicules actuels : %1 / 20.", round count sauvegarde_vehicules_ordre_de_rangement];
 ((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetText "Double cliquez pour sauvegarder.";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetTextColor _couleur_rouge;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor _couleur_blanche;

private ["_espace_utilise","_espace_total","_immat"];
position_sauvegarde_de_mes_vehicules = [];
listes_sauvegarde_de_mes_vehicules = [];
_nombre_de_vehicule_trouve = 0;
{
	if (_x getvariable "vehicule_info_parvariable" select 0 == name player && alive _x) then
	{
		_nombre_de_vehicule_trouve = round (_nombre_de_vehicule_trouve + 1);

		_son_nom = gettext (configFile >> "CfgVehicles" >> typeof _x >> "displayname");
		_espace_utilise = _x getvariable "usedspace"; if (isnil "_espace_utilise") then {_espace_utilise = 0;};
		_espace_total = _x getvariable "totalspace"; if (isnil "_espace_total") then {_espace_total = 0;};
		_position = mapGridPosition (position _x);
		_immat = _x getVariable "plaque_immatriculation_news"; if (isnil "_immat") then {_immat = format ["Inconnu (%1)", round (random 1000)];}else{_immat = _immat select 1;};
		
		_format_tableau = format ["%1 - Plaque : %2 - Position : %3 - Farm : %4/%5",_son_nom, _immat, _position, _espace_utilise, _espace_total];
		lbAdd[_numero_add, _format_tableau]; 
		
		position_sauvegarde_de_mes_vehicules = position_sauvegarde_de_mes_vehicules + [position _x];
		listes_sauvegarde_de_mes_vehicules = listes_sauvegarde_de_mes_vehicules + [_x];
		
		lbSetPicture [_numero_add, _numero_tableau, "\A3\Soft_F\OffRoad_01\Data\UI\offroad_01_base_ca.paa"]; 
		
		((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_numero_tableau, "Selectionne et fait glisser pour voir ce véhicule sur la carte."];

		_numero_tableau = round (_numero_tableau + 1); 
	};
} foreach vehicles;

if (_nombre_de_vehicule_trouve < 1) then
{
	lbAdd[_numero_add, "Aucun véhicule trouvé ..."]; 	
};

// waituntil {!dialog;};
// cutText["","BLACK IN"];