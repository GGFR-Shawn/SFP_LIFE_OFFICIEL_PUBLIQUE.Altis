// =====================================================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

private "_nombres_de_variable_trouve";

_titre_add_id = 1009;
_nombre_d_infractions = 1008;
_numero_add = 1500;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_nom_du_menu = "Menu_wanted_liste";

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor [1,1,1,1];
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["Casier judiciaire de %1.", name joueur_wanted_liste];

if ((count (joueur_wanted_liste getvariable "infraction_wanted_liste")) >= nombre_maximum_d_infraction) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _nombre_d_infractions) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _nombre_d_infractions) ctrlSetText format ["%1 infractions sur %2", count (joueur_wanted_liste getVariable "infraction_wanted_liste"), nombre_maximum_d_infraction];

lbClear _numero_add;

{
	lbAdd [_numero_add, format ["%1.", _x]];
} foreach (joueur_wanted_liste getvariable "infraction_wanted_liste");

if (count (joueur_wanted_liste getvariable "infraction_wanted_liste") < 1) then {lbAdd [_numero_add, "Aucune infraction signalée ..."]; lbSetColor [_numero_add, 0, _couleur_verte];};

