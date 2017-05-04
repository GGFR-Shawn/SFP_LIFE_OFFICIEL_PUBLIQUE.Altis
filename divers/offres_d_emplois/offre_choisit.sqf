// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (descriptiondeloffre_une_choisit == "La société SARL DIR recherche des dépanneurs, consultez les :") exitwith {hint "Comme précisé, il faut que tu les contactent directement ;)";};
if (descriptiondeloffre_une_choisit == "La SARL AUTOECOLE recrute des moniteurs, consultez les :") exitwith {hint "Comme précisé, il faut que tu les contactent directement ;)";};
if (descriptiondeloffre_une_choisit == "Sarl Avocat recrute des avocats, consulte la :") exitwith {hint "Comme précisé, il faut que tu la contacte directement ;)";};
if (descriptiondeloffre_une_choisit == "Livreur de journaux :") exitwith {hint "Comme précisé, il faut que tu te rendes sur les PNJ : Livrer journaux ;)";};
if (descriptiondeloffre_une_choisit == "Livreur de carburant :") exitwith {hint "Comme précisé, il faut que tu te rendes sur les PNJ : Livrer gasoil ;)";};


if (formation_valide == "BAC PRO" && player getvariable "license_BAC_PRO" <= 0) exitwith {hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Tu ne peux choisir ce travail car tu n'as pas de BAC PRO ... \n\n Rends toi à l'école pour l'obtenir ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";};
if (formation_valide == "BTS" && player getvariable "license_BTS" <= 0) exitwith {hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Tu ne peux choisir ce travail car tu n'as pas de BTS ... \n\n Rends toi à l'école pour l'obtenir ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";};
if (formation_valide == "BEPC" && player getvariable "license_BEPC" <= 0) exitwith {hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Tu ne peux choisir ce travail car tu n'as pas de BEPC ... \n\n Rends toi à l'école pour l'obtenir ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";};
if (formation_valide == "BAC GENERAL" && player getvariable "license_BAC_GENERAL" <= 0) exitwith {hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Tu ne peux choisir ce travail car tu n'as pas de BAC GENERAL ... \n\n Rends toi à l'école pour l'obtenir ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";};
if (formation_valide == "DEUG" && player getvariable "license_DEUG" <= 0) exitwith {hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Tu ne peux choisir ce travail car tu n'as pas de DEUG ... \n\n Rends toi à l'école pour l'obtenir ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";};

if (isnil "jepeuxchoisiruntravail") then {jepeuxchoisiruntravail = 0;};
if (jepeuxchoisiruntravail == 0) then
{
	jepeuxchoisiruntravail = 1;
	player setVariable["ma_paye_by_sfp_maxou", salaire,false];
	
	if (deplacement_valide == "Oui") then {savoirsijevaismedeplacer = "Vos missions seront dans différentes villes."}else {savoirsijevaismedeplacer = "Vous n'aurez pas vos missions dans différentes villes.";};
	hint format ["! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Nous vous confirmons l'acception de l'offre numéro %1, concernant le travail sur la ville de %2. \n\n %5 \n\n Votre salaire est maintenant de %3 Euros. \n\n Vous avez également signé un contract d'un %4. \n\n Vous recevrez bientôt les missions de votre premier boulot ! \n\n Attention, il est valable uniquement jusqu'a votre déconnection ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ",randomoffre,nomdusecteur_valide,salaire,typeoffre_valide,savoirsijevaismedeplacer];

	if (descriptiondeloffre_une_choisit == "Electricien, vous vous occuperez de l'installation de lampadaire sur Altis.") then {execvm "divers\offres_d_emplois\metiers_pour_missions\electricien\demarrer_mission_electricien.sqf";};	
	if (descriptiondeloffre_une_choisit == "Vous vous occuperez de tondre la pelouse sur Altis.") then {execvm "divers\offres_d_emplois\metiers_pour_missions\tondre_pelouse\demarrer_mission_tondre_pelouse.sqf";};	
}else
{
	hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Désolé, tu as déja un travail ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";
};

