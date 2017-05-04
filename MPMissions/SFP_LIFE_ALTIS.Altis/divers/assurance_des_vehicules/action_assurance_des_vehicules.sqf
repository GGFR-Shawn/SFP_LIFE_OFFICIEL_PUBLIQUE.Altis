// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_valeur_du_switch = _this select 0;
_valeur_a_modifier = round ((_this select 1 select 1) );
if (isnil "_valeur_du_switch" or isnil "_valeur_a_modifier") exitwith {hint "Erreur, recommence ...";};

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

switch _valeur_du_switch do
{
	// Montant
	case 0 :
	{
		montant_souhaite_remboursement_assurance_sfp_maxou = _valeur_a_modifier;
		montant_a_payer_assurance_sfp_maxou = round ((montant_souhaite_remboursement_assurance_sfp_maxou / 100) * sfp_config_pourcentage_pour_calcul_prix_assurance_sfp);
		
		hintSilent parseText format ["! ASSUR'SFP ! <br/> ------------------------------------- <br/><br/> Voici les informations d'assurance que vous souhaitez : <br/><br/> Remboursement voulu : <t color='#00D611'>%1</t> €. <br/> Montant à payer : <t color='#00D611'>%2</t> €. <br/><br/> Argent actuel : <t color='#00D611'>%3</t> €. <br/> Argent après : <t color='#00D611'>%4</t> €.  <br/><br/> Attention, tout est enregistré informatiquement ... <br/><br/> Les arnaqueurs à l'assurance se verront banni du serveur ! <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", (montant_souhaite_remboursement_assurance_sfp_maxou) call retour_formatage_chiffre_sfp, (montant_a_payer_assurance_sfp_maxou) call retour_formatage_chiffre_sfp, (player getvariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp, round ((player getvariable "mon_argent_banque_by_sfp_maxou") - (montant_a_payer_assurance_sfp_maxou)) call retour_formatage_chiffre_sfp];		
	};
	// Valider les choix
	case 1 :
	{				
		if (montant_a_payer_assurance_sfp_maxou < 1 or montant_souhaite_remboursement_assurance_sfp_maxou < 1) exitwith {hint "! ASSUR'SFP ! \n ------------------------------------- \n\n Désolé, \n\n Vous n'avez pas selectionné d'assurance. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
		
		player setvariable ["mon_argent_banque_by_sfp_maxou", (player getvariable "mon_argent_banque_by_sfp_maxou") - (montant_a_payer_assurance_sfp_maxou), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 
		le_vehicule_a_assurer_sfp setvariable ["voiture_possede_une_assurance", montant_souhaite_remboursement_assurance_sfp_maxou, false];
		[le_vehicule_a_assurer_sfp] execvm "divers\assurance_des_vehicules\attente_destruction_vehicule_assure.sqf";
		
		hintSilent parseText format ["! ASSUR'SFP ! <br/> ------------------------------------- <br/><br/> Voici les informations d'assurance que vous avez souscrit : <br/><br/> Montant du remboursement : <t color='#00D611'>%1</t> €. <br/> Montant payé : <t color='#00D611'>%2</t> €. <br/><br/> Bonne route avec ASSUR'SFP ! <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", (montant_souhaite_remboursement_assurance_sfp_maxou) call retour_formatage_chiffre_sfp, (montant_a_payer_assurance_sfp_maxou) call retour_formatage_chiffre_sfp];		
		
		closedialog 0;
		
		_heure_du_message = format ["%1/%2/%3 à %4H%5Min (Arma : %6) :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_du_message = format ["%1 a souscrit une assurance sur : %2 -- Plaque %3 -- Montant %4.",name player, typeof le_vehicule_a_assurer_sfp, le_vehicule_a_assurer_sfp getvariable "plaque_immatriculation_news" select 0, (montant_a_payer_assurance_sfp_maxou) call retour_formatage_chiffre_sfp];
		["Historique Assurance Souscription", "Historique Assurance Souscription", _heure_du_message, _detail_du_message] call fn_SaveToServer;
	};
};

((uiNamespace getVariable "Menu_Assurance_Des_Vehicules") displayCtrl 1007) ctrlSetText format ["Le montant à payer pour assurer votre véhicule est actuellement de %1 Euros. (A payer en une seul fois).", (round (montant_a_payer_assurance_sfp_maxou)) call retour_formatage_chiffre_sfp,"€"];
((uiNamespace getVariable "Menu_Assurance_Des_Vehicules") displayCtrl 1007) ctrlSetTextColor _couleur_verte;
