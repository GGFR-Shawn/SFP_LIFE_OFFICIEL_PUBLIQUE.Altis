// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_le_vehicule","_couleur_modifie_peinture_carrossier"];
_le_vehicule = _this select 0;
if (isNull _le_vehicule or isnil "_le_vehicule") exitWith {}; 

fin_lecture_carrosserie = nil;
listes_des_couleurs_des_vehicules_sfp = nil;
[_le_vehicule] execvm "config\listes_des_couleurs_vehicules.sqf";
waituntil {sleep 1; !isnil "fin_lecture_carrosserie";};

if !(isnil "listes_des_couleurs_des_vehicules_sfp") then 
{
	_appliquer_couleur_aleatoire_sfp = round (random (count listes_des_couleurs_des_vehicules_sfp - 1));
	_couleur_modifie_peinture_carrossier = [listes_des_couleurs_des_vehicules_sfp select _appliquer_couleur_aleatoire_sfp select 2, listes_des_couleurs_des_vehicules_sfp select _appliquer_couleur_aleatoire_sfp select 1];

	if (revive_mon_side == west && typeof _le_vehicule == "sfp_yamaha_moto") then {_couleur_modifie_peinture_carrossier = [0, "shounka_a3_base\couleurs\bleufonce.paa"];};
	
	_le_vehicule setObjectTextureglobal _couleur_modifie_peinture_carrossier;
};
