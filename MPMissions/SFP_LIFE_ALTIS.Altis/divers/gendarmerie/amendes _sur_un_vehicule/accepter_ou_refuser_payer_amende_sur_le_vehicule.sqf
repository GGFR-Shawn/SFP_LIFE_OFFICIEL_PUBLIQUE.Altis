// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_choix_amende_sfp_maxou","_mon_vehicule","_message_a_afficher"];
_choix_amende_sfp_maxou = _this select 0;
_mon_vehicule = vehicle player;
_message_a_afficher = "";
if (isnil "_choix_amende_sfp_maxou") exitwith {hint "Erreur sur le choix, recommence ...";};

switch _choix_amende_sfp_maxou do
{
	case 0 :
	{
		player setVariable ['mon_argent_banque_by_sfp_maxou', (player getvariable "mon_argent_banque_by_sfp_maxou") - (_mon_vehicule getvariable "amende_vehicule" select 0),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format ["! AMENDE VEHICULE ! \n ------------------------------------- \n\n Bonjour %1, \n\n L'amende d'un montant de %2 Euros à bien été payé. \n\n Merci pour votre compréhension. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name player, (_mon_vehicule getvariable "amende_vehicule" select 0) call retour_formatage_chiffre_sfp];

		_message_a_afficher = "accepter";
	};
	case 1 :
	{
		hint format ["! AMENDE VEHICULE ! \n ------------------------------------- \n\n Bonjour %1, \n\n L'amende d'un montant de %2 Euros à été refusé. \n\n Ce refus à été inscrit sur votre casier judiciaire ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name player, (_mon_vehicule getvariable "amende_vehicule" select 0) call retour_formatage_chiffre_sfp];

		_message_a_afficher = "refuse";
		
		if (isnil {player getvariable "infraction_wanted_liste"}) then {player setvariable ["infraction_wanted_liste",[],true];};
		if (count (player getvariable "infraction_wanted_liste") >= 6) exitwith {hint "Casier judiciaire plein ...";};

		_heure_du_delit = format ["%1/%2/%3",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0];
		_info_une = "Amende VEH";
		_info_deux = format ["%1 %2 non payée.", (_mon_vehicule getvariable "amende_vehicule" select 0) call retour_formatage_chiffre_sfp, "€"];
		_inscription_personnalise = format ["%1 %2 : %3",_heure_du_delit,_info_une,_info_deux];
		_ecriture_infraction = player getvariable 'infraction_wanted_liste';
		_ecriture_infraction = _ecriture_infraction + [_inscription_personnalise];
		player setvariable ["infraction_wanted_liste",_ecriture_infraction,true];
	};
};

_heure_du_message = format ["%1/%2/%3 à %4H%5Min (Arma : %6) :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_message = format ["%1 a %2 l amende de %3 euros sur son vehicule adresser par %4).",name player, _message_a_afficher, (_mon_vehicule getvariable "amende_vehicule" select 0) call retour_formatage_chiffre_sfp, _mon_vehicule getvariable "amende_vehicule" select 1];
["Historique Amende Sur Un Vehicule", "Historique Amende Sur Un Vehicule", _heure_du_message, _detail_du_message] call fn_SaveToServer;

(vehicle player) setvariable ["amende_vehicule",nil,true];

closedialog 0;
