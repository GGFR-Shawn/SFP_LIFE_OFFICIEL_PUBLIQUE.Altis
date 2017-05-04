// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil {player getvariable "sarl_neomedia"}) exitwith {hint "! SARL NEOMEDIA ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas acheter de matériels ici puisque vous ne faite pas partie de notre entreprise.\n\n Cordialement.";};
if (primaryweapon player != "") exitwith {hint "! SARL NEOMEDIA ! \n --------------------------------------- \n\n Enlève ton arme principal avant de t'équiper.";};

if ((player getVariable "mon_argent_banque_by_sfp_maxou") >= 400) then
{
	hint format ["! SARL NEOMEDIA ! \n --------------------------------------- \n\n Bonjour %1,\n\n Pour te faire gagner du temps, j'ai créé un pack du journaliste qui comprend : \n\n - Un gilet journaliste. \n - Une casquette journaliste. \n - Un habit journaliste. \n\n Amuse toi bien :)",name player];

	player forceAddUniform "U_C_Journalist";
	player addvest "V_Press_F";
	player addHeadGear "H_Cap_press";
	player addweapon "Press_Cam_F_SFP";
	player addweapon "Press_Mic_AAN_F_SFP";
	
	player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - 400,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
} else
{
	Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou'),400];
};
