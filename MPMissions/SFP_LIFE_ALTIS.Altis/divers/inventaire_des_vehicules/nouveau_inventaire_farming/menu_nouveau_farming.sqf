// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =======================================================================================================================================================================================
									// Vérification si l'objet possède un inventaire //
// =======================================================================================================================================================================================

if (!isnil "operation_en_cours_sur_le_farming") exitwith {hint "Opération impossible, une opération est déja en cours ...";};

private ["_autorisation_du_menu","_detection_de_quelque_chose"];
_autorisation_du_menu = false;
_detection_de_quelque_chose = false;
objet_du_farming_a_scanner = cursortarget;
autorisation_objet_du_farming_a_scanner = true;

// Voitures
if (locked cursorTarget != 2 && !isnil {cursortarget getvariable "vehicule_info_parvariable"}) then
{
	_detection_de_quelque_chose = true;
	_autorisation_du_menu = true;
	_lancement_initilisation_inventaire = [cursorTarget] execvm "config\tailles_des_inventaires_des_vehicules.sqf";
	waitUntil {scriptDone _lancement_initilisation_inventaire;};
	if (valeur_de_l_inventaire_vehicule_a_appliquer != 0) then 
	{
		[cursorTarget] call debug_farming_vehicule;
		titletext ["Attention !!!!!!!! \n\n Seul le farming légal et l'inventaire de base d'arma est sauvegardable dans ce véhicule !!!!","PLAIN"];
	} else
	{
		titletext ["Désolé, pour le moment ce véhicule ne peut pas recevoir de matériel","PLAIN"];
	};
}else
{
	if (locked cursorTarget == 2 && !isnil {cursortarget getvariable "vehicule_info_parvariable"}) then
	{
		_autorisation_du_menu = true;
		_detection_de_quelque_chose = true;
		autorisation_objet_du_farming_a_scanner = false;
		titletext ["Désolé, ce véhicule est vérrouillé ... \n\n Vous ne pourrais pas voir et y déposer de chose !","PLAIN"];
	};
};

// Coffre Fort
if (!isnil {cursortarget getvariable "proprietaire_du_coffre"}) then
{
	_detection_de_quelque_chose = true;
	if (isnil "le_serveur_vient_de_demarrer") exitwith {hint "Patiente, le serveur vient de démarrer !";};
	if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitwith {hint "Tu ne peux pas car le serveur va redémarrer dans moins de 20 minutes !";};
	
	_le_coffre = cursortarget;
	mot_de_passe_du_coffre_fort = nil;

	if (revive_mon_side != west) then
	{
		createdialog "CoffreFortRentrerMotDePasseNonProprio";
		noesckeydeux = (findDisplay 4844) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
		ctrlSetText[11115,format["Propriétaire : %1",(_le_coffre getVariable "proprietaire_du_coffre")]];
		waituntil {!isnil "mot_de_passe_du_coffre_fort"};
	};
	
	if (revive_mon_side != west && _le_coffre getvariable "mot_de_passe_du_coffre_fort" != mot_de_passe_du_coffre_fort) then 
	{
		(FindDisplay 602) closeDisplay 1;
		closedialog 0;
		(findDisplay 4844) displayRemoveEventHandler ["KeyDown", noesckeydeux];
		titleText["\n\n\n\n\n\n\n\n Désolé le mot de passe n'est pas le bon !", "PLAIN",0];
	};
	if (revive_mon_side != west && _le_coffre getvariable "mot_de_passe_du_coffre_fort" == mot_de_passe_du_coffre_fort) then 
	{
		closedialog 0;
		(findDisplay 4844) displayRemoveEventHandler ["KeyDown", noesckeydeux]; 
		titleText["\n\n\n\n\n\n\n\n Mot de passe accepté !", "PLAIN",0];

		_autorisation_du_menu = true;
		mot_de_passe_du_coffre_fort = nil;
		titletext ["Attention !!!!!!!! \n\n Seul le farming et l'argent sont sauvegardable !!!!","PLAIN"];

		[_le_coffre] spawn
		{
			sleep 4;
			waituntil {!dialog};
			re_scanner_le_coffre_fort = _this select 0;
			publicvariable "re_scanner_le_coffre_fort";
		}; 
	}; 
	
	if (revive_mon_side == west) then
	{
		_autorisation_du_menu = true;
		mot_de_passe_du_coffre_fort = nil;
		titletext ["ByPass gendarmes coffre fort ...","PLAIN"];

		[_le_coffre] spawn
		{
			sleep 4;
			waituntil {!dialog};
			re_scanner_le_coffre_fort = _this select 0;
			publicvariable "re_scanner_le_coffre_fort";
		};		
	};		
};

// Joueur
if (cursorTarget iskindof "man") then
{
	_detection_de_quelque_chose = true;
	if (!isnil {cursortarget getvariable "je_collecte"}) exitwith {hint "Désolé, le joueur est déja entrain de collecter !";};
	if (isnil "je_vends_au_marche_noir_protection") then {je_vends_au_marche_noir_protection = 0;};
	if (je_vends_au_marche_noir_protection >= 1) exitwith {hint "! Opération Impossible ! \n\n Une vente au marché noir est en cours !";};

	hint format ["N'oublie pas de négocier ton prix avant la vente avec %1 !",(name cursortarget)];

	_autorisation_du_menu = true;
	
	titletext ["Tout est sauvegardable ici ...","PLAIN"];
};

// Valise Farming
if (cursortarget getvariable 'valise_de_farming' >= 1) then
{
	_detection_de_quelque_chose = true;
	_autorisation_du_menu = true;
	
	titletext ["Inventaire de la valise ouvert ...","PLAIN"];
};

// Moi
if (!_detection_de_quelque_chose) then
{
	_autorisation_du_menu = true;
	
	autorisation_objet_du_farming_a_scanner = false;
	
	objet_du_farming_a_scanner = player;
	
	titletext ["Mon inventaire personnel avancé ...","PLAIN"];
};

if (!_autorisation_du_menu) exitwith {};
// =======================================================================================================================================================================================
											// Lancement du script //
// =======================================================================================================================================================================================

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Nouveau_Menu_Inventaire_Farming";

createDialog _nom_du_menu;
disableSerialization;

execvm "divers\inventaire_des_vehicules\nouveau_inventaire_farming\mise_a_jour_informations_farming.sqf";

waituntil {!dialog;};
cutText["","BLACK IN"];