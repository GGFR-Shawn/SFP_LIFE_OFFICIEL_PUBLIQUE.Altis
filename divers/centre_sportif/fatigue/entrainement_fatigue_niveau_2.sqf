// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "message_information_centre_entrainement") then {message_information_centre_entrainement = 0;};
if (message_information_centre_entrainement == 1) exitwith {hint "Désolé, tu es déja entrain d'essayer d'obtenir une aptitude !";};
if (player getvariable "temps_fatigue_niveau_2" >= 1) exitwith {hint "Désolé, tu as déja le niveau 2 !";};
message_information_centre_entrainement = 1;

// -------------------------------------------------------- Vérification du joueur dans le trigger -------------------------------------------------- //
_position_de_depart = position player;

if (player distance _position_de_depart > 60) exitwith {hint "Désolé, tu n'es pas dans l'endroit d'entrainement !";};
hint "! APTITUDE ! \n -------------------------------------------- \n \n Salut, \n\n Comme tu as pu le voir, il existe maintenant ce centre de mise en forme ! \n\n A quoi ca sert ? A avoir une meilleure autonomie pour courir et une meilleure récupération du soufle ;) \n\n Maintenant que tu sais tout, un message va s'afficher te demandant de courir autant de mètre pour valider l'aptitude ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
sleep 3;
hint "! APTITUDE ! \n -------------------------------------------- \n \n Salut, \n\n Comme tu as pu le voir, il existe maintenant ce centre de mise en forme ! \n\n A quoi ca sert ? A avoir une meilleure autonomie pour courir et une meilleure récupération du soufle ;) \n\n Maintenant que tu sais tout, un message va s'afficher te demandant de courir autant de mètre pour valider l'aptitude ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
sleep 3;
hint "! APTITUDE ! \n -------------------------------------------- \n \n Salut, \n\n Comme tu as pu le voir, il existe maintenant ce centre de mise en forme ! \n\n A quoi ca sert ? A avoir une meilleure autonomie pour courir et une meilleure récupération du soufle ;) \n\n Maintenant que tu sais tout, un message va s'afficher te demandant de courir autant de mètre pour valider l'aptitude ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
sleep 7;

// -------------------------------------------------------------- Demarrage de l'entrainement ------------------------------------------------------- //

_distance_a_courrir = floor (200 + (random 250));
_distance_a_courrir_pour_message = _distance_a_courrir;

hint format ["! APTITUDE ! \n -------------------------------------------- \n \n Pour valider l'aptitude, il faut que tu cours %1 mètres ;) \n\n Commence quand tu es pret :) \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_distance_a_courrir];	
sleep 5;

while {_distance_a_courrir > 0 && alive player && vehicle player == player} do
{
	_pos1 = (getPosATL (vehicle player));
	sleep 0.7;
	_pos2 = (getPosATL (vehicle player));
	_verifier_distance = _pos1 distance _pos2; 
	_speed = speed player;
	if ((_verifier_distance > 0.2) && (player distance _position_de_depart < 60) && (_speed > 7)) then
	{
		_distance_a_courrir = _distance_a_courrir - 1;
		hint format ["! APTITUDE ! \n -------------------------------------------- \n \n Encore %1 mètres à courir pour valider l'aptitude ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_distance_a_courrir];	
	};
	if (_speed < 7) then {hint "Tu ne cours pas, et ne fait donc rien ! \n\n Allez en avant on cours ;)"; waituntil {sleep 1; speed player > 0};};
	if (player distance _position_de_depart > 60) then {hint "Tu n'es pas dans le centre d'entrainement !";};
};
if (!alive player) exitwith {};
if (vehicle player != player) exitwith {message_information_centre_entrainement = 0; hint "Tricheur ... Recommence !";};

// -------------------------------------------- Fin quand course termine ------------------------------------------------------ //

sleep 1;
message_information_centre_entrainement = 0;
hint format ["! APTITUDE ! \n -------------------------------------------- \n \n Les %1 mètres ont bien été couru et tu valides donc l'épreuve 2 ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_distance_a_courrir_pour_message];	
player setVariable["temps_fatigue_niveau_2",1,false];

