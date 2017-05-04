// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (je_suis_en_service_a_la_sarl_depannage < 1) exitwith {hint "Désolé, tu n'as pas le droit de rentrer ici !"; jai_le_droit_de_me_tp = 1; (vehicle player) setpos (getmarkerpos "position_sarl_depannage_respawn");};
if (!isnil "supprimer_le_vehicle") exitwith {};

supprimer_le_vehicle = 
{
	deletevehicle cursortarget;
	player setVariable["mon_argent_poche_by_sfp_maxou",(player getVariable "mon_argent_poche_by_sfp_maxou") + 620,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	["Miseenfourriere", [ format["Commission 620 € pour avoir participer à une mise en fourrière",(player getVariable "ma_paye_by_sfp_maxou")] ] ] call bis_fnc_showNotification;

	if (isnil {cursortarget getVariable "vehicule_info_parvariable"}) exitWith {deleteVehicle cursortarget;};
	_nom_a_prevenir = cursortarget getVariable "vehicule_info_parvariable" select 0;
	_type_du_vehicule = getText(configFile >> "CfgVehicles" >> (typeOf cursortarget) >> "displayName");
	_mon_nom = name player;
	deleteVehicle cursortarget;
	sleep 1.5;
	[[[_nom_a_prevenir,_type_du_vehicule,_mon_nom],"divers\gendarmerie\fourriere_avertir.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

	_heure_du_log = format ["%1/%2/%3 à %4H%5Min %6:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
	detail_log = format ["depanneur, à mit en fourriere le vehicule de type %1 qui appartenait a %2 !", _type_du_vehicule, _nom_a_prevenir];
	["Historique Fourriere", "Liste des mises en fourriiere", _heure_du_log, detail_log] call fn_SaveToServer;	
};

supprimer_le_vehicle = player addAction ["<t color=""#ff0000"">" + "Supprimer le véhicule", supprimer_le_vehicle, [], 10, false, false, "","player in list sarl_depannage_mettre_dehors && ((cursortarget iskindof 'Car') or (cursortarget iskindof 'Ship') or (cursortarget iskindof 'Air') or (cursortarget iskindof 'LandVehicle'))"];

waituntil {sleep 0.045; player distance (getmarkerpos "Fourriere") > 50};

player removeaction supprimer_le_vehicle;

supprimer_le_vehicle = nil;