// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_SuperMarche";

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
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable "mon_argent_banque_by_sfp_maxou")];

liste_recherche_informations_armes = [];
prix_de_depart = [];
_valeur = -1;

lbAdd[_numero_add," Chemlight : 50 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert pour vous éclairer la nuit.']; prix_de_depart pushback 50; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Boite Allumette + Bois : 75 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à créer un feu de camp.']; prix_de_depart pushback 75; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Sac A Dos Simple : 100 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Un sac à dos rien de plus :)']; prix_de_depart pushback 100; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Barre De Céréale : 2 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert quand vous avez une petite faim.']; prix_de_depart pushback 2; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Bouteille D'Eau 25 Cl : 1 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert quand vous avez une petite soif.']; prix_de_depart pushback 1; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," RedBull : 6 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à courir vite plus longtemps.']; prix_de_depart pushback 6; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Hache Pour Coupe Bois : 25 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, "Comme son nom l'indique, à couper le bois."]; prix_de_depart pushback 25; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Canne A Peche : 35 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à farmer le poisson.']; prix_de_depart pushback 35; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Harpon : 100 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à farmer le requin.']; prix_de_depart pushback 100; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Gants : 15 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à farmer le pétrole.']; prix_de_depart pushback 15; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Marteau : 18 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à casser les radars.']; prix_de_depart pushback 18; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Pied De Biche : 17 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à cambrioler les maisons.']; prix_de_depart pushback 17; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Bidon D'Essence : 50 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, "Cela sert à remettre de l'essence dans vos véhicules."]; prix_de_depart pushback 50; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Traceur Véhicule : 600 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à tracer un véhicule affiché sur la carte.']; prix_de_depart pushback 600; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Cocktail Molotov : 210 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, "Comme son nom l'indique ..."]; prix_de_depart pushback 210; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Brouilleur Sacoche C4 : 800 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à neutraliser les sacoches C4 sans danger.']; prix_de_depart pushback 800; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Corde Pour Descente Rappel : 6 000 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, "Comme son nom l'indique, à descendre en rappel."]; prix_de_depart pushback 6000; liste_recherche_informations_armes pushback "itemgps";
lbAdd[_numero_add," Coffre Fort : 200 000 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Pour stocker argent, items, armes, etc.']; prix_de_depart pushback 200000; liste_recherche_informations_armes pushback "itemgps";
if (revive_mon_side == civilian) then {lbAdd[_numero_add," Tente pour dormir : 78 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Tout simplement pour dormir dedans, facon DayZ.']; prix_de_depart pushback 78; liste_recherche_informations_armes pushback "itemgps";};
if (revive_mon_side == civilian) then {lbAdd[_numero_add," Seau Plante Illégale : 13 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à farmer les plantes illégales.']; prix_de_depart pushback 13; liste_recherche_informations_armes pushback "itemgps";};
if (revive_mon_side == civilian) then {lbAdd[_numero_add," Valise Pour Dépot Farming : 75 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Pour y déposer argent, items, etc mais transportable.']; prix_de_depart pushback 75; liste_recherche_informations_armes pushback "itemgps";};
if (revive_mon_side == civilian) then {lbAdd[_numero_add," Corde Et Sac : 24 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, "Pour ligoter un joueur et l'empecher de voir."]; prix_de_depart pushback 24; liste_recherche_informations_armes pushback "itemgps";};
if (revive_mon_side == civilian) then {lbAdd[_numero_add," Bombe Porte Prison : 150 000 Euros."]; _valeur = round (_valeur + 1); ((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_valeur, 'Cela sert à casser la porte de la prison.']; prix_de_depart pushback 150000; liste_recherche_informations_armes pushback "itemgps";};

_numero_tableau = -1;
for "_i" from 0 to (count liste_recherche_informations_armes - 1) do 
{ 
	_numero_tableau = round (_numero_tableau + 1); 
	
	// ======================================================================================================================================== //
	prix_calcul_couleur = (prix_de_depart select _i);
	if (player getvariable _argent_du_menu < prix_calcul_couleur) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};

	lbSetColor [_numero_add, _numero_tableau, couleur_valeur];	
	
	// ======================================================================================================================================== //
	lbSetPicture [_numero_add, _numero_tableau, "\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_off_ca.paa"];
};

waituntil {!dialog;};
cutText["","BLACK IN"];	