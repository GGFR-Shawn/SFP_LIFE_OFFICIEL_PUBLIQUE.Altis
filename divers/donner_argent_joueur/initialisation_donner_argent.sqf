// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_valeur_a_afficher";
joueur_a_qui_donner_argent = cursortarget;
if (isnil "joueur_a_qui_donner_argent") exitwith {hint "Erreur, recommence ...";};
if !(joueur_a_qui_donner_argent iskindof "man") exitwith {hint "Erreur, ce n'est pas un joueur ...";};
if !(isplayer cursortarget) exitwith {hint "Erreur, ce n'est pas un joueur ...";};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Banque_Envoyer_Argent_Poche";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (player getvariable "mon_argent_poche_by_sfp_maxou" <= 0) then {couleur_poche = _couleur_rouge;}else{couleur_poche = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1006) ctrlSetTextColor couleur_poche;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1006) ctrlSetText format ["%1 €", (player getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp];

if (name joueur_a_qui_donner_argent in personne_dans_mon_groupe) then
{
	_valeur_a_afficher = name joueur_a_qui_donner_argent;
}else
{
	_valeur_a_afficher = "Inconnu (non dans votre groupe)";
};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1705) ctrlSetText format ["Donner l'argent à %1.", _valeur_a_afficher];
	
waituntil {!dialog;};
cutText["","BLACK IN"];