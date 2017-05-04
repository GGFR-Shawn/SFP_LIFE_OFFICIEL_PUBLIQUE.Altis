// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if !(cursortarget iskindof "man") exitwith {hint "Désolé, personne n'est en face !";};
if !(isplayer cursortarget) exitwith {hint "Désolé, personne n'est en face !";};

la_personne_pour_retrait = cursortarget; 

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Retrait_De_Points";

createDialog _nom_du_menu;
disableSerialization;

_analyse_de_la_variable = "combien_de_point_by_sfp_maxou";
_bouton_envoyer = 1705;
_nombre_de_points = 1006;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (la_personne_pour_retrait getvariable _analyse_de_la_variable <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _nombre_de_points) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _nombre_de_points) ctrlSetText format ["%1", (la_personne_pour_retrait getVariable _analyse_de_la_variable)];
((uiNamespace getVariable _nom_du_menu) displayCtrl _bouton_envoyer) ctrlSetText format ["Envoyer à %1.", name la_personne_pour_retrait];

waituntil {!dialog;};
cutText["","BLACK IN"];