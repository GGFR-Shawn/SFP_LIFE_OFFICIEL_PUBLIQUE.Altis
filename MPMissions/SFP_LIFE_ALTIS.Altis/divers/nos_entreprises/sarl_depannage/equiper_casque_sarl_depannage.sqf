// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (isnil {player getvariable "sarl_depannage"}) exitwith {hint "! SARL DIR ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas acheter de matériels ici puisque vous ne faite pas partie de notre entreprise.\n\n Cordialement.";};

if((player getVariable "mon_argent_banque_by_sfp_maxou") >= 5) then
{
	player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - 5,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	player addHeadGear "H_Cap_headphones";
}
else
{
	Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,5];
};
