// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2;!isnil "fin_verification_apres_chargement"};

execvm "divers\gendarmerie\prison\systeme_de_prisonnier_quand_evade\protection_habit_evade_de_prison.sqf";
execvm "divers\gendarmerie\prison\systeme_de_prisonnier_quand_evade\attendre_mouvement_argent_prisonnier_pour_avertir_les_joueurs.sqf";

while {player getvariable "evade_de_prison" > 0} do
{
	sleep 60;
	
	player setVariable["evade_de_prison",(player getvariable "evade_de_prison") - 1,true];
	
	if (isnil "j_ai_ete_avertit_du_systeme_de_prisonnier") then 
	{
		j_ai_ete_avertit_du_systeme_de_prisonnier = 1;
		titletext ["N'oublie pas que tu t'es echappé de prison il y à peu ... \n\n Tu ne peux donc pas te nourrir seul, acheter des véhicules seul, etc sans risque de te faire voir ... \n\n Joue en équipe pour mieux t'en sortir ;)","PLAIN DOWN"];
	}; 
};