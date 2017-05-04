// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
if (revive_mon_side != west) exitwith {hint "Opération Impossible";};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_GIGN_Drone";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
liste_recherche_informations_armes = [];
prix_de_depart 					   = [];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable _argent_du_menu)];


if(revive_mon_side == west) then
{
	lbAdd[_numero_add," Drone de surveillance : 10500 €"]; prix_de_depart pushBack 10500; liste_recherche_informations_armes pushBack "B_UAV_01_backpack_F";
	lbAdd[_numero_add," Nano drone de surveillance : 21000 €"]; prix_de_depart pushBack 21000; liste_recherche_informations_armes pushBack "Black_Hornet_Nano_UAV_Bag";
};

for "_i" from 0 to (count liste_recherche_informations_armes - 1) do 
{
	prix_calcul_couleur = prix_de_depart select _i;
	if (player getvariable _argent_du_menu < prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

	lbSetColor [_numero_add, _i, couleur_valeur];	
	
	// ======================================================================================================================================== //
	lbSetPicture [_numero_add, _i, "\A3\ui_f\data\IGUI\Cfg\WeaponCursors\sgun_gs.paa"];

	// ======================================================================================================================================== //	
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i, "Aucune information supplémentaire."];
};

waituntil {!dialog;};
cutText["","BLACK IN"];	