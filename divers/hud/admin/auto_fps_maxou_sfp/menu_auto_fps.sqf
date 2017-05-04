// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "auto_fps_valeur_activation") then {auto_fps_valeur_activation = false;};
if (isnil "auto_fps_valeur_fps_souhaite") then {auto_fps_valeur_fps_souhaite = 30;};
if (isnil "auto_fps_valeur_distance_mini") then {auto_fps_valeur_distance_mini = 2000;};

cutText["","BLACK OUT"];

_nom_du_menu = "Menu_Auto_FPS_Maxou";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Titre principal
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetText "Personnalisation de vos FPS";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetTextColor _couleur_rouge;

// Description
_description = "
					Bonjour,
					<br/>
					<br/>
					Grace à ce réglage, vous allez pouvoir régler automatiquement vos FPS en jeu.
					<br/>
					<br/>
					Le premier slider sert à régler les FPS souhaités, la distance de vue s'ajustera automatiquement.
					<br/>
					Le deuxième slider quand à lui, est la distance minimum à affichée.
					<br/>
					<br/>
					Essayez de trouver le meilleur compromis ;)
				";

((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetStructuredText parseText _description;

// Etat activation
if (auto_fps_valeur_activation) then
{
	((uiNamespace getVariable _nom_du_menu) displayCtrl 1008) ctrlSetText "Actuellement activé !";
	((uiNamespace getVariable _nom_du_menu) displayCtrl 1008) ctrlSetTextColor _couleur_verte;
}else
{
	((uiNamespace getVariable _nom_du_menu) displayCtrl 1008) ctrlSetText "Actuellement éteint !";
	((uiNamespace getVariable _nom_du_menu) displayCtrl 1008) ctrlSetTextColor _couleur_rouge;
};

// FPS Mini
sliderSetRange [1900, 10, 120];
sliderSetSpeed [1900, 5, 10];
sliderSetPosition [1900, auto_fps_valeur_fps_souhaite];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetText format ["%1", round auto_fps_valeur_fps_souhaite];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetTextColor _couleur_verte;


// Vue Mini
slidersetRange [1901,100,12000];
sliderSetSpeed [1901, 100, 600];
sliderSetPosition[1901, auto_fps_valeur_distance_mini];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1010) ctrlSetText format ["%1", round auto_fps_valeur_distance_mini];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1010) ctrlSetTextColor _couleur_verte;

waitUntil {isnull (findDisplay 100000)};
['auto_fps_valeur_activation', auto_fps_valeur_activation] call uid_sauvegarde_ecrire_local_joueur_sfp;
['auto_fps_valeur_fps_souhaite', auto_fps_valeur_fps_souhaite] call uid_sauvegarde_ecrire_local_joueur_sfp;
['auto_fps_valeur_distance_mini', auto_fps_valeur_distance_mini] call uid_sauvegarde_ecrire_local_joueur_sfp;
hintSilent parseText format ["! AUTO FPS SFP ! <br/> ------------------------------------- <br/><br/> Les valeurs <t color='#00D611'>%1</t> comme FPS ainsi que <t color='#00D611'>%2</t> Mètres en distance ont bien été validées ! <br/> ------------------------------------- <br/> By SFP Maxou <br/> www.sfpteam.fr", round auto_fps_valeur_fps_souhaite, round auto_fps_valeur_distance_mini];
cutText["","BLACK IN"];
