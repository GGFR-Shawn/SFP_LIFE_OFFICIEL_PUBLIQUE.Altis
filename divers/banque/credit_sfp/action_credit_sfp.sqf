// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_valeur_du_switch = _this select 0;
_valeur_a_modifier = round (_this select 1 select 1);
if (isnil "_valeur_du_switch" or isnil "_valeur_a_modifier") exitwith {hint "Erreur, recommence ...";};

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

switch _valeur_du_switch do
{
	// Montant
	case 0 :
	{
		// Slider mensualité ce régle suivant le montant demandé
		slidersetRange [1901,round (_valeur_a_modifier / (sfp_config_reglage_credit_sfp select 2)),_valeur_a_modifier];
		sliderSetPosition[1901, round (_valeur_a_modifier / (sfp_config_reglage_credit_sfp select 2))];
		((uiNamespace getVariable "Menu_Credit_SFP") displayCtrl 1010) ctrlSetText format ["%1 %2", (round (_valeur_a_modifier / (sfp_config_reglage_credit_sfp select 2))) call retour_formatage_chiffre_sfp,"€"];
		
		credit_sfp_sauvegarde = [_valeur_a_modifier, round (_valeur_a_modifier / (sfp_config_reglage_credit_sfp select 2)), credit_sfp_sauvegarde select 2];
		hintSilent parseText format ["! SFP CREDIT ! <br/> ------------------------------------- <br/><br/> Voici les valeurs que vous avez choisit : <br/><br/> Montant souhaité : <t color='#00D611'>%1</t> €. <br/> Mensualité souhaité : <t color='#00D611'>%2</t> €.  <br/><br/> Argent actuel : <t color='#00D611'>%3</t> €. <br/> Argent après : <t color='#00D611'>%4</t> €.  <br/><br/> La mensualité de <t color='#00D611'>%2</t> € vous sera prélevé toutes les <t color='#00D611'>%5</t> secondes (%6 minutes).   <br/><br/> Bon crédit. <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", (credit_sfp_sauvegarde select 0) call retour_formatage_chiffre_sfp, (credit_sfp_sauvegarde select 1) call retour_formatage_chiffre_sfp, (player getvariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp, round ((player getvariable "mon_argent_banque_by_sfp_maxou") + (credit_sfp_sauvegarde select 0)) call retour_formatage_chiffre_sfp, sfp_config_reglage_credit_sfp select 1, round ((sfp_config_reglage_credit_sfp select 1) / 60)];
	};
	// Mensualités
	case 1 :
	{
		credit_sfp_sauvegarde = [credit_sfp_sauvegarde select 0, _valeur_a_modifier, credit_sfp_sauvegarde select 2];
		hintSilent parseText format ["! SFP CREDIT ! <br/> ------------------------------------- <br/><br/> Voici les valeurs que vous avez choisit : <br/><br/> Montant souhaité : <t color='#00D611'>%1</t> €. <br/> Mensualité souhaité : <t color='#00D611'>%2</t> €.  <br/><br/> Argent actuel : <t color='#00D611'>%3</t> €. <br/> Argent après : <t color='#00D611'>%4</t> €.  <br/><br/> La mensualité de <t color='#00D611'>%2</t> € vous sera prélevé toutes les <t color='#00D611'>%5</t> secondes (%6 minutes).   <br/><br/> Bon crédit. <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", (credit_sfp_sauvegarde select 0) call retour_formatage_chiffre_sfp, (credit_sfp_sauvegarde select 1) call retour_formatage_chiffre_sfp, (player getvariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp, round ((player getvariable "mon_argent_banque_by_sfp_maxou") + (credit_sfp_sauvegarde select 0)) call retour_formatage_chiffre_sfp, sfp_config_reglage_credit_sfp select 1, round ((sfp_config_reglage_credit_sfp select 1) / 60)];
		
		((uiNamespace getVariable "Menu_Credit_SFP") displayCtrl 1010) ctrlSetText format ["%1 %2", _valeur_a_modifier call retour_formatage_chiffre_sfp,"€"];
	};
	// Valider les choix
	case 2 :
	{	
		if (credit_sfp_sauvegarde select 0 < 1) exitwith {hintSilent "! SFP CREDIT ! \n ------------------------------------- \n\n Désolé, 0 n'est pas possible ! \n\n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		
		_mon_argent = round (player getvariable "mon_argent_banque_by_sfp_maxou");
		_date_souscription = format ["%1/%2/%3",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0];
		
		hintSilent parseText format ["! SFP CREDIT ! <br/> ------------------------------------- <br/><br/> Votre crédit à bien été accepté, en voici les détails : <br/><br/> Montant souhaité : <t color='#00D611'>%1</t> €. <br/> Mensualité souhaité : <t color='#00D611'>%2</t> €.  <br/><br/> Argent avant : <t color='#00D611'>%3</t> €. <br/> Argent après : <t color='#00D611'>%4</t> €.  <br/><br/> Bon crédit. <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", (credit_sfp_sauvegarde select 0) call retour_formatage_chiffre_sfp, (credit_sfp_sauvegarde select 1) call retour_formatage_chiffre_sfp, (player getvariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp, round ((player getvariable "mon_argent_banque_by_sfp_maxou") + (credit_sfp_sauvegarde select 0)) call retour_formatage_chiffre_sfp];
		
		credit_sfp_sauvegarde = [credit_sfp_sauvegarde select 0, credit_sfp_sauvegarde select 1, _date_souscription];
		
		[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "credit_sfp_sauvegarde", credit_sfp_sauvegarde] call fn_SaveToServer;
		player setvariable ["mon_argent_banque_by_sfp_maxou", ((_mon_argent) + (credit_sfp_sauvegarde select 0)), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 
			
		credit_sfp_sauvegarde_temporaire_validation = true;
		
		_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_du_log = format ["%1 a valide un credit de %2 Euros.", name player, (credit_sfp_sauvegarde select 0)];
		["Historique Credit SFP", "Historique Credit SFP", _heure_du_log, _detail_du_log] call fn_SaveToServer;
		
		closedialog 0;
	};
};

((uiNamespace getVariable "Menu_Credit_SFP") displayCtrl 1009) ctrlSetText format ["%1 %2", (round (credit_sfp_sauvegarde select 0)) call retour_formatage_chiffre_sfp,"€"];
((uiNamespace getVariable "Menu_Credit_SFP") displayCtrl 1009) ctrlSetTextColor _couleur_verte;