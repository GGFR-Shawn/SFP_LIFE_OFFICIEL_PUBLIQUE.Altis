argent_actuellement = player getVariable "mon_argent_poche_by_sfp_maxou";
le_prix_de_larticle = 50;
mon_argent_poche_by_sfp_maxou = player getVariable "mon_argent_poche_by_sfp_maxou";

if((player getVariable "mon_argent_poche_by_sfp_maxou") >= le_prix_de_larticle) then
{
	if (isnil "jaidemanderunepiqure") then {jaidemanderunepiqure = 0;};
	if (jaidemanderunepiqure == 0) then
	{
		if ((damage player)>0.01) then
		{
			player setVariable ['mon_argent_poche_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			jaidemanderunepiqure = 1;
			hint "Ne bouge plus mon petit, je t'osculte ...";
			sleep (4 + (random 12));
			hint "Une petite plaie, rien de grave. Je te soigne ca ;)";
			sleep (4 + (random 12));
			player setdamage 0;			
			hint "Voila, c'est nettoyé et refermé ! Tu peux maintenant partir.";
			sleep 8;
			hint format['Vous vous êtes fait consulté pour %1 Euros ! Il vous reste %2 Euros !',le_prix_de_larticle,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
			jaidemanderunepiqure = 0;
			sleep (100 + (random 100));
			le_nom_de_larticle = "votre consultation chez le medecin";
			le_prix_de_larticle = 50;
			if ((player getVariable "ma_mutuelle_niveau_10_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 10;};
			if ((player getVariable "ma_mutuelle_niveau_vingt_cinq_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 25;}; 
			if ((player getVariable "ma_mutuelle_niveau_cinquante_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 50;};
			if ((player getVariable "ma_mutuelle_niveau_soixante_quinze_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle / 100; taux_de_remboursement_mutuelle = taux_de_remboursement_mutuelle * 75;}; 
			if ((player getVariable "ma_mutuelle_niveau_cent_pour_cent") >= 1) then {taux_de_remboursement_mutuelle = le_prix_de_larticle;}; 
			if (!(isnil "taux_de_remboursement_mutuelle")) then {player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') + taux_de_remboursement_mutuelle,true]; autorisation_mouvement_argent = true;};
			if (!(isnil "taux_de_remboursement_mutuelle")) then {hint format ["! MUTUELLE ! \n -------------------------------------------- \n \n Bonjour, \n\n Vous venez d'être remboursé de %1 Euros concernant %2 dernièrement. \n\n La mutuelle vous à versée directement cet argent sur votre compte bancaire. \n\n Cordialement  \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",taux_de_remboursement_mutuelle,le_nom_de_larticle];taux_de_remboursement_mutuelle = nil;};	
		}else
		{
			hint "Vous êtes déja en pleine forme ;) \n\n Si tu souhaites quand même une petite piqure alors selectionne UNE PETITE PIQURE QUAND MEME dans le menu de la roulette :D";
			medecinfaismoimal = player addaction ["Une petite piqure quand même !", "menu\medecinfaismoimal.sqf", [], 1, false, true, "", "player distance cursortarget < 4"];
		};
	}else
	{
		hint "Attends que la piqure finisse son effet avant de reconsulter !";
	};
}else 
{
	hint "Vous n'avez pas d'argent en poche ! Revenez avec 50 euros.";
};

	