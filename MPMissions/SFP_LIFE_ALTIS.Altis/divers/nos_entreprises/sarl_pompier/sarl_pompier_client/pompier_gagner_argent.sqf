//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

sleep 3;
_veh = _this select 0;

waitUntil {(player in _veh)};
_start = time;
hint "Vous gagnez de l'argent temps que vous êtes en intervention !";
waitUntil {!(player in _veh)};
_finish = time - _start;
_pay = ceil(_finish * 0.28);
_time = ceil(_finish / 60);	
player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format['Vous avez gagné %1 euros grace à votre intervention.',_pay];
if (alive _veh) then {[_veh] execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_client\pompier_gagner_argent.sqf";};
