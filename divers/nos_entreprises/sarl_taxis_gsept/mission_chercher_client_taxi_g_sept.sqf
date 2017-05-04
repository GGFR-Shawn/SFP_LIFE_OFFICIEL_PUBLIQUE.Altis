// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =======================================================================================================================================================================================
																			// INITIALISATION //
// =======================================================================================================================================================================================
private ["_reinitialiser_variable_taxi","_argent_gagner","_recherche_endroit_chercher_client","_recherche_endroit_ou_deposer_client","_le_pnj_creation","_repere_du_marker_chercher_client","_repere_du_marker_deposer_client","_etat_de_la_mission","_distance_original","_distance_original_deux","_temps_pour_realiser_la_tache","_fin_mission_taxi_g_sept","_le_client_a_charger"];
if (isnil {player getvariable "sarl_taxis_gsept"}) exitwith {hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Bonjour, \n Vous êtes dans les bureaux de la SARL TAXI G7. \n\n Sauf erreur de ma part, vous n'avez pas le droit de démarrer une mission taxi.\n\n Cordialement.";};
if (player getvariable "license_permis_de_conduire_by_sfp_maxou" < 1) exitwith {hint "! MISSION TAXI ! \n -------------------------------------------- \n\n Désolé, \n\n vous devez avoir un permis pour faire cette mission ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil "mission_script_taxi_by_maxou") then {mission_script_taxi_by_maxou = 0;};
if (mission_script_taxi_by_maxou >= 1) exitwith {hint "! MISSION TAXI ! \n -------------------------------------------- \n\n Impossible, \n\n Tu es déja entrain de faire cette mission ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
mission_script_taxi_by_maxou = 1;

_check_autour = nearestObjects [player, ["Car","Ship","Air"], 8];
if (count _check_autour < 1) exitwith {titletext ["\n\n\n\n\n Vous ne pouvez pas commencer cette mission puisqu'aucun véhicule vous appartenant n'à été détecté près de votre position !","PLAIN",1];};
if ((_check_autour select 0) getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {titletext ["\n\n\n\n\n Vous ne pouvez pas commencer cette mission puisqu'aucun véhicule vous appartenant n'à été détecté près de votre position !","PLAIN",1];};

_reinitialiser_variable_taxi =
{
	mission_script_taxi_by_maxou = nil;
	if (!isnil "_le_pnj_creation") then {deletevehicle _le_pnj_creation};
	deletemarker _repere_du_marker_chercher_client;
	deletemarker _repere_du_marker_deposer_client;
};

// =======================================================================================================================================================================================
																// RECHERCHE ENDROIT OU CHERCHER LE CLIENT //
// =======================================================================================================================================================================================
hint format ["! SARL TAXI G7 ! \n --------------------------------------- \n\n Bienvenu %1, \n\n Nous recherchons actuellement un client ayant besoin d'un taxi ... \n\n ... Patientez ... \n ------------------------------------------- \n www.sfpteam.fr, by Maxou.",name player]; sleep 2;

_position_de_base = 0;
while {isnil "_recherche_endroit_chercher_client" && alive player} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	_position = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if (isOnRoad _position && !surfaceIsWater _position && alive player) then 
	{
		_recherche_endroit_chercher_client = _position;
	}; 
	sleep 0.01;
};
while {isOnRoad _recherche_endroit_chercher_client && alive player} do 
{	
	_position_de_base = round (_position_de_base + 1);
	_position_une_random = [_position_de_base,-_position_de_base] call BIS_fnc_selectRandom;
	_position_deux_random = [_position_de_base,-_position_de_base] call BIS_fnc_selectRandom;
	_recherche_endroit_chercher_client = [((_recherche_endroit_chercher_client select 0) + random _position_une_random),((_recherche_endroit_chercher_client select 1) + random _position_deux_random),0];
	sleep 0.01;
};

// =======================================================================================================================================================================================
																// RECHERCHE ENDROIT OU DEPOSER LE CLIENT //
// =======================================================================================================================================================================================
if (!alive player) exitwith {mission_script_taxi_by_maxou = nil;};
hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Nous vous avons trouvé un client. \n\n Nous recherchons maintenant l'endroit ou il souhaite être déposé ... \n ------------------------------------------- \n www.sfpteam.fr, by Maxou.";

_position_de_base = 0;
while {isnil "_recherche_endroit_ou_deposer_client" && alive player} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	_position = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if (_recherche_endroit_chercher_client distance _position >= 400 && count (nearestObjects [_position, ["house"], 6]) > 0 && alive player) then 
	{
		_recherche_endroit_ou_deposer_client = _position;
	}; 
	sleep 0.01;
	
	if (round (random 10) == 1) then {systemchat "Mission taxi en cours de recherche ...";};
};

if (!alive player) exitwith {mission_script_taxi_by_maxou = nil;};

_argent_gagner = round ((random 3) * (_recherche_endroit_chercher_client distance _recherche_endroit_ou_deposer_client)); // En euros

hint format ["! SARL TAXI G7 ! \n --------------------------------------- \n\n Nous avons trouvé la destination de votre client ... \n\n Vous pouvez maintenant aller le chercher (consulter votre carte) ! \n\n Vous gagnerez %1 %2 pour les %3 mètres que souhaite parcourir le client. \n ------------------------------------------- \n www.sfpteam.fr, by Maxou.", _argent_gagner, "€", round (_recherche_endroit_chercher_client distance _recherche_endroit_ou_deposer_client)];
systemchat "Mission taxi trouvée ...";

// =======================================================================================================================================================================================
																	// CREER LE PNJ ET LES MARQUEURS //
// =======================================================================================================================================================================================
_spawn_un_civil = ["C_man_p_fugitive_F_asia","C_man_p_fugitive_F","C_man_polo_6_F_euro","C_man_polo_6_F","C_man_polo_5_F_asia","C_man_polo_5_F_euro","C_man_polo_5_F","C_man_polo_4_F_asia","C_man_polo_4_F","C_man_polo_2_F_afro","C_man_polo_2_F","C_man_polo_1_F_asia","C_man_polo_1_F_afro","C_man_1_1_F"] call BIS_fnc_selectRandom;
_le_pnj_creation = (group player) createUnit [_spawn_un_civil,_recherche_endroit_chercher_client,[],0,"CAN_COLLIDE"];
[_le_pnj_creation] join grpNull;
_le_pnj_creation setvariable ["pnj_mission_taxi", true, false];
_le_pnj_creation disableAI "AUTOTARGET";
_le_pnj_creation disableAI "MOVE";
_le_pnj_creation stop true;

_nom_du_marker_mission_taxi_chercher_client = format ["pnj_mission_taxi_chercher_%1", _recherche_endroit_chercher_client select 0];
_repere_du_marker_chercher_client = createMarkerlocal [_nom_du_marker_mission_taxi_chercher_client, _recherche_endroit_chercher_client];
_repere_du_marker_chercher_client setMarkerColorlocal "ColorYellow";
_repere_du_marker_chercher_client setMarkerShapelocal "ICON";
_repere_du_marker_chercher_client setMarkerTypelocal "mil_circle";
_repere_du_marker_chercher_client setMarkerSizelocal [1.2, 1.2];
_nom_du_marker_mission_taxi_chercher_client setMarkerTextlocal " Client à chercher !";

_nom_du_marker_mission_taxi_deposer_client = format ["pnj_mission_taxi_deposer_%1", _recherche_endroit_ou_deposer_client select 0];
_repere_du_marker_deposer_client = createMarkerlocal [_nom_du_marker_mission_taxi_deposer_client, _recherche_endroit_ou_deposer_client];
_repere_du_marker_deposer_client setMarkerColorlocal "ColorYellow";
_repere_du_marker_deposer_client setMarkerShapelocal "ICON";
_repere_du_marker_deposer_client setMarkerTypelocal "mil_circle";
_repere_du_marker_deposer_client setMarkerSizelocal [1.2, 1.2];
_nom_du_marker_mission_taxi_deposer_client setMarkerTextlocal " Client à déposer !";

// =======================================================================================================================================================================================
																			// DEMARRAGE //
// =======================================================================================================================================================================================
_etat_de_la_mission = 1;
_distance_original = player distance _le_pnj_creation;
_temps_pour_realiser_la_tache = round ((((player distance _recherche_endroit_chercher_client) + (_recherche_endroit_ou_deposer_client distance _recherche_endroit_chercher_client)) / 100) + 700);

while {alive _le_pnj_creation && alive player && _temps_pour_realiser_la_tache > 0 && isnil "_fin_mission_taxi_g_sept"} do
{
	if (vehicle player != player) then
	{	
		if (_etat_de_la_mission == 1) then
		{	
			if (player distance _le_pnj_creation > 1000) then 
			{
				_calcul_distance = round ((player distance _le_pnj_creation) / 1000);
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Distance à parcourir : %1 Kms / %2 Kms. \n Argent à gagner : %3 %4. \n Temps restant : %5 Secondes.", _calcul_distance, round ((_distance_original) / 1000), _argent_gagner, '€', _temps_pour_realiser_la_tache],"PLAIN",1];
			}else
			{
				_calcul_distance = round (player distance _le_pnj_creation);
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Distance à parcourir : %1 Mètres / %2 Mètres. \n Argent à gagner : %3 %4. \n Temps restant : %5 Secondes.", _calcul_distance, round _distance_original, _argent_gagner, '€', _temps_pour_realiser_la_tache],"PLAIN",1];
			};
			
			if (player distance _le_pnj_creation < 10) then
			{
				_etat_de_la_mission = 2;
			};
			
			_repere_du_marker_chercher_client setMarkerPoslocal (getPosATL _le_pnj_creation);
		};
		
		if (_etat_de_la_mission == 2) then
		{			
			hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Rapproche toi de ton client pour qu'il puisse monter dans ton taxi ... \n ------------------------------------------- \n www.sfpteam.fr, by Maxou.";
			
			if (!isnil "_le_pnj_creation") then
			{
				if !(_le_pnj_creation in (vehicle player)) then
				{
					if (speed (vehicle player) < 0.1) then
					{					
						_etat_de_la_mission = 3;
						
						_le_pnj_creation moveincargo (vehicle player);
						
						hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Votre client est bien monté dans votre taxi ... \n ------------------------------------------- \n www.sfpteam.fr, by Maxou.";
					}else
					{
						hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Il faut être à l'arret pour que votre client puisse monter ... \n ------------------------------------------- \n www.sfpteam.fr, by Maxou.";
					};
				};
			};
		};
	
		if (_etat_de_la_mission == 3) then
		{
			if (isnil "_distance_original_deux") then {_distance_original_deux = player distance _recherche_endroit_ou_deposer_client;};
			
			if (player distance _recherche_endroit_ou_deposer_client > 1000) then 
			{
				_calcul_distance = round ((player distance _recherche_endroit_ou_deposer_client) / 1000);
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Distance à parcourir : %1 Kms / %2 Kms. \n Argent à gagner : %3 %4. \n Temps restant : %5 Secondes.", _calcul_distance, round ((_distance_original_deux) / 1000), _argent_gagner, '€', _temps_pour_realiser_la_tache],"PLAIN",1];
			}else
			{
				_calcul_distance = round (player distance _recherche_endroit_ou_deposer_client);
				titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Distance à parcourir : %1 Mètres / %2 Mètres. \n Argent à gagner : %3 %4. \n Temps restant : %5 Secondes.", _calcul_distance, round _distance_original_deux, _argent_gagner, '€', _temps_pour_realiser_la_tache],"PLAIN",1];
			};
			
			if !(_le_pnj_creation in (vehicle player)) then
			{
				_fin_mission_taxi_g_sept = true;
			};
			
			if (player distance _recherche_endroit_ou_deposer_client < 30) then
			{
				if (speed (vehicle player) < 0.1) then
				{					
					if (!isnil "_le_pnj_creation") then
					{
						if (_le_pnj_creation in (vehicle player)) then
						{						
							_fin_mission_taxi_g_sept = true;
							
							_le_pnj_creation action ["Eject", vehicle player];
						};
					};
				}else
				{
					hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Arreter le véhicule pour terminer la mission ... \n ------------------------------------------- \n www.sfpteam.fr, by Maxou.";
				};
			};

		};
	}else
	{
		titletext ["\n\n\n\n\n\n\n\n\n\n\n Remonte dans ton véhicule ...","PLAIN",1];
	};
		
	_temps_pour_realiser_la_tache = round (_temps_pour_realiser_la_tache - 1);
	
	sleep 1;
};

sleep 0.5;

if !(alive player) exitwith {[] call _reinitialiser_variable_taxi;};
if (isnil "_le_pnj_creation") exitwith {hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Mission terminéé ... Votre client est décédé ! \n ------------------------------------------- \n www.sfpteam.fr, by Maxou."; [] call _reinitialiser_variable_taxi;};
if !(alive _le_pnj_creation) exitwith {hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Mission terminéé ... Votre client est décédé ! \n ------------------------------------------- \n www.sfpteam.fr, by Maxou."; [] call _reinitialiser_variable_taxi;};
if !(_le_pnj_creation in (vehicle player)) exitwith {hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Mission terminéé ... Votre client à prit peur et est descendu du véhicule ! \n ------------------------------------------- \n www.sfpteam.fr, by Maxou."; [] call _reinitialiser_variable_taxi;};
if (_temps_pour_realiser_la_tache <= 0) exitwith {hint "! SARL TAXI G7 ! \n --------------------------------------- \n\n Mission terminéé ... Vous n'avez pas réussi dans le temps imparti ! \n ------------------------------------------- \n www.sfpteam.fr, by Maxou."; [] call _reinitialiser_variable_taxi;};

[] call _reinitialiser_variable_taxi;
hint format ["! SARL TAXI G7 ! \n --------------------------------------- \n\n Votre client est bien arrivé à destination ! \n\n Félicitation, vous avez donc gagné %1 %2. \n ------------------------------------------- \n www.sfpteam.fr, by Maxou.", _argent_gagner, "€"];