// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "la_maison_pour_pret_des_clefs") exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Erreur sur la maison, recommence ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Preter_Clefs_Maison";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1004;
_numero_add = 1500;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_couleur_blanche = [1,1,1,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText "Choix du joueur pour prêter vos clefs pour cette maison";
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetText "Double cliquez pour preter.";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetTextColor _couleur_rouge;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor _couleur_blanche;

_compter_joueur = 0;
{
	if (_x != player && alive _x) then
	{
		_compter_joueur = round (_compter_joueur + 1);
		lbAdd [_numero_add, format["%1",name _x]];
	};
} foreach playableunits;

if (_compter_joueur < 1) then 
{
	lbAdd [_numero_add, "Aucun joueurs connectés ..."];
}else
{
	lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add), "ASC"];
};

waituntil {!dialog;};
cutText["","BLACK IN"];