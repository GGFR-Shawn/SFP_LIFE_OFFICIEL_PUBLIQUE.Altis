private ["_position","_cargo","_backpack"];
waitUntil { !isNull player };

mon_argent_poche_by_sfp_maxou = player getVariable "mon_argent_poche_by_sfp_maxou";

if ((player getVariable "mon_argent_poche_by_sfp_maxou") < sfp_config_prix_saut_parachute) Exitwith {hint "Désolé, tu n'as pas assez d'argent pour effectuer ce saut !";};

player setVariable ['mon_argent_poche_by_sfp_maxou', mon_argent_poche_by_sfp_maxou - sfp_config_prix_saut_parachute,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format['Dans quelques secondes, vous allez sauter pour %1 Euros ! Il vous restera %2 Euros !',sfp_config_prix_saut_parachute,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];
sleep 3;
hint "La carte va s'ouvrir d'ici peu et il te suffira de cliquer sur l'endroit ou tu souhaites être projeté !";
sleep 2;

_position = vehicle player;
openMap true;
ATM_Jump_mapclick = false;
onMapSingleClick "ATM_Jump_clickpos = _pos; ATM_Jump_mapclick = true; onMapSingleClick ''; true;";

waitUntil {ATM_Jump_mapclick or !(visiblemap)};

if (!visibleMap) exitwith 
{
	systemChat format ["Le saut à été annulé ! Tu as donc été remboursé de %1 Euros !", sfp_config_prix_saut_parachute];
	player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") + sfp_config_prix_saut_parachute,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	breakOut "main";
};

_pos = ATM_Jump_clickpos;
	
ATM_Jump_mapclick = if(true) then
{
	call compile format ['
	mkr_halo = createmarker ["mkr_halo", ATM_Jump_Clickpos];
	"mkr_halo" setMarkerTypeLocal "hd_dot";
	"mkr_halo" setMarkerColorLocal "ColorGreen";
	"mkr_halo" setMarkerTextLocal "Saut en cours ici !";'];
};

_target = player;
_sauvegarde_saut=[_target] call compile preprocessFileLineNumbers 'divers\saut_parachute\fnc_get_loadout.sqf';

removeBackpack player;
_target addBackpack "B_Parachute";

_posJump = getMarkerPos "mkr_halo";
_x = _posJump select 0;
_y = _posJump select 1;
_z = _posJump select 2;
jai_le_droit_de_me_tp = 1;
_target setPos [_x,_y,_z+2200];
openMap false;
deleteMarker "mkr_halo";
hintsilent "";

waitUntil {(getPosATL player select 2) < 1};

hintsilent "Quel saut d'enfer ! \n Ton parachute à été rendu à l'instructeur ! \n\n Tu vas récupérer ton sac si tu en possédais un !";
removeBackpack player;

0 = [_target,_sauvegarde_saut] execVM 'divers\saut_parachute\fnc_set_loadout.sqf'; 
