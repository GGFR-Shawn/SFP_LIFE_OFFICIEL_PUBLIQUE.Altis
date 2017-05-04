// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_choix = _this select 3 select 0;
if (isnil "_choix") exitwith {hint "Erreur tableau, si soucis contact Maxou.";};
if (isnil "addaction_sacoche_de_c4") exitwith {hint "Erreur d'initialisation, si soucis contact Maxou.";};

[] call addaction_sacoche_de_c4;

switch _choix do
{
	case 0 :
	{
		// Tableau
		cutText["","BLACK FADED"];
		0 cutFadeOut 9999999;

		_nom_du_menu = "Menu_Faire_Peter_Sacoche_c4";

		createDialog _nom_du_menu;
		disableSerialization;

		_titre_add_id = 1004;
		_numero_add = 1500;
		_couleur_verte = [0,0.91,0.07,1];
		_couleur_rouge = [0.99,0.04,0.01,1];
		_couleur_blanche = [1,1,1,1];

		((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText "Faire peter la sacoche c4";
		((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_verte;
		((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetText "Double cliquez pour faire peter.";
		((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetTextColor _couleur_rouge;
		((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor _couleur_blanche;

		[] call addaction_sacoche_de_c4;
		
		for "_i" from 0 to (count emplacement_des_sacoches_c4 - 1) do
		{			
			((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbAdd format ["Sacoche de c4 Numéro %1 - Position %2 - Distance %3 Mètres.", _i + 1, mapgridposition (emplacement_des_sacoches_c4 select _i select 0), round (player distance (emplacement_des_sacoches_c4 select _i select 0))];
			((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i,  "Double clique pour la faire peter !"];
			lbSetPicture [_numero_add, _i, "\A3\ui_f\data\gui\cfg\Hints\chemlights_ca.paa"]; 
		};

		if (count emplacement_des_sacoches_c4 < 1) then {lbAdd [_numero_add, "Aucune sacoche de c4 placée ..."];};

		waituntil {!dialog;};
		cutText["","BLACK IN"];	};
	case 1 :
	{
		// Faire peter
		_sacoche_c4_selectionne_sfp = lbCurSel ((uiNamespace getVariable "Menu_Faire_Peter_Sacoche_c4") displayCtrl 1500);
		if (count emplacement_des_sacoches_c4 < 1) exitwith {hint "Aucune sacoche de c4 n'est placé !"; closedialog 0;};
		if (isnil "_sacoche_c4_selectionne_sfp") exitwith {hint "Erreur dialogue, recommence !";};
		if (_sacoche_c4_selectionne_sfp == -1) exitwith {hint "Erreur dialogue, recommence !";};

		if (round random 3 == 0) then
		{
			hint format ["La sacoche de c4 en position %1 a foirée est n'a pas explosée !", mapgridposition (emplacement_des_sacoches_c4 select _sacoche_c4_selectionne_sfp select 0)];
		}else
		{
			_bombe_sfp = "Bo_Mk82" createVehicle (position (emplacement_des_sacoches_c4 select _sacoche_c4_selectionne_sfp select 0));
			hint format ["La sacoche de c4 à bien explosée en position %1 !", mapgridposition (emplacement_des_sacoches_c4 select _sacoche_c4_selectionne_sfp select 0)];
		};
		
		{deletevehicle _x} foreach (nearestObjects [(emplacement_des_sacoches_c4 select _sacoche_c4_selectionne_sfp select 0), ["Land_Suitcase_F"], 4]);
		
		closedialog 0;
		[0,0,0,[0]] execVM "divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\faire_peter_la_sacoche_c4.sqf";
	};
};
