// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
								  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_choix_affichage_boutique = _this select 3 select 0 select 3 select 0;
if (isnil "_choix_affichage_boutique") exitwith {hint "Erreur recherche compilation habit ...";};

if (_choix_affichage_boutique == "0") then {[] call compile PreprocessFileLineNumbers "config\compilation_habits.sqf";};
if (_choix_affichage_boutique == "1") then {[] call compile PreprocessFileLineNumbers "config\compilation_habits_rebelles.sqf";};

// ====================================================================================================================================================================
													// SECURITE //
// ====================================================================================================================================================================
private "_creation_by_maxou_habit";
if (!isnil "je_veux_choisir_un_habit") exitwith {hint "Patiente, tu viens déja de faire cette action ;)";};

je_veux_choisir_un_habit = true;
annuler_boutique_habit = nil;
thisprice_bandana = nil;
thisprice_sacs_a_dos = nil;
thisprice_uniform = nil;
thisprice_vest = nil;

// ====================================================================================================================================================================
													// ENDROIT //
// ====================================================================================================================================================================
_direction_du_joueur = 310;

_les_coins_jolis = [[24062.8,17164,0],[20249.8,19676.3,0],[23200,24109,0],[24192.7,24071.4,0],[25161.7,23596.5,0],[25309.7,23398.6,0],[25683.5,23570.5,0],[26446.4,24601,0],[27179,25230.5,0],[28452.1,25725.1,0]];
_position_aleatoire = _les_coins_jolis call BIS_fnc_selectRandom;
_verifierjoueurautour = _position_aleatoire nearEntities ["man", 15];

while{({isPlayer _x} count (_verifierjoueurautour) > 0)} do
{
	_position_aleatoire = _les_coins_jolis call BIS_fnc_selectRandom;
	_verifierjoueurautour = _position_aleatoire nearEntities ["man", 15];
};

closedialog 0;

titletext["Pour un meilleur affichage de la caméra, enlever vos armes des mains ...","BLACK OUT",1]; sleep 1;

_ma_position_vetement = getPosATL player;
_uniform_actuel = uniform player;
_casque_actuel = headgear player;
_vest_actuel = vest player;
_sacs_a_dos = backpack player;
_mon_argent_actuel = player getvariable "mon_argent_banque_by_sfp_maxou";

player allowdamage false;
jai_le_droit_de_me_tp = 1; 
player setpos _position_aleatoire;
player enablesimulation false;
player setdir _direction_du_joueur; sleep 1;
titletext ["","black in",3];

if ((dayTime > 20 && dayTime < 23.99) or (dayTime >= 0 && dayTime < 6)) then  
{	
	_creation_by_maxou_habit = "#lightpoint" createVehicleLocal getPosATL player;
	_creation_by_maxou_habit setLightBrightness 0.32;
	_creation_by_maxou_habit setLightAmbient [1,1,1];	
	_creation_by_maxou_habit setLightColor [1,1,1];	
};

camUseNVG false;
showCinemaBorder false;
camera_boutique_habit_sfp = "camera" camCreate [(getPosATL player select 0) + (5), (getPosATL player select 1) + (0),(getPosATL player select 2) + (1)];
camera_boutique_habit_sfp cameraEffect ["EXTERNAL","back"]; 

// ====================================================================================================================================================================
												// CREATION MENU //
// ====================================================================================================================================================================
_nom_du_menu = "Menu_Habits";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1 €", (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];

["0"] execvm "divers\achats_divers_et_vehicules\vetements\habits_choix_a_afficher_menu.sqf";

// waituntil {!dialog;};
while {dialog} do
{
	if !(isnil "tourner_joueur_boutique_habit") then
	{
		player setdir ((getdir player) + 35);
	}else
	{
		if (getdir player != _direction_du_joueur) then
		{
			player setdir _direction_du_joueur;
		};
	};
	
	sleep 1;
};
// ====================================================================================================================================================================
																			// FIN //
// ====================================================================================================================================================================
camera_boutique_habit_sfp cameraEffect ["terminate","back"];
camDestroy camera_boutique_habit_sfp;
jai_le_droit_de_me_tp = 1; 
player setpos _ma_position_vetement;
player allowdamage true;
player enablesimulation true;

if (!isnil "_creation_by_maxou_habit") then {deletevehicle _creation_by_maxou_habit;};

if (!isnil "annuler_boutique_habit") exitwith 
{
	hint "Opération annulée ..."; 

	player globalchat "Opération annulée, montant total de la transaction 0 Euros !";
	
	je_veux_choisir_un_habit = nil;
	
	player forceadduniform _uniform_actuel;
	player addheadgear _casque_actuel;
	player addvest _vest_actuel;
	player addbackpack _sacs_a_dos;
};

if (_casque_actuel != headgear player) then 
{
	if (!isnil "thisprice_bandana") then
	{
		player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable "mon_argent_banque_by_sfp_maxou") - thisprice_bandana,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	};
};
if (_uniform_actuel != uniform  player) then 
{
	if (!isnil "thisprice_uniform") then
	{
		player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable "mon_argent_banque_by_sfp_maxou") - thisprice_uniform,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	};
};
if (_vest_actuel != vest player) then 
{
	if (!isnil "thisprice_vest") then
	{
		player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable "mon_argent_banque_by_sfp_maxou") - thisprice_vest,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	};
};
if (_sacs_a_dos != backpack player) then 
{
	if (!isnil "thisprice_sacs_a_dos") then
	{
		player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable "mon_argent_banque_by_sfp_maxou") - thisprice_sacs_a_dos,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	};
};

sleep 1;

player globalchat format ["Montant total de la transaction %1 Euros !",(player getvariable "mon_argent_banque_by_sfp_maxou") - _mon_argent_actuel];

je_veux_choisir_un_habit = nil;
