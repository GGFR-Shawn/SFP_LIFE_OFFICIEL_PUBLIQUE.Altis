// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] call compile preprocessFile "divers\revive_sfp\compilation_revive.sqf";

player addEventHandler ["Killed", variable_joueur_mort_revive]; // Action quand mort

revive_mon_side = playerSide;

revive_camera_distance = [-0.3,0,0.1];
revive_camera_de_nuit = false;

revive_autorisation_tirer_blesse = false;
respawn_condition_revive = false;

niveau_max_secouriste_revive = 7;

// ==================================================================================================================================================================================================================
																			// FIN EDITION
// ==================================================================================================================================================================================================================
[] spawn 
{
	waituntil {!isnil "fin_verification_apres_chargement_pour_revive" && !isnil "variable_sauvegarde_automatique_revive"};
	
	_nul = [] call variable_sauvegarde_automatique_revive;
};

[] spawn
{
	waituntil {!isnil "fin_verification_apres_chargement_pour_revive" && !isnil "variable_sauvegarde_joueur_revive"};
	
	variable_public_revive_tirer_et_charger = [];
	variable_public_revive_lacher_et_decharger = [];
	variable_public_revive_marker = [];
	variable_public_revive_action_charger_blesse = [];
	variable_public_revive_action_decharger_blesse = [];
	variable_public_revive_mort_d_un_joueur = [];
	variable_public_revive_retirer_god_mod = [];
	variable_public_achever_le_joueur = [];
	variable_public_soins_revive_rate = [];
	
	"variable_public_revive_tirer_et_charger" addPublicVariableEventHandler variable_synchronisation_MP_revive;
	"variable_public_revive_lacher_et_decharger" addPublicVariableEventHandler variable_synchronisation_MP_revive;
	"variable_public_revive_marker" addPublicVariableEventHandler variable_synchronisation_MP_revive;
	"variable_public_revive_action_charger_blesse" addPublicVariableEventHandler variable_synchronisation_MP_revive;
	"variable_public_revive_action_decharger_blesse" addPublicVariableEventHandler variable_synchronisation_MP_revive;
	"variable_public_revive_mort_d_un_joueur" addPublicVariableEventHandler variable_synchronisation_MP_revive;
	"variable_public_revive_retirer_god_mod" addPublicVariableEventHandler variable_synchronisation_MP_revive;
	"variable_public_achever_le_joueur" addPublicVariableEventHandler variable_synchronisation_MP_revive;
	"variable_public_soins_revive_rate" addPublicVariableEventHandler variable_synchronisation_MP_revive;
	
	_nul = [] spawn variable_marker_revive;
	revive_sauvegarde = [player] spawn variable_sauvegarde_joueur_revive;
	
	revive_contacter_service_urgence = 0;
	revive_reponse_service_d_urgence = 0;
	revive_impossibilite_de_respawn = 0;
	revive_choix_possible = 0;
	player addrating 9999;
};