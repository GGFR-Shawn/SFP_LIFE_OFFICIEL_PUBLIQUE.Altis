// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "typeoffre_valide") exitwith {hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Désolé, vous n'avez pas de travail ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";};
if (isnil "jepeuxchoisiruntravail") exitwith {hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Désolé, vous n'avez pas de travail ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";};

if (jepeuxchoisiruntravail == 1) then
{
	hint format ["! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Vous travaillez actuellement sur la ville de %2. \n\n %5 \n\n Votre salaire est de %3 Euros. \n\n Vous avez également signé un contrat d'un %4. \n\n Attention, il est valable uniquement jusqu'a votre déconnection ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ",randomoffre,nomdusecteur_valide,salaire,typeoffre_valide,savoirsijevaismedeplacer];
}else
{
	hint "! ALTIS LIFE EMPLOI ! \n------------------------------------------------------\n Désolé, vous n'avez pas de travail ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr ";
};