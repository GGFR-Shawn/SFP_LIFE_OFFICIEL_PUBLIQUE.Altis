// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (player getvariable "ma_date_de_naissance" < sfp_config_credit_autorisation_minutes_de_jeu) exitwith {hint format ["Désolé, tu n'as pas assez de minutes sur le serveur pour te servir de cette fonction ! \n\n Il te faut au minimum %1 minutes !", sfp_config_credit_autorisation_minutes_de_jeu];};

execvm "divers\banque\credit_sfp\initialisation_credit_sfp.sqf";
if (credit_sfp_sauvegarde select 0 > 0) exitwith {execvm "divers\banque\credit_sfp\menu_remboursement_credit_sfp.sqf"; hintSilent "! SFP CREDIT ! \n ------------------------------------- \n\n Votre demande de crédit n'est pas possible puisque vous en possédez déja un ! \n\n Remboursez le avec ce menu. \n\n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

credit_sfp_sauvegarde_temporaire_validation = nil;
credit_sfp_sauvegarde_temporaire_sauvegarde = credit_sfp_sauvegarde;

cutText["","BLACK FADED"];

_nom_du_menu = "Menu_Credit_SFP";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Titre principal
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetText "Demande de crédit SFP";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetTextColor _couleur_rouge;

// Description
_description = "
					Bonjour et bienvenu au crédit SFP,
					<br/>
					<br/>
					Besoin d'une maison ? D'une voiture ? D'un bateau ?
					<br/>
					<br/>
					Crédit SFP est la meilleure solution pour tous achats.
					<br/>
					Choisisez le montant souhaité ainsi que sa mensualité.
					<br/>
					<br/>
					Bon achat ! ;)
				";				
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetStructuredText parseText _description;

_description_deux = format ["Montant Max d'un emprunt : %1 %3 / Temps entre chaques mensualités : %2 Minutes.", (sfp_config_reglage_credit_sfp select 0) call retour_formatage_chiffre_sfp, (round (sfp_config_reglage_credit_sfp select 1) / 60) call retour_formatage_chiffre_sfp, "€"];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1012) ctrlSetStructuredText parseText format ["<t align='center'>%1</t>",_description_deux];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1012) ctrlSetTextColor _couleur_verte;

((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) ctrlSetText format ["%1 Euros.", (credit_sfp_sauvegarde select 0) call retour_formatage_chiffre_sfp];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) ctrlSetTextColor _couleur_verte;
if (credit_sfp_sauvegarde select 0 > 0) then{((uiNamespace getVariable _nom_du_menu) displayCtrl 1011) ctrlSetTextColor _couleur_rouge;};

// Montant souhaite
sliderSetRange [1900, 0, sfp_config_reglage_credit_sfp select 0];
sliderSetSpeed [1900, 10000, 10000];
sliderSetPosition [1900, credit_sfp_sauvegarde select 0];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetText format ["%1 %2", (round (credit_sfp_sauvegarde select 0)) call retour_formatage_chiffre_sfp,"€"];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetTextColor _couleur_verte;

// Mensualité
slidersetRange [1901,round ((credit_sfp_sauvegarde select 0) / (sfp_config_reglage_credit_sfp select 2)),(credit_sfp_sauvegarde select 0)];
sliderSetSpeed [1901, 100, 100];
sliderSetPosition[1901, round ((credit_sfp_sauvegarde select 0) / (sfp_config_reglage_credit_sfp select 2))];
((uiNamespace getVariable "Menu_Credit_SFP") displayCtrl 1010) ctrlSetText format ["%1 %2", (round ((credit_sfp_sauvegarde select 0) / (sfp_config_reglage_credit_sfp select 2))) call retour_formatage_chiffre_sfp,"€"];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1010) ctrlSetTextColor _couleur_verte;

while {!isnull (findDisplay 200000)} do
{
	cutText["","BLACK FADED"];
	sleep 0.0001;
};
cutText["","BLACK IN"];

if (isnil "credit_sfp_sauvegarde_temporaire_validation") then
{
	credit_sfp_sauvegarde = credit_sfp_sauvegarde_temporaire_sauvegarde;
	hintSilent "! SFP CREDIT ! \n ------------------------------------- \n\n Votre demande de crédit à bien été annulée. \n\n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";
};

execvm "divers\banque\credit_sfp\initialisation_credit_sfp.sqf";
