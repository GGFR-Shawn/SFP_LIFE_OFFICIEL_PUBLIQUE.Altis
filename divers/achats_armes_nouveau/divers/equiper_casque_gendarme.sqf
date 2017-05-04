// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (revive_mon_side != west) exitwith {hint "Désolé, vous n'étes pas gendarme !";};

if((player getVariable "mon_argent_banque_by_sfp_maxou") >= 100) then
{
	player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - 100,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	player addHeadGear "H_PilotHelmetHeli_B";
}
else
{
	Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,100];
};
