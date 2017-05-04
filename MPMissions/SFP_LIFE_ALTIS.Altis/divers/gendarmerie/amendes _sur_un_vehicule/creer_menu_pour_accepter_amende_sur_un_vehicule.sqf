// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

cutText["","BLACK FADED"];

_nom_du_menu = "Menu_Amende_A_Accepter_Sur_Un_Vehicule";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Titre principal
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetText format ["Amende de %1 Euros sur votre véhicule",(vehicle player getvariable "amende_vehicule" select 0) call retour_formatage_chiffre_sfp];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetTextColor _couleur_rouge;

// Description
_description = "
					Gendarmerie National Bonjour,
					<br/>
					<br/>
					Une amende à été apposée sur votre véhicule pour x raisons.
					<br/>
					<br/>
					Son montant est indiqué dans l'entete du message.
					<br/>
					<br/>
					En cas de contestation contactez la gendarmerie.
					<br/>
					<br/>
					Bonne journée quand même ! ;)
				";				
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetStructuredText parseText _description;

while {!isnull (findDisplay 200000)} do
{
	cutText["","BLACK FADED"];
	sleep 0.0001;
};
cutText["","BLACK IN"];