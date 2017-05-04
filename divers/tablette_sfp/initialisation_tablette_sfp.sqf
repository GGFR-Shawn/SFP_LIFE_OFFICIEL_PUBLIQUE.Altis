// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil "dialogue_tablette_sfp_maxou") exitwith {hint "Désolé, le menu est déjà ouvert !";};
dialogue_tablette_sfp_maxou = true;
if (isnil "auto_fps_valeur_activation") then {hint "Patiente quelques secondes le temps du chargement des valeurs d'auto FPS !";};
waituntil {!isnil "auto_fps_valeur_activation";};
disableSerialization;

_nom_du_menu = "Menu_tablette_sfp_accueil";

createDialog _nom_du_menu;
disableSerialization;

((uiNamespace getVariable _nom_du_menu) displayCtrl 1200) ctrlSetText "textures\tablette_sfp\tablette_sfp.paa";

// Distance de vue
if (isnil "distance_de_vue_air") then {distance_de_vue_air = 500;};
if (isnil "distance_de_vue_pied") then {distance_de_vue_pied = 500;};
if (isnil "distance_de_vue_voiture") then {distance_de_vue_voiture = 500;};
if (isnil "distance_de_vue_ombrage") then {distance_de_vue_ombrage = 500;};

ctrlSetText[2902, format["%1", distance_de_vue_pied]];
ctrlSetText[2912, format["%1", distance_de_vue_voiture]];
ctrlSetText[2922, format["%1", distance_de_vue_air]];
ctrlSetText[3902, format["%1", distance_de_vue_ombrage]];

{ slidersetRange [_x,50,8000];} foreach [2901,2911,2921,3922];
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [300,300,300]; } foreach [2901,2911,2921,3922];
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,distance_de_vue_pied],[2911,distance_de_vue_voiture],[2921,distance_de_vue_air],[3922,distance_de_vue_ombrage]];

waituntil {sleep 1; !dialog;};
dialogue_tablette_sfp_maxou = nil;
