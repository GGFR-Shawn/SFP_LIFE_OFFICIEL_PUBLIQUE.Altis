// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_valeur_une";
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Joueur_Demandant_Depannage";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_text = 1001;
_couleur_verte = [0,0.91,0.07,1];

createDialog _nom_du_menu;
disableSerialization;

((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_text) ctrlSetText "Selectionne qui tu souhaites prevenir de ton arrivée !";
((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_text) ctrlSetTextColor _couleur_verte;

_nombre_de_vehicule_en_panne_by_sfp_maxou = -1;
les_vehicules_en_pannes_pour_la_dir_by_sfp_maxou = [];
{
	if (!isnil {_x getvariable "vehicule_attente_reparation"}) then
	{
		if (isOnRoad _x) then {_valeur_une = "Oui"}else{_valeur_une = "Non"};
		_nombre_de_vehicule_en_panne_by_sfp_maxou = round (_nombre_de_vehicule_en_panne_by_sfp_maxou + 1);
		les_vehicules_en_pannes_pour_la_dir_by_sfp_maxou pushback _x;
		
		lbAdd [_numero_add, format['%1 sur %2 (%3) à %4 mètres de distance.', _x getvariable "vehicule_info_parvariable" select 0, getText ( configFile >> "CfgVehicles" >> typeOf (_x) >> "displayName"), _x getvariable "plaque_immatriculation_news" select 0 ,round (player distance _x)]];
		((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_nombre_de_vehicule_en_panne_by_sfp_maxou, format['Dégat : %1 %2 /.\ Position : %3. /.\ Sur la route : %4.', round (damage _x * 100), "%", mapgridposition _x, _valeur_une]];
	};	
} foreach vehicles;

if (_nombre_de_vehicule_en_panne_by_sfp_maxou <= -1) then {lbAdd [_numero_add, "Aucun véhicule en panne actuellement."];};
	
waituntil {!dialog;};
cutText["","BLACK IN"];
