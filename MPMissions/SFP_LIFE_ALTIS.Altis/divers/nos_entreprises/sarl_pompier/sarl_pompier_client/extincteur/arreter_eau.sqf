//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if (je_peux_deployer_l_extincteur >= 1) then
{
	menu_deployer_extincteur = nil;
	je_peux_deployer_l_extincteur = 0;
	sleep 2;
	deletevehicle extincteur;
	menu_deployer_extincteur = 0;
};
