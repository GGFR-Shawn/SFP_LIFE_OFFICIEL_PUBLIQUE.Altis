// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "la_maison_pour_pret_des_clefs") exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Erreur sur la maison, recommence ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Reprendre_Clefs_Maison";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1004;
_numero_add = 1500;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_couleur_blanche = [1,1,1,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText "Choix du joueur pour reprendre vos clefs pour cette maison";
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetText "Double cliquez pour reprendre.";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetTextColor _couleur_rouge;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor _couleur_blanche;

_listes_personnes_qui_ont_les_clefs = "";
for "_i" from 1 to (count (cursorTarget getvariable "proprietaire_de_la_maison") - 1) do
{
	lbAdd [_numero_add, format["%1",cursorTarget getvariable "proprietaire_de_la_maison" select _i]];	
};

if (count (cursorTarget getvariable "proprietaire_de_la_maison") < 2) then 
{
	lbAdd [_numero_add, "Aucun prêt de clefs sur cette maison ..."];	
}else
{
	lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add), "ASC"];
};

waituntil {!dialog;};
cutText["","BLACK IN"];