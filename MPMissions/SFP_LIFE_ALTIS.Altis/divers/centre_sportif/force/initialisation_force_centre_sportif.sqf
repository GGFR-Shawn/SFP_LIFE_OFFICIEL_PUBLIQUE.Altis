// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement_pour_revive"};

private ["_temps_max_fatigue","_condition","_mon_niveau_de_force","_choix_des_niveaux","_nombre_de_valeur_max"];
_condition = _this select 3 select 0;
_mon_niveau_de_force = player getvariable "niveau_force";
_choix_des_niveaux = sfp_config_choix_niveau_de_force;
_nombre_de_valeur_max = count _choix_des_niveaux - 1;
if (isnil "_mon_niveau_de_force") then {_mon_niveau_de_force = 0; hint "Erreur detection choix du niveau de force ...";};
if (_mon_niveau_de_force > _nombre_de_valeur_max) then {_mon_niveau_de_force = (_nombre_de_valeur_max - 1);};
if (isnil "_condition") then {hint "Erreur detection choix du niveau de force ...";};

switch _condition do
{
	case "1" :
	{
		player setvariable ["totalspace",(_choix_des_niveaux select _mon_niveau_de_force select 0),true];
	};
	
	case "2" :
	{
		if (isnil "message_information_centre_entrainement_force") then {message_information_centre_entrainement_force = 0;};
		if (message_information_centre_entrainement_force == 1) exitwith {hint "Désolé, tu es déja entrain d'essayer d'obtenir une aptitude !";};
		if (player getvariable "totalspace" >= (_choix_des_niveaux select _nombre_de_valeur_max select 0)) exitwith {hint "Désolé, tu as déja le niveau maximum de force ;)";};
		message_information_centre_entrainement_force = 1;
		
		_niveau_voulu = _choix_des_niveaux select (round (_mon_niveau_de_force + 1)) select 0;
		_temps_formation = _choix_des_niveaux select (round (_mon_niveau_de_force + 1)) select 1;
		
		hint "! APTITUDE ! \n -------------------------------------------- \n \n Salut, \n\n Comme tu as pu le voir, il existe maintenant ce centre de mise en forme ! \n\n A quoi ca sert ? A avoir une force plus conséquente pour porter plus de chose ;) \n\n Maintenant que tu sais tout, patiente que l'épreuve automatique se termine ... \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
		sleep 7;

		6 fadeSound 0;
		6 fadeMusic 0;
		for "_i" from 0 to _temps_formation do
		{
			0 cuttext [format ["! APTITUDE ! \n --------------------------------------------------------------- \n\n Ca pousse ca pousse ca pousse ...\n\n La fonte te permettra de porter plus de poids (%2) ! \n\n Encore %1 secondes avant la fin de l'effort !", round (_temps_formation - _i), _niveau_voulu],"BLACK FADED",1];
			if (alive player) then {sleep 1;};
		};
		10 fadeSound 1;
		10 fadeMusic 1;
		if (!alive player) exitwith {hint "Désolé, vous êtes mort ..."; message_information_centre_entrainement_force = 0;};
		0 cutText ["! APTITUDE ! \n --------------------------------------------------------------- \n\n Bien joué monsieur muscle ... ;) \n\n Tu peux porter maintenant plus de poids !", "BLACK IN",20];	

		message_information_centre_entrainement_force = 0;
		player setVariable["totalspace",_niveau_voulu,false];
		player setVariable["niveau_force",(round (_mon_niveau_de_force + 1)),false];
	};
};

if (isnil {player getvariable "totalspace"}) then
{
	player setvariable ["totalspace",(_choix_des_niveaux select _nombre_de_valeur_max select 0),true];
	systemchat " sur votre espace virtuel total.";
};