// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isServer) then {condition_admin_serveur = true;}else{condition_admin_serveur = false;};

if (isnil "sfp_config_liste_moderateur") exitWith {hint "Erreur, la liste des modérateurs est vide !";};					
if (isnil "condition_admin_serveur") exitWith {hint "Erreur detection serveur !";};
if (!(getPlayerUID player in sfp_config_liste_moderateur) && !condition_admin_serveur) exitWith {};					
if (isnil "listes_joueurs_banni_automatiquement") exitWith {hint "La liste des joueurs banni automatiquement est vide !";};


cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Deban_En_Ligne_Des_Joueurs";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1004;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_rouge;

for "_i" from 0 to (count listes_joueurs_banni_automatiquement - 1) do
{
	lbAdd [_numero_add, format['%1', listes_joueurs_banni_automatiquement select _i]];
	lbSetColor [_numero_add, _i, _couleur_verte];
};

if (count listes_joueurs_banni_automatiquement < 1) then
{
	lbAdd [_numero_add, "Personne n'est banni actuellement."];
};

lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add), "ASC"];

waituntil {!dialog;};
cutText["","BLACK IN"];