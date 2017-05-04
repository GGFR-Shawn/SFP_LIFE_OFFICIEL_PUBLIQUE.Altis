// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if ((player getVariable "mon_argent_banque_by_sfp_maxou") > 150) then 
{
	if (isnil {player getvariable "j_ai_un_antibiotique"}) then
	{
		le_nom_de_larticle = "vos antibiotiques";
		le_prix_de_larticle = 150;
		hint "Tu viens d'acheter un antibiotique pour 150 Euros. \n\n Celui ci va t'immuniser sur les vagues de microbes que traverse Altis. \n\n L'antibiotique fera effet jusqu'a ta mort ! \n\n N'oublie pas qu'une mutuelle existe, si tu en as pas, souscrit la elle te remboursera jusqu'a la totalité de la somme !";
		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setvariable ["j_ai_un_antibiotique",true,false];
		['j_ai_un_antibiotique', true] call uid_sauvegarde_ecrire_local_joueur_sfp;
		sleep (100 + (random 100));
		le_nom_de_larticle = "vos antibiotiques";
		le_prix_de_larticle = 150;
		if ((player getVariable "ma_mutuelle_niveau_10_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 10;};
		if ((player getVariable "ma_mutuelle_niveau_vingt_cinq_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 25;}; 
		if ((player getVariable "ma_mutuelle_niveau_cinquante_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 50;};
		if ((player getVariable "ma_mutuelle_niveau_soixante_quinze_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 75;}; 
		if ((player getVariable "ma_mutuelle_niveau_cent_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle;}; 
		if (!(isnil "taux_de_remboursement_mutuelle")) then {player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') + taux_de_remboursement_mutuelle,true]; autorisation_mouvement_argent = true;};
		if (!(isnil "taux_de_remboursement_mutuelle")) then {hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous venez d'être remboursé de %1 Euros concernant %2 achetés dernièrement. \n\n La mutuelle vous à versée directement cet argent sur votre compte bancaire. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",taux_de_remboursement_mutuelle,le_nom_de_larticle];taux_de_remboursement_mutuelle = nil;};
	}else
	{
		Hint "Désolé, tu as déja un antibiotique !";
	};
}else
{
	hint "Désolé, tu n'as pas assez d'argent sur ton compte bancaire, reviens avec 150 Euros !";
};