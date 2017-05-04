//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !


if (revive_mon_side != civilian) exitwith {hint "Vous devez être un civil pour gagner de l'argent avec la collecte de déchets !";};

_veh = _this select 0;

waitUntil {sleep 1; (player in _veh)};

_start = time;
hint "Vous gagnez de l'argent temps que vous êtes en tournée pour la collecte des déchets !";

waitUntil {!(player in _veh)};
_finish = time - _start;
_pay = ceil(_finish * 0.11);
_time = ceil(_finish / 60);	

player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format['Vous avez gagné %1 euros grace à votre tournée de collecte qui a durée %2 minutes.',_pay,_time];

if (alive _veh) then {[_veh] execvm "divers\metiers\eboueur\eboueur_gagner_argent.sqf";};
