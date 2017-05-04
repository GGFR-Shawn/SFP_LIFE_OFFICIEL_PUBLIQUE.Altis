// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if ((player getVariable "mon_livret_a") >= sfp_config_montant_max_livret_A) exitwith {hint format ["Désolé, la somme maximum pour le livret A est de %1 Euros !", sfp_config_montant_max_livret_A];};
sommedesdeux = (player getVariable "mon_livret_a") + (floor parseNumber (ctrlText 1400));

if (sommedesdeux > sfp_config_montant_max_livret_A) exitwith {hint format ["Désolé le livret A est limité à %1 Euros !", sfp_config_montant_max_livret_A];};

if(floor parseNumber (ctrlText 1400) > 0) then 
{
	if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= floor parseNumber (ctrlText 1400)) then 
	{
		lasommeverse = floor parseNumber (ctrlText 1400);
		player setVariable['mon_livret_a',(player getVariable 'mon_livret_a') + floor parseNumber (ctrlText 1400),false];
		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - floor parseNumber (ctrlText 1400),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		closeDialog 0;
		execVM 'divers\banque\menu_banque.sqf';
		hint format ["! COMPTE LIVRET A ! \n ------------------------------- \n\n %1 euros ont bien été déposer sur ton livret A, il vont générer de l'argent d'ici peu avec %4 pourcent d'interet ! ;) \n\n Tu as maintenant %2 euros sur ton livret A ! \n\n Ton livret A est limité à %3 Euros !\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",lasommeverse,(player getVariable 'mon_livret_a'), sfp_config_montant_max_livret_A, sfp_config_montant_interet_livret_A];
	}else
	{
		hint "Pas assez d'argent en banque !";
	};
}else
{	
	hint "Désolé, mais 0 euros n'est pas valable !"
};