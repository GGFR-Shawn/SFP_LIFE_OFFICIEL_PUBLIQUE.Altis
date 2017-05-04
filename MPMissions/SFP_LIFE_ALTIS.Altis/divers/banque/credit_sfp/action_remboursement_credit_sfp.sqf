// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_valeur_du_switch = _this select 0;
_valeur_a_modifier = credit_sfp_sauvegarde select 0;
if (isnil "_valeur_du_switch" or isnil "_valeur_a_modifier") exitwith {hint "Erreur, recommence ...";};

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

switch _valeur_du_switch do
{
	// Montant
	case 0 :
	{
		// Slider montant remboursement		
		credit_sfp_sauvegarde = [_valeur_a_modifier, credit_sfp_sauvegarde select 1, credit_sfp_sauvegarde select 2];
		hintSilent parseText format ["! SFP CREDIT ! <br/> ------------------------------------- <br/><br/> Voici les valeurs que vous avez choisit : <br/><br/> Remboursement de : <t color='#00D611'>%1</t> €. <br/> Argent actuel : <t color='#00D611'>%2</t> €. <br/> Argent après : <t color='#00D611'>%3</t> €.  <br/><br/> La banque n'accepte pas la modification des contrats, seul le remboursement complet est autorisé. <br/><br/> Bon crédit. <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", (_valeur_a_modifier) call retour_formatage_chiffre_sfp, (player getvariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp, (round ((player getvariable "mon_argent_banque_by_sfp_maxou") - (_valeur_a_modifier))) call retour_formatage_chiffre_sfp];
	};
	// Valider les choix
	case 1 :
	{				
		if (credit_sfp_sauvegarde select 0 < 1) exitwith {hintSilent "! SFP CREDIT ! \n ------------------------------------- \n\n Désolé, 0 n'est pas possible ! \n\n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
		if (((player getvariable "mon_argent_banque_by_sfp_maxou") - (_valeur_a_modifier)) < 0) exitwith {hintSilent "! SFP CREDIT ! \n ------------------------------------- \n\n Désolé, vous n'avez pas assez d'argent pour rembourser votre pret ! \n\n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
				
		hintSilent parseText format ["! SFP CREDIT ! <br/> ------------------------------------- <br/><br/> Le remboursement de votre crédit à été accepté, voici les valeurs que vous avez choisit : <br/><br/> Remboursement de : <t color='#00D611'>%1</t> €. <br/> Argent actuel : <t color='#00D611'>%2</t> €. <br/> Argent après : <t color='#00D611'>%3</t> €.  <br/><br/> Bon crédit. <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", (_valeur_a_modifier) call retour_formatage_chiffre_sfp, (player getvariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp, round ((player getvariable "mon_argent_banque_by_sfp_maxou") - (_valeur_a_modifier)) call retour_formatage_chiffre_sfp];
		
		player setvariable ["mon_argent_banque_by_sfp_maxou", ((player getvariable "mon_argent_banque_by_sfp_maxou") - (_valeur_a_modifier)), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 

		credit_sfp_sauvegarde = [0, 0, "Pas de crédit en cours"];
		[uid_unique_et_side_pour_la_sauvegarde, uid_unique_et_side_pour_la_sauvegarde, "credit_sfp_sauvegarde", credit_sfp_sauvegarde] call fn_SaveToServer;
			
		_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_du_log = format ["%1 a valide un remboursement de %2 Euros.", name player, _valeur_a_modifier];
		["Historique Credit SFP", "Historique Credit SFP", _heure_du_log, _detail_du_log] call fn_SaveToServer;

		credit_sfp_sauvegarde_temporaire_validation = true;
		
		closedialog 0;
	};
};

((uiNamespace getVariable "Remboursement_Menu_Credit_SFP") displayCtrl 1009) ctrlSetText format ["%1 %2", (round (credit_sfp_sauvegarde select 0)) call retour_formatage_chiffre_sfp,"€"];
((uiNamespace getVariable "Remboursement_Menu_Credit_SFP") displayCtrl 1009) ctrlSetTextColor _couleur_verte;