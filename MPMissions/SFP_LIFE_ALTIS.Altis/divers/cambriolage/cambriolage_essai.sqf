// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_tempspourcambrioler","_nombredeflic","_type_de_maisons"];
_tempspourcambrioler = round (300 + (random 600));
_nombredeflic = 0;
_type_de_maisons = ["Land_House_Small_03_F","Land_House_Small_04_F","Land_House_Small_05_F"];

if (isnil "je_veux_cambrioler") exitwith {hint "Patiente, le serveur vient de démarrer ... \n Réessai plus tard !";};
{if (side _x == west) then {_nombredeflic = _nombredeflic + 1;};} foreach playableUnits; 
if (_nombredeflic < 1) exitwith {hint "Désolé, il n'y a pas assez de gendarmes pour une tentative de cambriolage !";}; 
if (player getvariable "pied_de_biche" < 1) exitwith {hint "Désolé, il te faut un pied de biche pour cambrioler cette maison !";};

if (je_veux_cambrioler < 1) then
{
	je_veux_cambrioler = 1;
	publicvariable "je_veux_cambrioler";
	publicvariable "je_veux_cambrioler_activation_headless";
	
	if ((round (random 1)) == 1) then
	{
		player setVariable["jai_fait_un_cambriolage_news",true,true];
		
		hint "! CAMBRIOLAGE ! \n -------------------------------------------- \n \n Le cambriolage est bien autorisé ... \n\n Il te suffit de rentrer maintenant dans la maison et de patienter jusqu'à la fin du chrono sans y sortir. \n\n Une fois le chrono terminé, tu auras peut etre divers objets et de l'argent ! \n\n Sache que la gendarmerie n'est pas tout le temps avertie ! Tu as donc deux choix : \n\n 1) Fuir ... \n 2) Les confronter si ils sont au courant ... \n\n A toi de voir ... \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
		
		waituntil {sleep 1; count (nearestObjects [player, _type_de_maisons , 6]) >= 1};
		
		hint "! CAMBRIOLAGE ! \n -------------------------------------------- \n \n Le cambriolage va maintenant commencer ... \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

		if ((round (random 2)) == 1) then
		{
			[[[position player],"divers\cambriolage\avertir_gendarme_cambriolage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		};
		
		while {(count (nearestObjects [player, _type_de_maisons , 6]) >= 1) && alive player && _tempspourcambrioler >= 0} do
		{
			cutText [format["\n\n\n Le cambriolage se termine dans %1 secondes ... \n Reste dans la maison pour continuer le cambriolage. \n Si tu sors, le cambriolage s'annulera !",_tempspourcambrioler], "PLAIN DOWN"];
			sleep 1;
			_tempspourcambrioler = _tempspourcambrioler - 1;
		};
		
		if (_tempspourcambrioler > 0) exitwith {cutText [format["\n\n\n\n\n Le cambriolage est annulé puisque tu es parti de la maison ..."], "PLAIN DOWN"]; hint "! CAMBRIOLAGE ! \n -------------------------------------------- \n \n Le cambriolage est annulé puisque tu es parti de la maison ... \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
		
		execvm "divers\cambriolage\listes_des_objets_du_cambriolage.sqf";	
		execvm "divers\cambriolage\enlever_alerte_cambriolage_apres_temps.sqf";	
	}else
	{
		hint "! CAMBRIOLAGE ! \n -------------------------------------------- \n \n Le cambriolage ta été refusé pour plusieurs raisons, soit : \n\n 1) Des locataires sont dans la maison ... \n 2) Tu n'as pas réussi à ouvrir la porte ... \n 3) Pour autres choses ... \n\n Réessai plus tard.\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	};
}else
{
		hint "! CAMBRIOLAGE ! \n -------------------------------------------- \n \n Désolé, un cambriolage à déjà eu lieu il y a peu ... Recommence plus tard.\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
};