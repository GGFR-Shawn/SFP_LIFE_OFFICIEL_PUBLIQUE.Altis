// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_ajout_de_la_nouvelle_arme = currentWeapon player;;
if !(_ajout_de_la_nouvelle_arme in sfp_config_armes_autorisation_effet) exitwith {hint format ["Désolé, l'arme de type %1 n'est pas dans la liste autorisé !",getText ( configFile >> "Cfgweapons" >> (_ajout_de_la_nouvelle_arme) >> "displayName")];};
if (currentWeapon player == "") exitwith {hint "Désolé, vous n'avez pas d'armes";};

sfp_config_armes_autorisation_effet = sfp_config_armes_autorisation_effet - [_ajout_de_la_nouvelle_arme];

hint format ["L'arme de type %1 à bien été retiré à l'effet de balle !",getText ( configFile >> "Cfgweapons" >> (_ajout_de_la_nouvelle_arme) >> "displayName")];

['sfp_config_armes_autorisation_effet', sfp_config_armes_autorisation_effet] call uid_sauvegarde_ecrire_local_joueur_sfp;

closedialog 0;
