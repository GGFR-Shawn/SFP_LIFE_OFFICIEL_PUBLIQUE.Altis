// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};

while {true} do
{
	sleep 620;
	
	if ((player getVariable "mes_aides_caf") > 0) then 
	{
		if ((player getVariable "mes_aides_caf") > 0) then 
		{
			["Clock",["CAF", "Vous allez recevoir votre RSA dans 5 minutes."]] call bis_fnc_showNotification;
		};
		
		sleep 300;
		
		if ((player getVariable "mes_aides_caf") > 0) then 
		{
			["PayCheck", [ format["Vous avez reçu votre RSA d'un montant de %1 !",(player getVariable "mes_aides_caf")]]] call bis_fnc_showNotification;
		};
		
		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') + (player getVariable 'mes_aides_caf'),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	}else
	{
		if (isnil "jeviensdefairemademande") then {jeviensdefairemademande = 0;};
		if (jeviensdefairemademande == 1) then {waituntil {sleep 0.2; jeviensdefairemademande < 1};};
		
		if (((player getVariable "mes_aides_caf") <= 0) && ((player getVariable "ma_paye_by_sfp_maxou") > 0)) then {["Clock",["CAF", "Vous n'avez pas de RSA car vous travaillez."]] call bis_fnc_showNotification;};
		if (((player getVariable "mes_aides_caf") <= 0) && (isnil "tempsattentedesaides") && ((player getVariable "ma_paye_by_sfp_maxou") < 0)) then {["Clock",["CAF", "Vous n'avez pas de RSA faite votre demande."]] call bis_fnc_showNotification;};
		if (!isnil "tempsattentedesaides") then {if (((player getVariable "mes_aides_caf") <= 0) && (tempsattentedesaides == 0)) then {["Clock",["CAF", "Vous n'avez pas de RSA faite votre demande."]] call bis_fnc_showNotification;};};
		if (!isnil "tempsattentedesaides") then {if (((player getVariable "mes_aides_caf") <= 0) && (tempsattentedesaides == 1)) then {["Clock",["CAF", "Vous n'avez pas le droit au RSA."]] call bis_fnc_showNotification;};};
	};
};