// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if ((lbCurSel 1500) == -1) exitwith {hint "! REPARATION DIR! \n -------------------------------- \n\n Désolé, rien n'est selectionné ! \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr";};
if (count les_vehicules_en_pannes_pour_la_dir_by_sfp_maxou < 1) exitwith {hint "! REPARATION DIR! \n -------------------------------- \n\n Désolé, aucun véhicule en panne actuellement ! \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr";};

_le_vehicule_en_panne = les_vehicules_en_pannes_pour_la_dir_by_sfp_maxou select (lbCurSel 1500);
_le_proprietaire = _le_vehicule_en_panne getvariable "vehicule_info_parvariable" select 0;

[[[name player, _le_proprietaire, _le_vehicule_en_panne],"divers\nos_entreprises\sarl_depannage\systeme_contacter_dir\clients\message_recu_depanneur_arrive.sqf"],"BIS_fnc_execVM", true,false] spawn BIS_fnc_MP;
_le_vehicule_en_panne setvariable ["vehicule_attente_reparation",nil,true];

hint format ["! REPARATION DIR! \n -------------------------------- \n\n Bonjour %1, \n\n Votre confirmation à %2 pour le véhicule %3 à bien été envoyé. \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr", name player, _le_proprietaire, getText ( configFile >> "CfgVehicles" >> typeOf (_le_vehicule_en_panne) >> "displayName")];

closedialog 0;
execvm "divers\nos_entreprises\sarl_depannage\systeme_contacter_dir\employes\menu_joueurs_demandant_depannage.sqf";