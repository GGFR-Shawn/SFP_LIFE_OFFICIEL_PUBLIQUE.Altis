private["_lavictime"];
_lavictime = cursortarget;

if (isNull _lavictime) exitWith {hint "Désolé, il n'y à personne en face !";};
if (!isPlayer _lavictime) exitWith {hint "Désolé, ce n'est pas un joueur !";};
if (player distance _lavictime > 3) exitWith {hint "Désolé, le joueur est trop loin !";};
if (player getvariable "poignard_item" < 1) exitwith {hint "Désolé, tu n'as pas de poignard sur toi !";};
if (player getvariable "ma_date_de_naissance" < 600) exitwith {hint "Désolé, tu n'as pas assez d'heure sur le serveur pour te servir de cette fonction ! \n\n Il te faut au minimum 10 heures !";};

if (!isnil {player getvariable "joueur_menotte"}) exitwith {hint "Désolé, tu ne peux pas quand tu es menotté";};

if (isnil "encore_combien_de_coup_de_poignard") then {encore_combien_de_coup_de_poignard = 3;};
encore_combien_de_coup_de_poignard = encore_combien_de_coup_de_poignard - 1;

if (encore_combien_de_coup_de_poignard >= 1) then {hint format ["Il te reste encore %1 coup de poignard, avant que celui ci soit supprimé !",encore_combien_de_coup_de_poignard];};
if (encore_combien_de_coup_de_poignard < 1) then {encore_combien_de_coup_de_poignard = nil; hint "Tu n'as maintenant plus de poignard !"; player setvariable ["poignard_item",(player getvariable "poignard_item") - 1,true];};

[[[player,"AwopPercMstpSgthWrflDnon_End2"],"divers\taper_un_joueur\tapersynchronisation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
sleep 0.045;
[[[_lavictime, name player],"divers\donner_un_coup_de_poignard\coup_de_poignard_ok_action.sqf"],"BIS_fnc_execVM",_lavictime,false] spawn BIS_fnc_MP;
