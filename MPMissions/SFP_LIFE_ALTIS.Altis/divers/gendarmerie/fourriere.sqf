// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nearcar = nearestObjects [player, ["Car", "Ship","Air"], 6];
_carofperson = _nearcar select 0;

_liste_veh_interdit = [];
_liste_heli_interdit = [];
if ((_carofperson in _liste_veh_interdit) or (_carofperson in _liste_heli_interdit)) exitwith {	[[[_carofperson,2],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP; hint "Ce n'est pas le véhicule d'un joueur ... Tu ne peux donc pas le deverouiller !";};
if (isnil ("_carofperson")) exitWith {hint "Vous n'avez pas pointé votre souris vers un véhicule à mettre en fourrière !"};

{if (!isnil {_x getvariable "sarl_depannage_en_ligne"}) then {desdepanneurssontenjeu = 1;};} foreach allunits;
if (!isnil "desdepanneurssontenjeu") exitwith {desdepanneurssontenjeu = nil; hint "Désolé, tu ne peux pas mettre ce véhicule en fourrière puisque des dépanneurs sont connectés ! \n Appel les !";};

if (count crew _carofperson == 0) then 
{
	player setVariable["mon_argent_poche_by_sfp_maxou",(player getVariable "mon_argent_poche_by_sfp_maxou") + 620,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	["Miseenfourriere", [ format["Commission 620 € pour avoir participer à une mise en fourrière",(player getVariable "ma_paye_by_sfp_maxou")] ] ] call bis_fnc_showNotification;
	
	if (isnil {_carofperson getVariable "vehicule_info_parvariable"}) exitWith {deleteVehicle _carofperson;};
	_nom_a_prevenir = _carofperson getVariable "vehicule_info_parvariable" select 0;
	_type_du_vehicule = getText(configFile >> "CfgVehicles" >> (typeOf _carofperson) >> "displayName");
	_mon_nom = name player;
	deleteVehicle _carofperson;
	sleep 1.5;
	[[[_nom_a_prevenir,_type_du_vehicule,_mon_nom],"divers\gendarmerie\fourriere_avertir.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

	_heure_du_log = format ["%1/%2/%3 à %4H%5Min %6:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
	detail_log = format ["à mit en fourriere le vehicule de type %1 qui appartenait a %2 !", _type_du_vehicule, _nom_a_prevenir];
	["Historique Fourriere", "Liste des mises en fourriiere", _heure_du_log, detail_log] call fn_SaveToServer;	
}else
{
	if (count crew _carofperson >= 0) then 
	{
		hint "Impossible de mettre ce véhicule en fourrière puisqu'un joueur y est actuellement !";
	};
};
