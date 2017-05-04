// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

cutText ["","BLACK FADED",0];

if (profilename == "[SFP] Maxou") then {execvm "maxou_debug.sqf";};

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {alive player};
waitUntil {hintsilent "Attente d'initialisation de la météo ..."; !isnil "fin_initialisation_meteo_sfp"};

revive_mon_side = playerSide;
je_suis_en_service_a_la_sarl_depannage = 0;
desactiver_message_infos_ecran = 0;

_lancement_initilisation_inventaire = [] execvm "config\init_config_sfp.sqf";
waitUntil {scriptDone _lancement_initilisation_inventaire;};
execvm "whitelist\init_whitelist.sqf";
waitUntil {hintsilent "... Initialisation ... \n ... Patientez ..."; !isnil "sfp_config_liste_moderateur" && !isnil "fin_ecriture_white_list";}; hintsilent "";
execvm "divers\configuration_joueur_lancement.sqf";
execvm "divers\banque\init_banque.sqf";
execvm "config\messages_infos.sqf";
execvm "divers\locations_de_vehicules\initautorisationdelouer.sqf"; 
execvm "divers\keyspressedsfp.sqf";
execvm "divers\maladie\init_maladie.sqf";
execvm "divers\divers\verifier_permis_by_sfp_maxou_et_simulation_du_poid_vehicule.sqf";
execvm "divers\toilettes\toilette_by_sfp_maxou.sqf";
execvm "divers\niveau_soif.sqf";
execvm "divers\niveau_de_faim.sqf";
execvm "divers\fautdormir.sqf";
execvm "divers\dialogue_hud_maxou.sqf";
execvm "divers\livret_a_banque\livret_a_banque.sqf";
execvm "divers\gendarmerie\menotter\remenotter_apres_deco_reco_message.sqf";
execvm "divers\centre_sportif\fatigue\initialisation_fatigue_centre_sportif.sqf";
[0,0,0,["1"]] execvm "divers\centre_sportif\force\initialisation_force_centre_sportif.sqf";
_lancement_initilisation_inventaire = ["1"] execvm "divers\onRespawn_habbit_aleatoire.sqf"; 
waitUntil {scriptDone _lancement_initilisation_inventaire;};
execvm "divers\achat_de_maison\init_achat_de_maison.sqf";
execvm "divers\gendarmerie\missions_aleatoires\missions_flics_aleatoires.sqf";
execvm "divers\corde_rapide_helico.sqf";
[false] execvm "divers\divers\optimisation_by_maxou_sfp.sqf";
execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_initialisation_client.sqf";
execvm "divers\date_de_naissance.sqf";
execvm "divers\divers\playertags.sqf";
execvm "divers\chasse_au_bots\client\initialisation_chasse_aux_bots_client.sqf";
execvm "divers\gendarmerie\prison\remettreenprisonsitriche.sqf";
execvm "divers\remettre_action_sur_les_entreprises.sqf";
execvm "divers\divers\systeme_hors_ligne_remboursement_et_amende\amende\check_joueur_amende.sqf";
execvm "divers\divers\systeme_hors_ligne_remboursement_et_amende\remboursement\check_joueur_remboursement.sqf";
execvm "divers\regeneration_de_la_sante.sqf";
execvm "divers\securite_menu_quitter.sqf";
execvm "divers\travail_au_noir\initialisation_travail_au_noir.sqf";
execvm "divers\effet_de_balle\init_effet_de_balle.sqf";
execvm "divers\gendarmerie\prison\systeme_de_prisonnier_quand_evade\action_quand_evader_de_prison.sqf";
execvm "divers\divers\visualisation_carte.sqf";
execvm "divers\groupe_des_joueurs\initialisation_groupe_des_joueurs.sqf";
execvm "divers\compilation_fonction_mp\initialisation_compilation.sqf"; 
execvm "divers\anti_hack_tp_by_maxou.sqf";
execvm "divers\anti_hack_kikou.sqf";
execvm "divers\anti_hack_argent.sqf";
execvm "divers\divers\atm_by_maxou_client.sqf";
execvm "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_force_du_signal_client.sqf";
execvm "divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_add_eventhler.sqf";
execvm "divers\recherche_du_tresor\init_recherche_du_tresor_client.sqf";
execvm "divers\recherche_de_la_caisse_d_armes\init_recherche_de_la_caisse_d_armes_client.sqf";
execvm "persistence\voitures\protection_temps_chargement_et_sauvegarde.sqf";
execvm "divers\divers\meteo_synchro_client_sfp.sqf";
execvm "divers\hud\admin\auto_fps_maxou_sfp\activation_auto_fps_maxou.sqf";
execvm "divers\spawn_marche_noir\creation_du_marche_noir_aleatoire_marker.sqf";
execvm "divers\son_nature_sfp\initialisation_son_nature_sfp.sqf";
execvm "divers\hud\Markers.sqf";
execvm "divers\banque\credit_sfp\initialisation_credit_sfp.sqf";
execvm "divers\addaction_carte_perf_sfp.sqf";
execvm "divers\divers\descendre_en_rappel_sfp.sqf";
execvm "divers\filtre_marker\FLTR_fnc_Main_modif_maxou.sqf";
execvm "divers\filtre_marker\mrkrFilterInit_modif_maxou.sqf";
[] spawn {waitUntil {!isnil "fin_verification_apres_chargement"}; if (player getvariable "ma_date_de_naissance" < 60) exitwith {execvm "menu\configuration_du_serveur.sqf";};};
[] spawn {waitUntil {!isnil "fin_verification_apres_chargement"}; [] execvm "divers\revive_sfp\initialisation_revive.sqf";};

if !(language in sfp_config_language_du_jeu_autorise) exitwith {["kick_non_francais",false,0] call BIS_fnc_endMission;};
if (isnil "jevaisvoirlintro") then {jevaisvoirlintro = true; execvm "divers\intro_deux.sqf";};
[] call compile PreprocessFileLineNumbers "persistence\players\c_serverSaveRelay.sqf";
waitUntil {!isNil "fonction_de_la_sauvegarde_initialise"};
[] execvm "persistence\players\c_loadAccount.sqf";

[] spawn
{
	if (!isnil "tf_radio_channel_name" && debug_mission_pour_dev) then
	{
		if ("task_force_radio_pipe" callExtension "TS_INFO	CHANNEL" == "Pipe error 6" && !isServer) then
		{
			for "_i" from 0 to 2 do
			{
				if ("task_force_radio_pipe" callExtension "TS_INFO	CHANNEL" == "Pipe error 6") then
				{
					titletext ["Le plugin Taskforce sur TS n'est pas activé (Pipe error 6). \n\n Tutoriel sur le forum au cas ou.","BLACK IN", 1];
					sleep 1;
					titletext ["Le plugin Taskforce sur TS n'est pas activé (Pipe error 6). \n\n Tutoriel sur le forum au cas ou.","BLACK IN", 6];
				
					sleep 10;
				};
			};
		};
	};
};

if (isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) then 
{
	[] execvm "\sfp_klaxon\init.sqf";
	sleep 12;
	player globalchat "Le launcher à bien été détecté !";
}else
{
	if (!IsServer) then
	{
		for "_i" from 0 to 2 do
		{
			sleep 10;
			titletext [format ["Attention %1, tu n'utilises pas le launcher et tu ne profitera pas de l'expérience entière de notre mod (véhicule invisible etc) ! Tu peux le télécharger sur www.sfpteam.fr/forum. \n\n De même arma risque de te kicker sans raisons (erreur d'objets ...)",name player], "BLACK IN", 10];
			sleep 200;
		};
	};
};