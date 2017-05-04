// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if(floor parseNumber (ctrlText 1400) > 0) then 
{
	if((player getVariable 'mon_livret_a') >= floor parseNumber (ctrlText 1400)) then 
	{
		lasommeverse = floor parseNumber (ctrlText 1400);
		player setVariable['mon_livret_a',(player getVariable 'mon_livret_a') - floor parseNumber (ctrlText 1400),false];
		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') + floor parseNumber (ctrlText 1400),false]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		closeDialog 0;
		execVM 'divers\banque\menu_banque.sqf';
		hint format ["! COMPTE LIVRET A ! \n ------------------------------- \n\n %1 euros ont bien été retirer de ton livret A ! ;) \n\n Tu as maintenant %2 euros sur ton livret A ! \n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",lasommeverse,(player getVariable 'mon_livret_a')];
	}else
	{
		hint "Pas assez d'argent sur ton livret A !";
	};
}else
{	
	hint "Désolé, mais 0 euros n'est pas valable !"
};