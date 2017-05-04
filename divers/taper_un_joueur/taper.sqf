// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_lavictime"];
_lavictime = cursortarget;

if (isNull _lavictime) exitWith {hint "Désolé, il n'y à personne en face !";};
if (!isPlayer _lavictime) exitWith {hint "Désolé, ce n'est pas un joueur !";};
if (player distance _lavictime > 3) exitWith {hint "Désolé, le joueur est trop loin !";};
if (isnil "jepeuxtaper") then {jepeuxtaper = 0;};
if (jepeuxtaper == 1) exitwith {hint "Patiente un peu avant de re frapper un joueur !";};
if (player getvariable "ma_date_de_naissance" < sfp_config_minutes_de_jeu_pour_taper) exitwith {hint format ["Désolé, tu n'as pas assez d'heure sur le serveur pour te servir de cette fonction ! \n\n Il te faut au minimum %1 minutes !", sfp_config_minutes_de_jeu_pour_taper];};
if (!isnil {player getvariable "joueur_menotte"}) exitwith {hint "Désolé, tu ne peux pas quand tu es menotté";};

jepeuxtaper = 1;
[[[player,"AwopPercMstpSgthWrflDnon_End2"],"divers\taper_un_joueur\tapersynchronisation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
sleep 0.08;
[[[_lavictime, name player],"divers\taper_un_joueur\taperokaction.sqf"],"BIS_fnc_execVM",_lavictime,false] spawn BIS_fnc_MP;

if (debug_mission_pour_dev) then {sleep 600;} else {sleep 2;};
jepeuxtaper = 0;