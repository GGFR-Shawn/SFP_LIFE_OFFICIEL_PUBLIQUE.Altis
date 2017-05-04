// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 3; alive player};

// =======================================================================================================================================================================================
																			// SCRIPT DIVERS
// =======================================================================================================================================================================================
execVM "divers\divers\effet_grenade_fumigene.sqf";
execVM "divers\camera_surveillance\initialisation_camera_de_surveillance.sqf";
execvm "divers\maladie\reinitialiser_maladie.sqf";
execVM "divers\poser_objets\initialisation_objet_flics_et_civils.sqf";
execvm "divers\achat_divers_supermarche\initialisation_achat_divers_supermarche.sqf";
execvm "divers\licence_gang_et_territoire_gang\initialisation_addaction_gang.sqf";
execvm "divers\effet_des_drogues_soif_etc\initialisation_effet_de_drogue.sqf";
execvm "divers\cambriolage\initialisation_cambriolage.sqf";

enableSentences false; // Radio

// =======================================================================================================================================================================================
																			// ADDACTIONS DIVERSES
// =======================================================================================================================================================================================
waituntil {sleep 2; isnil {player getvariable "besoin_d_un_revive_news"}};

[] spawn {waituntil {sleep 2; !isnil "addaction_achat_de_maison_initialisation"}; if (sfp_config_autoriser_achat_maison) then {[] call addaction_achat_de_maison_initialisation;};};
[] spawn {waituntil {sleep 2; !isnil "addaction_travail_au_noir_initialisation_sfp_maxou"}; [] call addaction_travail_au_noir_initialisation_sfp_maxou;};
[] spawn {waituntil {sleep 2; !isnil "variable_addaction_revive"}; [player] spawn variable_addaction_revive;};
[] spawn {waituntil {sleep 2; !isnil "addaction_atm_menu"}; [player] spawn addaction_atm_menu;};
