// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};

while {true} do
{
	sleep 600;	
	if ((player getVariable "ma_paye_by_sfp_maxou") > 0) then 
	{
		if ((player getVariable "ma_paye_by_sfp_maxou") > 0) then {["Clock",["Paye", "Vous allez recevoir votre paye dans 5 minutes."]] call bis_fnc_showNotification;};
		sleep 300;
		if ((player getVariable "ma_paye_by_sfp_maxou") > 0) then {["PayCheck", [ format["Paye d'un montant de %1 Euros reçu !",(player getVariable "ma_paye_by_sfp_maxou")] ] ] call bis_fnc_showNotification;};
		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') + (player getVariable 'ma_paye_by_sfp_maxou'),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	}else
	{
		if ((player getVariable "ma_paye_by_sfp_maxou") <= 0) then {["Clock",["Paye", "Vous n'avez pas de paye car pas de travail."]] call bis_fnc_showNotification;};
	};
};