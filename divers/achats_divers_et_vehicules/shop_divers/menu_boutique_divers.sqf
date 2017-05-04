// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Script prix du toolkit quand DDE de connecté 
desdepanneurssontenjeu = nil; 
{if (!isnil {_x getvariable "sarl_depannage_en_ligne"}) then {desdepanneurssontenjeu = 1;};} foreach allunits; 
	
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Boutique_Divers";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

liste_recherche_informations_armes = [];
prix_de_depart = [];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];

if (revive_mon_side == west) then
{
	lbAdd[_numero_add," GPS : 500 Euros."]; prix_de_depart pushback 500; liste_recherche_informations_armes pushback "itemgps";
	lbAdd[_numero_add," Night Vision : 500 Euros."]; prix_de_depart pushback 500; liste_recherche_informations_armes pushback "NVGoggles";
	lbAdd[_numero_add," Sac A Dos : 250 Euros."]; prix_de_depart pushback 250; liste_recherche_informations_armes pushback "B_Kitbag_cbr";
	lbAdd[_numero_add," Sac A Dos GIGN : 250 Euros."]; prix_de_depart pushback 250; liste_recherche_informations_armes pushback "B_Sac_GIGN";
	lbAdd[_numero_add," Grenade Flash : 14 Euros."]; prix_de_depart pushback 14; liste_recherche_informations_armes pushback "SUPER_flash";
	lbAdd[_numero_add," Grenade fumigène : 13 Euros."]; prix_de_depart pushback 13; liste_recherche_informations_armes pushback "Shop1MenuGrenadeFumigene";
	if (isnil "desdepanneurssontenjeu") then {lbAdd[_numero_add," Kit Reparation : 200 Euros."];  prix_de_depart pushback 200; liste_recherche_informations_armes pushback "ToolKit";}else {lbAdd[_numero_add," Kit Reparation : 1 000 Euros (dépanneurs connectés)."];  prix_de_depart pushback 1000; liste_recherche_informations_armes pushback "ToolKit";};
	lbAdd[_numero_add," Grenade : 200 Euros."]; prix_de_depart pushback 200; liste_recherche_informations_armes pushback "MiniGrenade";
	lbAdd[_numero_add," Jumelle Télémétrique : 120 Euros."]; prix_de_depart pushback 120; liste_recherche_informations_armes pushback "Rangefinder";
	lbAdd[_numero_add," Parachute : 55 Euros."]; prix_de_depart pushback 55; liste_recherche_informations_armes pushback "B_parachute";
};

if (revive_mon_side == civilian) then
{
	lbAdd[_numero_add," GPS : 20 Euros."]; prix_de_depart pushback 20; liste_recherche_informations_armes pushback "itemgps";
	lbAdd[_numero_add," Night Vision : 1 500 Euros."]; prix_de_depart pushback 1500; liste_recherche_informations_armes pushback "NVGoggles";
	lbAdd[_numero_add," Jumelle : 210 Euros."]; prix_de_depart pushback 210; liste_recherche_informations_armes pushback "Binocular";
	lbAdd[_numero_add," Sac A Dos : 100 Euros."]; prix_de_depart pushback 100; liste_recherche_informations_armes pushback "B_Kitbag_cbr";
	if (isnil "desdepanneurssontenjeu") then {lbAdd[_numero_add," Kit Reparation : 500 Euros."]; prix_de_depart pushback 500; liste_recherche_informations_armes pushback "ToolKit";}else {lbAdd[_numero_add," Kit Reparation : 1 200 Euros (dépanneurs connectés)."]; prix_de_depart pushback 1200; liste_recherche_informations_armes pushback "ToolKit";};
	lbAdd[_numero_add," Parachute : 100 Euros."]; prix_de_depart pushback 100; liste_recherche_informations_armes pushback "B_parachute";
	lbAdd[_numero_add," Grenade Fumigène : 105 Euros."]; prix_de_depart pushback 105; liste_recherche_informations_armes pushback "Smokeshell";
};

_numero_tableau = -1;
for "_i" from 0 to (count liste_recherche_informations_armes - 1) do 
{ 
	_numero_tableau = round (_numero_tableau + 1); 
	
	// ======================================================================================================================================== //
	prix_calcul_couleur = prix_de_depart select _i;
	
	if (player getvariable _argent_du_menu < prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

	lbSetColor [_numero_add, _numero_tableau, couleur_valeur];	
	
	// ======================================================================================================================================== //
	lbSetPicture [_numero_add, _numero_tableau, "\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_on_ca.paa"];

	// ======================================================================================================================================== //
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_numero_tableau, format['Aucunes informations supplémentaires %1.', name player]];
};

waituntil {!dialog;};
cutText["","BLACK IN"];	