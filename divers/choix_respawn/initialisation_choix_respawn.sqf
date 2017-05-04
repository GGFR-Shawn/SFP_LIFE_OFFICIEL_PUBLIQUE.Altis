// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_mise_a_jour_des_positions_de_respawn";
waituntil {!isnil "fin_verification_apres_chargement"};

_lancement_initilisation_inventaire = [] execvm "config\init_config_sfp.sqf";
waitUntil {scriptDone _lancement_initilisation_inventaire;};

switch revive_mon_side do
{
	case civilian :
	{
		position_de_mes_respawn = sfp_config_choix_position_civils;
	};
	
	case west :
	{
		position_de_mes_respawn = sfp_config_choix_position_gendarmes;
	};
};

_mise_a_jour_des_positions_de_respawn =
{
	_le_nom = _this select 0;
	_la_position = _this select 1;
	if (isnil "_le_nom" or isnil "_la_position") exitwith {};
	
	[position_de_mes_respawn, [_le_nom, _la_position]] call BIS_fnc_arrayPush;
};

if (je_suis_en_service_a_la_sarl_depannage >= 1) then {["Sarl Depannage",(getmarkerpos "position_sarl_depannage_respawn")] call _mise_a_jour_des_positions_de_respawn;};
if (!isnil "jesuis_au_taff_a_la_sarl_neomedia") then {["Sarl NéoMédia",(getmarkerpos "position_sarl_neomedia_respawn")] call _mise_a_jour_des_positions_de_respawn;};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then {["Sarl Pompier",(getmarkerpos "position_sarl_pompier_respawn")] call _mise_a_jour_des_positions_de_respawn;};
if (!isnil "jesuis_au_taff_a_la_sarl_taxis_gsept") then {["Sarl Taxi G7",(getmarkerpos "position_sarl_g7_respawn")] call _mise_a_jour_des_positions_de_respawn;};
if (!isnil "jesuis_au_taff_a_la_sarl_car_shop_pour_respawn") then {["SARL Car Shop",(getpos sarlcarshop_georgetown)] call _mise_a_jour_des_positions_de_respawn;};
if (!isnil "je_suis_en_famille_une") then {[sfp_config_famille_une_nom,(getmarkerpos "position_famille_une_respawn")] call _mise_a_jour_des_positions_de_respawn;};
if (!isnil "je_suis_en_famille_deux") then {[sfp_config_famille_deux_nom,(getmarkerpos "position_famille_deux_respawn")] call _mise_a_jour_des_positions_de_respawn;};

for "_i" from 0 to ((count liste_de_mes_maisons) - 1) do
{
	[format ["Maison numéro %1", _i], liste_de_mes_maisons select _i] call _mise_a_jour_des_positions_de_respawn;
};

titletext ["Veuillez choisir votre position de respawn sur la liste qui c'est affichée ...","BLACK IN", 10];

jai_le_droit_de_me_tp = 1; 
player setPos (position_de_mes_respawn select 0 select 1);

if (!visibleMap) then {openMap [true, false];};

createdialog "Menu_liste_choix_respawn";

for "_i" from 0 to ((count position_de_mes_respawn) - 1) do
{
	((uiNamespace getVariable "Menu_liste_choix_respawn") displayCtrl 1500) lbAdd format ["Spawner à %1 - distance %2 mètres.", (position_de_mes_respawn select _i select 0), round (player distance (position_de_mes_respawn select _i select 1))];	
	((uiNamespace getVariable "Menu_liste_choix_respawn") displayCtrl 1500) lbSetTooltip [_i,  "Double clique pour choisir cette destination."];
	lbSetColor [1500, _i, [0,0.91,0.07,1]];
};

waituntil {!visibleMap or isNull (findDisplay 7896)};

if (!isnil "markeur_position_respawn") then
{
	deletemarkerlocal markeur_position_respawn;
	markeur_position_respawn = nil;
};

if (visibleMap) then {openMap [false, false];};

closedialog 0;