// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_argent_du_menu","_prix_de_depart"];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Choix_Menu_Casques_Pompiers";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
liste_recherche_informations_casques_pompier = [];
prix_de_depart = [];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable _argent_du_menu) call retour_formatage_chiffre_sfp];

lbAdd [_numero_add," Casque F1 Chrome Sans Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1";
lbAdd [_numero_add," Casque F1 Chrome Avec Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Gaz";
lbAdd [_numero_add," Casque F1 Bleu Sans Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_BLEU";
lbAdd [_numero_add," Casque F1 Bleu Avec Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_BLEU_Gaz";
lbAdd [_numero_add," Casque F1 Gris Sans Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Gris";
lbAdd [_numero_add," Casque F1 Gris Avec Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Gris_Gaz";
lbAdd [_numero_add," Casque F1 Jaune Sans Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Jaune";
lbAdd [_numero_add," Casque F1 Jaune Avec Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Jaune_Gaz";
lbAdd [_numero_add," Casque F1 Noir Sans Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Noir";
lbAdd [_numero_add," Casque F1 Noir Avec Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Noir_Gaz";
lbAdd [_numero_add," Casque F1 Orange Sans Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Orange";
lbAdd [_numero_add," Casque F1 Orange Avec Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Orange_Gaz";
lbAdd [_numero_add," Casque F1 Rouge Sans Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Rouge";
lbAdd [_numero_add," Casque F1 Rouge Avec Masque A Gaz - 5 €"]; prix_de_depart pushBack 5; liste_recherche_informations_casques_pompier pushBack "SFP_Pompier_Casque_F1_Rouge_Gaz";


for "_i" from 0 to (count liste_recherche_informations_casques_pompier - 1) do 
{ 
	_prix_de_depart = prix_de_depart select _i;
	if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  
	lbSetColor [_numero_add, _i, couleur_valeur];

	lbSetPicture [_numero_add, _i, "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"];	
};

waituntil {!dialog;};
cutText["","BLACK IN"];