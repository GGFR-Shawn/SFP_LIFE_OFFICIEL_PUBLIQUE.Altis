// =======================================================================================================================================================================================
											// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
											  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] spawn
{
	if (isnil "affiche_tutoriel_decorateur") then
	{
		affiche_tutoriel_decorateur = true;
		
		29000 cutRsc ["Tutoriel_Decorateur_Interieur","PLAIN"];
		
		_position_actuel = getPosATL player;
		
		waituntil {sleep 1; !alive player or player distance _position_actuel > 100};
		
		29000 cuttext ["","PLAIN"];
		
		affiche_tutoriel_decorateur = nil;
	};
};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Decorateur_Interieur";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1004;
_numero_add = 1500;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_couleur_blanche = [1,1,1,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText "Choix de l'objet à poser";
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetText "Double cliquez pour le poser.";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetTextColor _couleur_rouge;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor _couleur_blanche;

les_objets_quon_peut_placer = [];
for "_i" from 0 to (count sfp_config_listes_objects_decorateurs - 1) do
{
	lbAdd [_numero_add, format["%1",sfp_config_listes_objects_decorateurs select _i select 1]];
	les_objets_quon_peut_placer = les_objets_quon_peut_placer + [sfp_config_listes_objects_decorateurs select _i select 0];
};

lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add), "ASC"];

waituntil {!dialog;};
cutText["","BLACK IN"];