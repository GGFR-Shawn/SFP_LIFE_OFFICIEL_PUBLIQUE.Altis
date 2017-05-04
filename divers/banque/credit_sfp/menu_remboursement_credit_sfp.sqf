// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

credit_sfp_sauvegarde_temporaire_validation = nil;
credit_sfp_sauvegarde_temporaire_sauvegarde = credit_sfp_sauvegarde;

cutText["","BLACK FADED"];

_nom_du_menu = "Remboursement_Menu_Credit_SFP";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Titre principal
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetText "Demande de remboursement crédit SFP";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetTextColor _couleur_rouge;

// Description
_description = format ["
						Bonjour et bienvenu au crédit SFP,
						<br/>
						<br/>
						Voici actuellement votre crédit :
						<br/>
						Date de souscription : <t color='#00E811'>%1</t>.
						<br/>
						Montant restant : <t color='#00E811'>%2</t> €.
						<br/>
						Mensualité : <t color='#00E811'>%3</t> €.
						<br/>
						<br/>
						A bientot ! ;)
					   ",
					   credit_sfp_sauvegarde select 2,
					   (credit_sfp_sauvegarde select 0) call retour_formatage_chiffre_sfp,
					   (credit_sfp_sauvegarde select 1) call retour_formatage_chiffre_sfp
					  ];				
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetStructuredText parseText _description;

// Crédit restant
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) ctrlSetText format ["%1 Euros.", (credit_sfp_sauvegarde select 0) call retour_formatage_chiffre_sfp];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) ctrlSetTextColor _couleur_verte;
if (credit_sfp_sauvegarde select 0 > 0) then{((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) ctrlSetTextColor _couleur_rouge;};

// Montant souhaite remboursement
sliderSetRange [1900, credit_sfp_sauvegarde select 0, credit_sfp_sauvegarde select 0];
sliderSetSpeed [1900, 5000, 5000];
sliderSetPosition [1900, credit_sfp_sauvegarde select 0];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetText format ["%1 %2", (round (credit_sfp_sauvegarde select 0)) call retour_formatage_chiffre_sfp,"€"];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetTextColor _couleur_verte;

while {!isnull (findDisplay 200000)} do
{
	cutText["","BLACK FADED"];
	sleep 0.0001;
};
cutText["","BLACK IN"];

if (isnil "credit_sfp_sauvegarde_temporaire_validation") then
{
	credit_sfp_sauvegarde = credit_sfp_sauvegarde_temporaire_sauvegarde;
	hintSilent "! SFP CREDIT ! \n ------------------------------------- \n\n Votre demande de remboursement à bien été annulée. \n\n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";
};
