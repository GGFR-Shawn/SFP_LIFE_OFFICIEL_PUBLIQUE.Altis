// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side == west) exitwith {hint "! HACK INFORMATIQUE ! \n -------------------------------------- \n Bonjour, \n\n Les gendarmes n'ont pas accès à ce menu. \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou";};

private ["_argent_du_menu","_prix_de_depart"];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Hack_Informatique";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_poche_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_liste_choix_menu_informatique = -1;
prix_de_depart = [];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable _argent_du_menu) call retour_formatage_chiffre_sfp];

lbAdd [_numero_add, format [" Modifier nombre permis de conduire. (De %1 à %2 permis) : 10 700 €", round (player getvariable "nombre_de_permis"),round ((player getvariable "nombre_de_permis") - 1)]]; prix_de_depart pushBack 10700; _liste_choix_menu_informatique = round (_liste_choix_menu_informatique + 1);
lbAdd [_numero_add, " Black-Out réseau téléphone. (20 Minutes) : 150 000 €"]; prix_de_depart pushBack 150000; _liste_choix_menu_informatique = round (_liste_choix_menu_informatique + 1);

for "_i" from 0 to (_liste_choix_menu_informatique) do 
{ 
	_prix_de_depart = prix_de_depart select _i;
	
	
	if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  
	lbSetColor [_numero_add, _i, couleur_valeur];

	lbSetPicture [_numero_add, _i, "\A3\Soft_F\OffRoad_01\Data\UI\offroad_01_base_ca.paa"];	

	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i,  "Selectionner et cliquez sur acheter !"];
};

waituntil {!dialog;};
cutText["","BLACK IN"];