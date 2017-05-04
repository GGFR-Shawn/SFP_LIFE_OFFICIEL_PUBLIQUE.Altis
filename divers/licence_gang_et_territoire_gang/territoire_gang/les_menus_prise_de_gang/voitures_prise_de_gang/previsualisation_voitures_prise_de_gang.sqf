// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_lb_sfp = lbCurSel 1500;
if (isnil "_le_lb_sfp") exitwith {hint "Rien n'est selectionné !";};
if (_le_lb_sfp == -1) exitwith {hint "Rien n'est selectionné !";};
_dialogue_a_creer = liste_vehicules_prises_de_gang select _le_lb_sfp select 1;
if (isnil "_dialogue_a_creer") exitwith {hint "Erreur, recommence !";};
if (_dialogue_a_creer == "") exitwith {hint "Aucune prévisualisation pour ce véhicule !";};
if (!isClass (configFile >> "CfgVehicles" >> (liste_vehicules_prises_de_gang select _le_lb_sfp select 2))) exitwith {hint "Désolé, vous n'avez pas le launcher pour prévisualiser ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};

if (isnil "message_brut_modele") then
{
	message_brut_modele = 1;
	hint "Attention, les prévualisation sont affichées en version BRUT, c'est à dire en skin d'origine !";
};

createdialog _dialogue_a_creer;

ctrlSetText[11172,"By Maxou. (Echap pour annuler)."];