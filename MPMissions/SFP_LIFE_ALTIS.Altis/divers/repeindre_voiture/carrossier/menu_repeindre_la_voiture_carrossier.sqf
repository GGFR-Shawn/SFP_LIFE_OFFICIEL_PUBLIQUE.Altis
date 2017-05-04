// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "avertissement_fonctionnement_carrossier") then
{
	avertissement_fonctionnement_carrossier = true;
	titletext ["! AVERTISSEMENT ! \n --------------------------------- \n\n Pour appliquer une peinture, il faut absolument la prévisualiser avant et ensuite cliquer sur VALIDER. Merci.","BLACK OUT",3];
	sleep 5;
	titletext ["! AVERTISSEMENT ! \n --------------------------------- \n\n Pour appliquer une peinture, il faut absolument la prévisualiser avant et ensuite cliquer sur VALIDER. Merci.","BLACK IN",5];
};

private "_prix_de_la_peinture";

_le_vehicule = cursortarget;
_le_vehicule_couleur_origine_sfp_maxou = getObjectTextures _le_vehicule;
fin_lecture_carrosserie = nil;
listes_des_couleurs_des_vehicules_sfp = nil;
valider_peinture_carrossier = false;
prix_reparation_carrosserie_carrossier = 1000; // Par tranche de 0.1

if (isnil "_le_vehicule") exitwith {hint "! PEINTURE CARROSSIER ! \n ------------------------------------- \n Désolé, aucun véhicule n'est en face de vous ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil {_le_vehicule getvariable "vehicule_info_parvariable"}) exitwith {hint "! PEINTURE CARROSSIER ! \n ------------------------------------- \n Désolé, ce n'est pas un véhicule ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (_le_vehicule getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "! PEINTURE CARROSSIER ! \n ------------------------------------- \n Désolé, ce n'est pas ton véhicule ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

[_le_vehicule] execvm "config\listes_des_couleurs_vehicules.sqf";
waituntil {!isnil "fin_lecture_carrosserie";};
if (isnil "listes_des_couleurs_des_vehicules_sfp") exitwith {hint "! PEINTURE CARROSSIER ! \n ------------------------------------- \n Désolé, ce véhicule n'est pas prit en charge ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

createDialog "Menu_Peinture_Carrossier";
ctrlSetText [1001, "Proposer vos skins pour les véhicules sur www.sfpteam.fr"];
((uiNamespace getVariable "Menu_Peinture_Carrossier") displayCtrl 1702) ctrlSetText format ["Reparer carrosserie pour %1 %2", round ((0 + (_le_vehicule getHitPointDamage "HitBody")) * prix_reparation_carrosserie_carrossier),"€"];

for "_i" from 0 to (count listes_des_couleurs_des_vehicules_sfp - 1) do
{
	lbAdd [1002, format ["%1 au prix de %2 %3.",  listes_des_couleurs_des_vehicules_sfp select _i select 0, listes_des_couleurs_des_vehicules_sfp select _i select 3, "€"]];
	((uiNamespace getVariable "Menu_Peinture_Carrossier") displayCtrl 1002) lbSetTooltip [_i, format ["%1 : Double clique pour visualiser.", listes_des_couleurs_des_vehicules_sfp select _i select 0]];
	lbSetPicture [1002, _i, "\A3\ui_f\data\IGUI\Cfg\WeaponCursors\sgun_gs.paa"];
	lbSetColor [1002, _i, [0,0.91,0.07,1]];	
};

_prix_de_la_peinture = listes_des_couleurs_des_vehicules_sfp select 0 select 3;
couleur_modifie_peinture_carrossier = [0,""];

waituntil {sleep 0.045; !dialog};

if (couleur_modifie_peinture_carrossier select 1 != "" && valider_peinture_carrossier) then
{
	hint format ["! PEINTURE CARROSSIER ! \n ------------------------------------- \n Ton véhicule à bien été repeint au prix de %1 Euros ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", _prix_de_la_peinture];

	_le_vehicule setObjectTextureGlobal couleur_modifie_peinture_carrossier;
	
	player setvariable ["mon_argent_banque_by_sfp_maxou",(player getvariable "mon_argent_banque_by_sfp_maxou") - _prix_de_la_peinture,true];
}else
{
	for "_i" from 0 to (count _le_vehicule_couleur_origine_sfp_maxou - 1) do
	{
		_le_vehicule setObjectTexture [_i, _le_vehicule_couleur_origine_sfp_maxou select _i];
	};
	
	if (!isnil "_le_vehicule") then
	{
		hint format ["! PEINTURE CARROSSIER ! \n ------------------------------------- \n Le véhicule : \n\n %1 \n\n n'a été repeint ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", getText ( configFile >> "CfgVehicles" >> typeOf(_le_vehicule) >> "displayName")];
	}else
	{
		hint "! PEINTURE CARROSSIER ! \n ------------------------------------- \n Aucun véhicule n'a été repeint ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	};
};