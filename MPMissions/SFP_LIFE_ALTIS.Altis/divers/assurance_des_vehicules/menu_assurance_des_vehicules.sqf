// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =======================================================================================================================================================================================
																  // Réglage && Initialisation //
// =======================================================================================================================================================================================
montant_souhaite_remboursement_assurance_sfp_maxou = 0; // Euros
montant_a_payer_assurance_sfp_maxou = 0; // Euros
le_vehicule_a_assurer_sfp = nil;
// =======================================================================================================================================================================================
																		// Lancement //
// =======================================================================================================================================================================================
le_vehicule_a_assurer_sfp = vehicle player;
if (isnil "le_vehicule_a_assurer_sfp") exitwith {hint "! ASSUR'SFP ! \n ------------------------------------- \n\n Erreur, sur le véhicule ... \n\n Recommence. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if !(isnil {le_vehicule_a_assurer_sfp getvariable "voiture_possede_une_assurance"}) exitwith {hint "! ASSUR'SFP ! \n ------------------------------------- \n\n Désolé, \n\n Ce véhicule est déja assuré. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil {le_vehicule_a_assurer_sfp getvariable "prix_du_vehicule_neuf"}) exitwith {hint "! ASSUR'SFP ! \n ------------------------------------- \n\n Erreur, le prix du vehicule neuf n'est pas encore enregistré ou ce n'est pas toi qui l'a acheté ... \n\n Indique moi le sur le BugTracker si c'est bien TON véhicule ;) \n\n Merci. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (le_vehicule_a_assurer_sfp getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "! ASSUR'SFP ! \n ------------------------------------- \n\n Désolé, \n\n Ce n'est pas ton véhicule. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil {le_vehicule_a_assurer_sfp getvariable "vehicule_info_parvariable"}) exitwith {hint "! ASSUR'SFP ! \n ------------------------------------- \n\n Désolé, \n\n Ce n'est pas un véhicule. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

cutText["","BLACK FADED"];

_nom_du_menu = "Menu_Assurance_Des_Vehicules";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Titre principal
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetText "Demande D'Assurance D'Un Véhicule";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetTextColor _couleur_rouge;

// Description
_description = "
					Bonjour et bienvenu chez ASSUR'SFP,
					<br/>
					<br/>
					Choisissez le montant que vous souhaitait être remboursé lors de la destruction de votre véhicule.
					<br/>
					<br/>
					ASSUR'SFP est la meilleure solution à vos accidents.
					<br/>
					<br/>
					Nous ne sommes pas des voleurs ! Faite nous confiance :)
				";				
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetStructuredText parseText _description;

_description_deux = "";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1012) ctrlSetStructuredText parseText format ["<t align='center'>%1</t>",_description_deux];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1012) ctrlSetTextColor _couleur_verte;

((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) ctrlSetText format ["%1 Euros.", (le_vehicule_a_assurer_sfp getvariable "prix_du_vehicule_neuf") call retour_formatage_chiffre_sfp];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) ctrlSetTextColor _couleur_verte;

// Montant souhaite
sliderSetRange [1900, 100, round (((le_vehicule_a_assurer_sfp getvariable "prix_du_vehicule_neuf") / 100) * sfp_config_pourcentage_remboursement_max_assurance_sfp)];
sliderSetSpeed [1900, 100, 1000];
sliderSetPosition [1900, round ((((le_vehicule_a_assurer_sfp getvariable "prix_du_vehicule_neuf") / 100) * sfp_config_pourcentage_remboursement_max_assurance_sfp) / 2)];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetText format ["%1 %2", (round (((le_vehicule_a_assurer_sfp getvariable "prix_du_vehicule_neuf") / 100) * sfp_config_pourcentage_remboursement_max_assurance_sfp)) call retour_formatage_chiffre_sfp,"€"];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetTextColor _couleur_verte;

// Affichage montant à payer
((uiNamespace getVariable _nom_du_menu) displayCtrl 1007) ctrlSetText format ["Le montant à payer pour assurer votre véhicule est actuellement de %1 Euros. (A payer en une seul fois).", (round (montant_a_payer_assurance_sfp_maxou)) call retour_formatage_chiffre_sfp,"€"];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1007) ctrlSetTextColor _couleur_verte;

while {!isnull (findDisplay 200000)} do
{
	cutText["","BLACK FADED"];
	sleep 0.0001;
};

cutText["","BLACK IN"];