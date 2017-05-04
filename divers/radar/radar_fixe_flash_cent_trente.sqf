// =======================================================================================================================================================================================
															// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
															  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_getmymoney","_mespointsenmoins","_vitesse_sfp","_pointenmoins","_condition","_le_radar"];
_getmymoney = player getVariable "mon_argent_banque_by_sfp_maxou";
_mespointsenmoins = player getVariable "combien_de_point_by_sfp_maxou";
_vitesse_sfp = speed player;
_condition = false;

if !(isnil "autorisation_flash_radar_sfp") exitwith {};
[] spawn {autorisation_flash_radar_sfp = true; sleep 3; autorisation_flash_radar_sfp = nil;};

if (isClass(configFile >> "CfgVehicles" >> "SpeedRadar1")) then
{
	_le_radar = nearestObjects [position (vehicle player), ["SpeedRadar1"], 300];
	if (count _le_radar >= 1) then {_le_radar = _le_radar select 0;}else{_le_radar = nil;};
	
	if (!isnil "_le_radar") then
	{
		if (isnil {_le_radar getvariable "radar_sfp_desactive"}) then
		{
			if ((round _vitesse_sfp >= 135) && (round _vitesse_sfp < 140)) then {le_prix_de_larticle = 90; _pointenmoins = 1; _condition = true;};
			if ((round _vitesse_sfp >= 140) && (round _vitesse_sfp < 150)) then {le_prix_de_larticle = 105; _pointenmoins = 2; _condition = true;};			
			if ((round _vitesse_sfp >= 150) && (round _vitesse_sfp < 160)) then {le_prix_de_larticle = 135; _pointenmoins = 3; _condition = true;};		
			if ((round _vitesse_sfp >= 160) && (round _vitesse_sfp < 170)) then {le_prix_de_larticle = 180; _pointenmoins = 4; _condition = true;};		
			if ((round _vitesse_sfp >= 180) && (round _vitesse_sfp < 190)) then {le_prix_de_larticle = 230; _pointenmoins = 5; _condition = true;};		
			if (round _vitesse_sfp >= 190) then {le_prix_de_larticle = 300; _pointenmoins = 12; _condition = true;};
			
			if (_condition) then
			{	
				cutText["\n\n !!! Vous avez été flashé !!!","WHITE IN",3];
				
				if !(vehicle player getVariable "plaque_immatriculation_news" select 0 in sfp_config_listes_des_plaques_non_flashables) then
				{
					if (player getVariable "license_permis_de_conduire_by_sfp_maxou" >= 1) then
					{
						player setVariable ['combien_de_point_by_sfp_maxou', _mespointsenmoins - _pointenmoins,true];
						
						hint format["!! FLASHE AUX RADARS !! \n ---------------------------------- \n %1 points en moins sur votre permis de conduire pour avoir roulé à %2 Km/H et %3 Euros d'amende ! \n\n ---------------------------------- \n By [SFP] Maxou",_pointenmoins,round _vitesse_sfp,le_prix_de_larticle];
						
						if (player getVariable "combien_de_point_by_sfp_maxou" <= 0) then
						{
							player setVariable["license_permis_de_conduire_poids_lourd_by_sfp_maxou",0,true];
							player setVariable ["license_permis_de_conduire_by_sfp_maxou",0,true];
							player setVariable ['combien_de_point_by_sfp_maxou',0,true];
						
							hint format["!! FLASHE AUX RADARS !! \n ---------------------------------- \n %1 points en moins sur votre permis de conduire pour avoir roulé à %2 Km/H et %3 Euros d'amende ! \n\n Vous n'avez plus de permis ! \n\n ---------------------------------- \n By [SFP] Maxou",_pointenmoins,round _vitesse_sfp,le_prix_de_larticle];
						};
					}else
					{
						hint format["!! FLASHE AUX RADARS !! \n ---------------------------------- \n Amende de %1 Euros pour avoir roulé à %2 Km/H ! \n\n Vous n'avez plus de permis ! \n\n ---------------------------------- \n By [SFP] Maxou", le_prix_de_larticle, round _vitesse_sfp];
					};

					player setVariable ['mon_argent_banque_by_sfp_maxou', _getmymoney - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
				}else
				{
					hint "!! FLASHE AUX RADARS !! \n ---------------------------------- \n Votre plaque étant illisible, vous n'allez pas recevoir d'amende ! \n\n ---------------------------------- \n By [SFP] Maxou";
				};
			};
		}else
		{
			hint "!! FLASHE AUX RADARS !! \n ---------------------------------- \n Le radar ne flash plus, il est détruit ! \n\n ---------------------------------- \n By [SFP] Maxou";
		};
	};
};

