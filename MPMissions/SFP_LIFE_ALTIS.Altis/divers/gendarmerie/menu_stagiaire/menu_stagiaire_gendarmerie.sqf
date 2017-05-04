// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "je_suis_whiteliste_gendarme_stagiaire") exitwith {hint "! WHITELIST GENDARMERIE ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas acheter de choses ici puisque vous n'êtes pas stagiaire ici.\n\n Cordialement.";};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Stagiaire_Gendarmerie";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];

liste_recherche_informations_armes = [];
prix_de_depart = [];

lbAdd[_numero_add,"Taser : 1 000 €"]; prix_de_depart pushback 1000; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Flashball : 800 €"]; prix_de_depart pushback 800; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Lacrymo : 800 €"]; prix_de_depart pushback 800; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Rook : 1 000 €"]; prix_de_depart pushback 1000; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Sting : 5 000 €"]; prix_de_depart pushback 5000; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Tenue Gendarme Avec Gilet : 200 €"]; prix_de_depart pushback 200; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Jumelle : 400 €"]; prix_de_depart pushback 400; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Night Vision : 2 000 €"]; prix_de_depart pushback 2000; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Interceptor : 13 100 €"]; prix_de_depart pushback 13100; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Taurus : 75 000 €"]; prix_de_depart pushback 75000; liste_recherche_informations_armes pushback "RIEN";
lbAdd[_numero_add,"Pickup : 1 000 €"]; prix_de_depart pushback 1000; liste_recherche_informations_armes pushback "RIEN";

_numero_tableau = -1;
for "_i" from 0 to (count liste_recherche_informations_armes - 1) do 
{ 
	_numero_tableau = round (_numero_tableau + 1); 
	
	// ======================================================================================================================================== //
	prix_calcul_couleur = (prix_de_depart select _i);
	if (player getvariable _argent_du_menu < prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

	lbSetColor [_numero_add, _numero_tableau, couleur_valeur];	
	
	// ======================================================================================================================================== //
	lbSetPicture [_numero_add, _numero_tableau, "\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_look_3_ca.paa"];

	// ======================================================================================================================================== //
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_numero_tableau, format['Aucunes informations supplémentaires %1.', name player]];
};

waituntil {!dialog;};
cutText["","BLACK IN"];	