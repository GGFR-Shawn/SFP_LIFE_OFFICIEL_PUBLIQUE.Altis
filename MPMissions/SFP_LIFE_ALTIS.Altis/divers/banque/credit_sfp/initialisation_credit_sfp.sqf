// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2; !isnil "fin_verification_apres_chargement"};

if (!isnil "credit_sfp_activation") exitwith {};
if (isnil "credit_sfp_sauvegarde") then {credit_sfp_sauvegarde = [0,0,"date_souscription"];}; // Montant demandé, mensualité, date souscription
credit_sfp_activation = true;

while {count credit_sfp_sauvegarde >= 3 && credit_sfp_sauvegarde select 0 > 0} do
{
	sleep (sfp_config_reglage_credit_sfp select 1);
	
	if (credit_sfp_sauvegarde select 0 > 0) then
	{	
		_montant_demande = credit_sfp_sauvegarde select 0;
		_mensualite = credit_sfp_sauvegarde select 1;
		_date_souscription = credit_sfp_sauvegarde select 2;
		if (isnil "_montant_demande" or isnil "_mensualite" or isnil "_date_souscription") exitwith {hint "Erreur crédit SFP ! Contact maxou !";};
		
		_calcul_a_appliquer = round (_montant_demande - _mensualite);
		credit_sfp_sauvegarde = [_calcul_a_appliquer, _mensualite, _date_souscription];
		[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "credit_sfp_sauvegarde", credit_sfp_sauvegarde] call fn_SaveToServer;
		player setvariable ["mon_argent_banque_by_sfp_maxou", ((player getvariable "mon_argent_banque_by_sfp_maxou") - (credit_sfp_sauvegarde select 1)), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 
 
		["Credit_SFP", [format["Votre mensualité de <t color='#0FC702'>%1</t> € vient d'etre prélevé.", (credit_sfp_sauvegarde select 1) call retour_formatage_chiffre_sfp, (credit_sfp_sauvegarde select 0) call retour_formatage_chiffre_sfp,"€"]]] call bis_fnc_showNotification;
	};
};

credit_sfp_activation = nil;