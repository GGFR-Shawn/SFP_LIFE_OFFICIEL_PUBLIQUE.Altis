//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !


hint "Cet hélicoptère est maintenant gratuit depuis le 11/01/2016.";

// _veh = _this select 0;
// sleep 2;

// if (player in _veh) then
// {
	// if (jaidejaeucemessage == 0) then
	// {
		// sleep 1;
		// hint "!! EXPLICATIONS !! \n\n Comme indiqué sur la piste de La Navette Hélicoptère, tu paieras le tarif approximatif qui était indiqué pour la destination choisit. \n\n
		// Si tu es d'accord avec ce tarif, reste dans l'hélicoptère jusqu'à la destination finale ! ;) \n\n
		// Si non, il ne te reste plus qu'à y sortir !";
		// jaidejaeucemessage = 1;
	// }else
	// {
		// jaidejaeucemessage = 3;
	// };
// };

// sleep 5;

// if (player in _veh) then
// {
	// if (jaidejaeucemessage == 3) then {hint "Attention, n'oublie pas que cet helicoptère est payant ...";}; 
	// _tpcheck = 0;
	// while {(player in _veh) && (_tpcheck < 5)} do 
	// {
		// _pos1 = (getPosATL (vehicle player));
		// sleep 2;
		// _pos2 = (getPosATL (vehicle player));
		// _tpcheck = _pos1 distance _pos2; 
	// };
	
	// hint "La facturation de l'hélico commence !";
	// _start = time;
	// waitUntil {!(player in _veh)};
	// _finish = time - _start;
	// _pay = ceil(_finish * 2.40);
	// _time = ceil(_finish / 60);	
	// player setVariable ["mon_argent_banque_by_sfp_maxou", (player getVariable "mon_argent_banque_by_sfp_maxou") - _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	// hint format['Pour ce trajet, tu as payé %1 euros pour %2 minutes de temps de trajet.',_pay,_time];
// };