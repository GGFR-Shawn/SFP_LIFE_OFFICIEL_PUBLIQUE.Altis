// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

	

if (((player getVariable "jesuisalleralamissiondemonpatron") <= 0)) then
{
	jepeuxchoisiruntravail = 0;
	_fraisdelicensiement = (200 + (random 1500));

	["Clock",["TON PATRON","Ton patron ta viré puisque tu n'as pas été travaillé !"]] call bis_fnc_showNotification;

	player setVariable["mes_aides_caf", 0,false];
	player setVariable["ma_paye_by_sfp_maxou", 0,false];
	player setVariable ["mon_argent_banque_by_sfp_maxou", (player getVariable "mon_argent_banque_by_sfp_maxou") - _fraisdelicensiement,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

	deleteMarkerLocal "missionelectricien";
	player removeAction menumissioncreerlampadaireelectricien;
	
	hint format ["! TRAVAIL ! \n -------------------------------------------- \n \n Ton patron ta viré puisque tu n'as pas été travaillé ! \n\n Des frais de %1 Euros ont été appliqués à cause de la perte d'argent qu'a subit ton patron ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_fraisdelicensiement];	
};