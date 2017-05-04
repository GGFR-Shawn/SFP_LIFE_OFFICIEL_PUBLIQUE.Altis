// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isServer) then {condition_admin_serveur = true;}else{condition_admin_serveur = false;};
if (isnil "sfp_config_liste_moderateur") exitWith {hint "Erreur, la liste des modérateurs est vide !";};					
if (isnil "condition_admin_serveur") exitWith {hint "Erreur detection serveur !";};
if (!(getPlayerUID player in sfp_config_liste_moderateur) && !condition_admin_serveur) exitWith {};					

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Admin_Informations_Joueurs";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1004;
_numero_add = 1500;
_numero_add_deux = 1501;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_rouge;

_ligne_du_tableau = 0;
nom_du_menu_informations_des_joueurs = [];
{
	lbAdd [_numero_add, format['%1', name _x]];
	lbSetColor [_numero_add, _ligne_du_tableau, _couleur_verte];
	_ligne_du_tableau = round (_ligne_du_tableau + 1);
	nom_du_menu_informations_des_joueurs = nom_du_menu_informations_des_joueurs + [name _x];
} foreach playableunits;

if (count nom_du_menu_informations_des_joueurs > 0) then
{
	lbAdd [_numero_add_deux, "Selectionne un joueur dans la liste de gauche pour avoir les informations ..."];
}else
{
	lbAdd [_numero_add, "Aucun joueur connecté ..."];
	lbAdd [_numero_add_deux, "Aucun joueur connecté ..."];
	nom_du_menu_informations_des_joueurs = nom_du_menu_informations_des_joueurs + ["Aucun joueur connecté ..."];
};

lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add), "ASC"];

waituntil {!dialog;};
cutText["","BLACK IN"];