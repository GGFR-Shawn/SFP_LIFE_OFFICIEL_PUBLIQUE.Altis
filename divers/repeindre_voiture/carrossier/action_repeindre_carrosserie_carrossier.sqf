// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_selection = _this select 0 select 1;
_mon_vehicule = cursortarget;
if (isnil "_selection") exitwith {hint "Erreur, recommence ...";};
if (isnil {_mon_vehicule getvariable "vehicule_info_parvariable"}) exitwith {hint "! PEINTURE CARROSSIER ! \n ------------------------------------- \n\n Erreur, il n'y à plus de vehicule en face de toi ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (_mon_vehicule getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "! PEINTURE CARROSSIER ! \n ------------------------------------- \n Désolé, le véhicule face à toi ne t'appartient pas ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

couleur_modifie_peinture_carrossier = [listes_des_couleurs_des_vehicules_sfp select _selection select 2, listes_des_couleurs_des_vehicules_sfp select _selection select 1];

_mon_vehicule setObjectTexture couleur_modifie_peinture_carrossier;