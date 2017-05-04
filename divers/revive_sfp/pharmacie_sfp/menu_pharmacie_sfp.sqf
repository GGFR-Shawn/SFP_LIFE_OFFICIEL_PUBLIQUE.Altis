// =======================================================================================================================================================================================
							// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
							  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (daytime > 20 or daytime < 8) exitwith {hint format ["Désolé, la pharmacie est fermé de 20 heures à minuit. Il est actuellement %1 heures.", floor daytime];};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Dialogue_Menu_Pharmacie_SFP";

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

prix_de_depart = [];

lbAdd [_numero_add, format [" Niveau secouriste (%1/%2) : 5 000 Euros par niveau.",player getvariable "mon_niveau_secouriste" , niveau_max_secouriste_revive]]; prix_de_depart pushback 5000; 
lbAdd [_numero_add, " Kit premiers soins : 100 Euros."]; prix_de_depart pushback 100; 
lbAdd [_numero_add, " Antibiotique : 150 Euros."]; prix_de_depart pushback 150; 

_numero_tableau = -1;
for "_i" from 0 to (count prix_de_depart - 1) do 
{ 
	_numero_tableau = round (_numero_tableau + 1); 
	
	// ======================================================================================================================================== //
	prix_calcul_couleur = (prix_de_depart select _i);
	if (player getvariable _argent_du_menu < prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

	lbSetColor [_numero_add, _numero_tableau, couleur_valeur];	
	
	// ======================================================================================================================================== //
	lbSetPicture [_numero_add, _numero_tableau, "\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_off_ca.paa"];

	// ======================================================================================================================================== //
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_numero_tableau, format['Aucunes informations supplémentaires %1.', name player]];
};

waituntil {!dialog;};
cutText["","BLACK IN"];	