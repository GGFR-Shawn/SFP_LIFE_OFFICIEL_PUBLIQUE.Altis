// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_calcul_montant_impot";
waituntil {!isnil "fin_verification_apres_chargement"};

sleep 200;

while {sfp_config_activer_impots select 0} do
{	
	sleep (sfp_config_activer_impots select 2);
	
	if ((player getVariable "ma_paye_by_sfp_maxou") > 0) then 
	{
		["Clock",["IMPOTS EN APPROCHE", "Vous allez recevoir votre avis d'imposition dans 10 minutes."]] call bis_fnc_showNotification;
		
		_calcul_montant_impot = (((player getVariable "ma_paye_by_sfp_maxou") / 100) * (sfp_config_activer_impots select 1));
		
		["PayCheck", [format["Le montant de votre impot s'élève à %1 euros !", _calcul_montant_impot]]] call bis_fnc_showNotification;
		
		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - (_calcul_montant_impot),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	}else
	{
		if ((player getVariable "mes_aides_caf") > 0) then 
		{
			["Clock",["IMPOTS", "Vous êtes exonerer d'impot grace au RSA."]] call bis_fnc_showNotification;
		}else
		{
			["Clock",["IMPOTS", "Vous ne payez pas d'impot puisque pas de travail."]] call bis_fnc_showNotification;
		};
	};
};
