// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (player getvariable "temps_fatigue_niveau_2" < 1) exitwith
{
	hint "Vous possedez actuellement le niveau 1/5."; 
	sleep 2;
	execvm "divers\centre_sportif\fatigue\entrainement_fatigue_niveau_2.sqf";
};

if (player getvariable "temps_fatigue_niveau_3" < 1) exitwith
{
	hint "Vous possedez actuellement le niveau 2/5."; 
	sleep 2;
	execvm "divers\centre_sportif\fatigue\entrainement_fatigue_niveau_3.sqf";
};

if (player getvariable "temps_fatigue_niveau_4" < 1) exitwith
{
	hint "Vous possedez actuellement le niveau 3/5."; 
	sleep 2;
	execvm "divers\centre_sportif\fatigue\entrainement_fatigue_niveau_4.sqf";
};

if (player getvariable "temps_fatigue_niveau_5" < 1) exitwith
{
	hint "Vous possedez actuellement le niveau 4/5."; 
	sleep 2;
	execvm "divers\centre_sportif\fatigue\entrainement_fatigue_niveau_5.sqf";
};

if (player getvariable "temps_fatigue_niveau_5" >= 1) exitwith
{
	hint "Vous possedez actuellement le niveau maximum d'endurance ..."; 
};

