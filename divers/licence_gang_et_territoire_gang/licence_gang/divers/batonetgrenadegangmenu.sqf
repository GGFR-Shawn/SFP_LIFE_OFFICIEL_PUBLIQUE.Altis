// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
if (revive_mon_side != civilian) exitwith {hint "Opération impossible ...";};
if (isnil {player getvariable "licence_gang_v2"}) exitwith {hint "Vous devez faire partie d'un gang pour acheter ces objects !";};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Baton_Et_Grenade_Gang";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_poche_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp];


liste_recherche_informations_armes = ["SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"];
prix_de_depart = [200,200,200,200,200,200,200,500,500,500,500];

lbAdd[_numero_add," Grenade Fumigène Blanche : 200 Euros."];
lbAdd[_numero_add," Grenade Fumigène Rouge : 200 Euros."];
lbAdd[_numero_add," Grenade Fumigène Verte : 200 Euros."];
lbAdd[_numero_add," Grenade Fumigène Jaune : 200 Euros."];
lbAdd[_numero_add," Grenade Fumigène Violet : 200 Euros."];
lbAdd[_numero_add," Grenade Fumigène Bleu : 200 Euros."];
lbAdd[_numero_add," Grenade Fumigène Orange : 200 Euros."];
lbAdd[_numero_add," ChemLight Vert : 500 Euros."];
lbAdd[_numero_add," ChemLight Rouge : 500 Euros."];
lbAdd[_numero_add," ChemLight Jaune : 500 Euros."];
lbAdd[_numero_add," ChemLight Bleu : 500 Euros."];

_numero_tableau = -1;
for "_i" from 0 to (count liste_recherche_informations_armes - 1) do 
{ 
	_numero_tableau = round (_numero_tableau + 1); 
	
	// ======================================================================================================================================== //
	prix_calcul_couleur = (prix_de_depart select _i);
	if (player getvariable _argent_du_menu < prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

	lbSetColor [_numero_add, _numero_tableau, couleur_valeur];	
	
	// ======================================================================================================================================== //
	lbSetPicture [_numero_add, _numero_tableau, "\A3\ui_f\data\IGUI\Cfg\WeaponIcons\gl_ca.paa"];

	// ======================================================================================================================================== //
	_temps_destruction = getnumber (configFile >> "CfgAmmo" >> liste_recherche_informations_armes select _i >> "timeToLive");

	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_numero_tableau, format['Temps avant destruction : %1 Secondes.', _temps_destruction]];
};

waituntil {!dialog;};
cutText["","BLACK IN"];	