// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_mon_vehicule = cursortarget;

if (isnil {_mon_vehicule getvariable "vehicule_info_parvariable"}) exitwith {hint "! REPARATION CARROSSIER ! \n ------------------------------------- \n\n Erreur, il n'y à plus de vehicule en face de toi ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (_mon_vehicule getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "! REPARATION CARROSSIER ! \n ------------------------------------- \n Désolé, le véhicule face à toi ne t'appartient pas ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (_mon_vehicule getHitPointDamage "HitBody" == 0) exitwith {hint "! REPARATION CARROSSIER ! \n ------------------------------------- \n Votre véhicule n'a pas besoin de réparation ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

_prix_reparation_carrosserie = round ((0 + (_mon_vehicule getHitPointDamage "HitBody")) * prix_reparation_carrosserie_carrossier);

_mon_vehicule setHitPointDamage ["HitBody",0];

hint "! REPARATION CARROSSIER ! \n ------------------------------------- \n La carrosserie de votre véhicule à été réparé. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
((uiNamespace getVariable "Menu_Peinture_Carrossier") displayCtrl 1702) ctrlSetText format ["Reparer carrosserie pour %1 %2", round ((0 + (_mon_vehicule getHitPointDamage "HitBody")) * prix_reparation_carrosserie_carrossier),"€"];

player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") - _prix_reparation_carrosserie,true];
