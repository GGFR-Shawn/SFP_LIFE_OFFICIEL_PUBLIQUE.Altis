// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 3; !isnil "fin_verification_apres_chargement"};

private ["_temps_max_fatigue","_stabilite_viseur","_vitesse_personnage"];
sleep 5;

_temps_max_fatigue = 30;
_stabilite_viseur = sfp_config_vitesse_stabilite_du_viseur;
_vitesse_personnage = sfp_config_vitesse_du_personnage;
jutilise_une_redbull = 0;

player enableStamina true;
setStaminaScheme "Normal";
player setAnimSpeedCoef _vitesse_personnage;
player setCustomAimCoef _stabilite_viseur;

while {true} do
{
	waituntil {jutilise_une_redbull < 1 && isnil "prise_d_amphetamine";};

	if (player getvariable "temps_fatigue_niveau_1" >= 1) then
	{
		_temps_max_fatigue = 30;
		_stabilite_viseur = sfp_config_vitesse_stabilite_du_viseur;
		_vitesse_personnage = sfp_config_vitesse_du_personnage;
	};
	if (player getvariable "temps_fatigue_niveau_2" >= 1) then
	{
		_temps_max_fatigue = 35;
		_stabilite_viseur = sfp_config_vitesse_stabilite_du_viseur - 0.1;
		_vitesse_personnage = sfp_config_vitesse_du_personnage + 0.05;
	};
	if (player getvariable "temps_fatigue_niveau_3" >= 1) then
	{
		_temps_max_fatigue = 38;
		_stabilite_viseur = sfp_config_vitesse_stabilite_du_viseur - 0.2;
		_vitesse_personnage = sfp_config_vitesse_du_personnage + 0.10;
	};
	if (player getvariable "temps_fatigue_niveau_4" >= 1) then
	{
		_temps_max_fatigue = 46;
		_stabilite_viseur = sfp_config_vitesse_stabilite_du_viseur - 0.3;
		_vitesse_personnage = sfp_config_vitesse_du_personnage + 0.14;
	};
	if (player getvariable "temps_fatigue_niveau_5" >= 1) then
	{
		_temps_max_fatigue = 54;
		_stabilite_viseur = sfp_config_vitesse_stabilite_du_viseur - 0.5;
		_vitesse_personnage = sfp_config_vitesse_du_personnage + 0.2;
	};

	if (getStamina player < 5 && _temps_max_fatigue != 54) then 
	{
		if (isnil "avertissementdumessagedefatigue") then 
		{
			avertissementdumessagedefatigue = true;
			hint "Attention, \n\n Tu es très fatigué ! \n\n N'oublie pas de t'entrainer pour gagner en performance au centre sportif ;)";
		};
	};

	if (getStamina player > _temps_max_fatigue) then
	{
		player SetStamina _temps_max_fatigue;
	};
	
	if (getAnimAimPrecision player != _stabilite_viseur) then
	{
		player setCustomAimCoef _stabilite_viseur;
	};
	
	if (getAnimSpeedCoef player != _vitesse_personnage) then
	{
		player setAnimSpeedCoef _vitesse_personnage;
	};
	
	sleep 1;
};