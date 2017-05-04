// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil "temps_restant_loi_martiale") exitwith {hint "Désolé, la loi martiale à déja été demandée ...";};
if (revive_mon_side != west) exitwith {hint "Vous n'etes pas gendarme ...";};

temps_activation_loi_martial = nil;

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Dialogue_Demande_Activation_Loi_Martial";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1007;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_rouge;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText "Choisir le temps en minutes de la loi martiale (gradé gendarmerie seulement)";

waituntil {!isnil "temps_activation_loi_martial" or !dialog};
if (isnil "temps_activation_loi_martial") exitwith {hint "Opération annulée ..."; cutText["","BLACK IN"];};

cutText["","BLACK IN"];	


