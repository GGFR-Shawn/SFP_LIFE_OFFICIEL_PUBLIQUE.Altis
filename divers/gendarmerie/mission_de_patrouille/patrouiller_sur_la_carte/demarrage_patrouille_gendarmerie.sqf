// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

trgpatrol1 = [5855.68,10815.8,0];
trgpatrol2 = [5516.96,9911.54,0];
trgpatrol3 = [7328.01,7978.8,0];
trgpatrol4 = [12794.7,7451.95,0];
trgpatrol5 = [11380.9,5390.59,0];
trgpatrol6 = [9343.19,4085.84,0];
trgpatrol7 = [4598.93,5253.74,0];

if (isnil "patrolmission") then {patrolmission = 0;};

if (revive_mon_side == west) then 
{
	if (patrolmission == 0) then 
	{
		patrolnumber = 1;
		patrolrnumber = (floor(random 6) + 1);
		switch (patrolrnumber) do
		{
			case 1:
			{
				// Ne pas oubliger de modifié pasmortmission en fonction de la mission choisit
				execVM "divers\gendarmerie\mission_de_patrouille\patrouiller_sur_la_carte\terminer_mission_patrouille_si_mort.sqf";
				createMarkerLocal ["patrolmarker", (trgpatrol1)];"patrolmarker" setMarkerShapeLocal "ICON";"patrolmarker" setMarkerColorLocal "Coloryellow";	"patrolmarker" setMarkerSizeLocal [3,3];"patrolmarker" setMarkerTypeLocal "hd_dot";
				"patrolmarker" setMarkerTextLocal "Point de patrouille 1";
				hint "Patrouiller au point de patrouille 1 (pendant 20 minutes) indiqué en jaune sur ta carte !";
				pasmortmission = 1;patrolmission = 1;
				waitUntil {(vehicle player distance trgpatrol1 < 15) && (patrolmission == 1)};
				hint "Patrouille démarrée pour 20 minutes ! Rester en vie pendant ce temps, ou vous ne gagnerez pas d'argent !";
				sleep 6;
				hint "N'hésite pas à tourner aux alentours du point de patrouille, tu en as la possibilité !";
				_start = time;
				sleep 1200;
				_finish = time - _start;
				_pay = ceil(_finish * 2);
				_time = ceil(_finish / 60);
				if ((patrolmission == 1) && (pasmortmission == 1)) then
				{
					player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; deleteMarkerLocal "patrolmarker";
					hint format['Vous avez gagné %1 euros grace à votre patrouille sur zone qui a durée %2 minutes.',_pay,_time];
					patrolmission = 0;
				};
			};
			case 2:
			{
				// Ne pas oubliger de modifié pasmortmission en fonction de la mission choisit
				execVM "divers\gendarmerie\mission_de_patrouille\patrouiller_sur_la_carte\terminer_mission_patrouille_si_mort.sqf";
				createMarkerLocal ["patrolmarker", ( trgpatrol2)];"patrolmarker" setMarkerShapeLocal "ICON";"patrolmarker" setMarkerColorLocal "Coloryellow";	"patrolmarker" setMarkerSizeLocal [3,3];"patrolmarker" setMarkerTypeLocal "hd_dot";
				"patrolmarker" setMarkerTextLocal "Point de patrouille 2";
				hint "Patrouiller au point de patrouille 2 (pendant 20 minutes) indiqué en jaune sur ta carte !";
				pasmortmission = 2;patrolmission = 2;
				waitUntil {(vehicle player distance trgpatrol2 < 15) && (patrolmission == 2)};
				hint "Patrouille démarrée pour 20 minutes ! Rester en vie pendant ce temps, ou vous ne gagnerez pas d'argent !";
				sleep 6;
				hint "N'hésite pas à tourner aux alentours du point de patrouille, tu en as la possibilité !";
				_start = time;
				sleep 1200;
				_finish = time - _start;
				_pay = ceil(_finish * 2);
				_time = ceil(_finish / 60);
				if ((patrolmission == 2) && (pasmortmission == 2)) then
				{
					player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";deleteMarkerLocal "patrolmarker";
					hint format['Vous avez gagné %1 euros grace à votre patrouille sur zone qui a durée %2 minutes.',_pay,_time];
					patrolmission = 0;
				};
			};
			case 3:
			{
				// Ne pas oubliger de modifié pasmortmission en fonction de la mission choisit
				execVM "divers\gendarmerie\mission_de_patrouille\patrouiller_sur_la_carte\terminer_mission_patrouille_si_mort.sqf";
				createMarkerLocal ["patrolmarker", (trgpatrol3)];"patrolmarker" setMarkerShapeLocal "ICON";"patrolmarker" setMarkerColorLocal "Coloryellow";	"patrolmarker" setMarkerSizeLocal [3,3];"patrolmarker" setMarkerTypeLocal "hd_dot";
				"patrolmarker" setMarkerTextLocal "Point de patrouille 3";
				hint "Patrouiller au point de patrouille 3 (pendant 20 minutes) indiqué en jaune sur ta carte !";
				pasmortmission = 3;patrolmission = 3;
				waitUntil {(vehicle player distance trgpatrol3 < 15) && (patrolmission == 3)};
				hint "Patrouille démarrée pour 20 minutes ! Rester en vie pendant ce temps, ou vous ne gagnerez pas d'argent !";
				sleep 6;
				hint "N'hésite pas à tourner aux alentours du point de patrouille, tu en as la possibilité !";
				_start = time;
				sleep 1200;
				_finish = time - _start;
				_pay = ceil(_finish * 2);
				_time = ceil(_finish / 4);
				if ((patrolmission == 3) && (pasmortmission == 3)) then
				{player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";deleteMarkerLocal "patrolmarker";
				hint format['Vous avez gagné %1 euros grace à votre patrouille sur zone qui a durée %2 minutes.',_pay,_time];
				patrolmission = 0;};
			};
			case 4:
			{
				// Ne pas oubliger de modifié pasmortmission en fonction de la mission choisit
				execVM "divers\gendarmerie\mission_de_patrouille\patrouiller_sur_la_carte\terminer_mission_patrouille_si_mort.sqf";
				createMarkerLocal ["patrolmarker", (trgpatrol4)];"patrolmarker" setMarkerShapeLocal "ICON";"patrolmarker" setMarkerColorLocal "Coloryellow";	"patrolmarker" setMarkerSizeLocal [3,3];"patrolmarker" setMarkerTypeLocal "hd_dot";
				"patrolmarker" setMarkerTextLocal "Point de patrouille 4";
				hint "Patrouiller au point de patrouille 4 (pendant 20 minutes) indiqué en jaune sur ta carte !";
				pasmortmission = 4;patrolmission = 4;
				waitUntil {(vehicle player distance trgpatrol4 < 15) && (patrolmission == 4)};
				hint "Patrouille démarrée pour 20 minutes ! Rester en vie pendant ce temps, ou vous ne gagnerez pas d'argent !";
				sleep 6;
				hint "N'hésite pas à tourner aux alentours du point de patrouille, tu en as la possibilité !";
				_start = time;
				sleep 1200;
				_finish = time - _start;
				_pay = ceil(_finish * 2);
				_time = ceil(_finish / 60);
				if ((patrolmission == 4) && (pasmortmission == 4)) then
				{player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";deleteMarkerLocal "patrolmarker";
				hint format['Vous avez gagné %1 euros grace à votre patrouille sur zone qui a durée %2 minutes.',_pay,_time];
				patrolmission = 0;};
			};
			case 5:
			{
				// Ne pas oubliger de modifié pasmortmission en fonction de la mission choisit
				execVM "divers\gendarmerie\mission_de_patrouille\patrouiller_sur_la_carte\terminer_mission_patrouille_si_mort.sqf";
				createMarkerLocal ["patrolmarker", (trgpatrol5)];"patrolmarker" setMarkerShapeLocal "ICON";"patrolmarker" setMarkerColorLocal "Coloryellow";	"patrolmarker" setMarkerSizeLocal [3,3];"patrolmarker" setMarkerTypeLocal "hd_dot";
				"patrolmarker" setMarkerTextLocal "Point de patrouille 5";
				hint "Patrouiller au point de patrouille 5 (pendant 20 minutes) indiqué en jaune sur ta carte !";
				pasmortmission = 5;patrolmission = 5;
				waitUntil {(vehicle player distance trgpatrol5 < 15) && (patrolmission == 5)};
				hint "Patrouille démarrée pour 20 minutes ! Rester en vie pendant ce temps, ou vous ne gagnerez pas d'argent !";
				sleep 6;
				hint "N'hésite pas à tourner aux alentours du point de patrouille, tu en as la possibilité !";
				_start = time;
				sleep 1200;
				_finish = time - _start;
				_pay = ceil(_finish * 2);
				_time = ceil(_finish / 60);
				if ((patrolmission == 5) && (pasmortmission == 5)) then
				{player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";deleteMarkerLocal "patrolmarker";
				hint format['Vous avez gagné %1 euros grace à votre patrouille sur zone qui a durée %2 minutes.',_pay,_time];
				patrolmission = 0;};
			};
			case 6:
			{
				// Ne pas oubliger de modifié pasmortmission en fonction de la mission choisit
				execVM "divers\gendarmerie\mission_de_patrouille\patrouiller_sur_la_carte\terminer_mission_patrouille_si_mort.sqf";
				createMarkerLocal ["patrolmarker", (trgpatrol6)];"patrolmarker" setMarkerShapeLocal "ICON";"patrolmarker" setMarkerColorLocal "Coloryellow";	"patrolmarker" setMarkerSizeLocal [3,3];"patrolmarker" setMarkerTypeLocal "hd_dot";
				"patrolmarker" setMarkerTextLocal "Point de patrouille 6";
				hint "Patrouiller au point de patrouille 6 (pendant 20 minutes) indiqué en jaune sur ta carte !";
				pasmortmission = 6;patrolmission = 6;
				waitUntil {(vehicle player distance trgpatrol6 < 15) && (patrolmission == 6)};
				hint "Patrouille démarrée pour 20 minutes ! Rester en vie pendant ce temps, ou vous ne gagnerez pas d'argent !";
				sleep 6;
				hint "N'hésite pas à tourner aux alentours du point de patrouille, tu en as la possibilité !";
				_start = time;
				sleep 1200;
				_finish = time - _start;
				_pay = ceil(_finish * 2);
				_time = ceil(_finish / 60);
				if ((patrolmission == 6) && (pasmortmission == 6)) then
				{player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";deleteMarkerLocal "patrolmarker";
				hint format['Vous avez gagné %1 euros grace à votre patrouille sur zone qui a durée %2 minutes.',_pay,_time];
				patrolmission = 0;};
			};			
			case 7:
			{
				// Ne pas oubliger de modifié pasmortmission en fonction de la mission choisit
				execVM "divers\gendarmerie\mission_de_patrouille\patrouiller_sur_la_carte\terminer_mission_patrouille_si_mort.sqf";
				createMarkerLocal ["patrolmarker", (trgpatrol7)];"patrolmarker" setMarkerShapeLocal "ICON";"patrolmarker" setMarkerColorLocal "Coloryellow";	"patrolmarker" setMarkerSizeLocal [3,3];"patrolmarker" setMarkerTypeLocal "hd_dot";
				"patrolmarker" setMarkerTextLocal "Point de patrouille 7";
				hint "Patrouiller au point de patrouille 7 (pendant 20 minutes) indiqué en jaune sur ta carte !";
				pasmortmission = 7;patrolmission = 7;
				waitUntil {(vehicle player distance trgpatrol7 < 15) && (patrolmission == 7)};
				hint "Patrouille démarrée pour 20 minutes ! Rester en vie pendant ce temps, ou vous ne gagnerez pas d'argent !";
				sleep 7;
				hint "N'hésite pas à tourner aux alentours du point de patrouille, tu en as la possibilité !";
				_start = time;
				sleep 1200;
				_finish = time - _start;
				_pay = ceil(_finish * 3);
				_time = ceil(_finish / 60);
				if ((patrolmission == 7) && (pasmortmission == 7)) then
				{player setVariable ["mon_argent_poche_by_sfp_maxou", (player getVariable "mon_argent_poche_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";deleteMarkerLocal "patrolmarker";
				hint format['Vous avez gagné %1 euros grace à votre patrouille sur zone qui a durée %2 minutes.',_pay,_time];
				patrolmission = 0;};
			};						
		};
	}
	else
	{
		hint "Vous avez déjà une mission de patrouille indiqué en jaune sur la carte.";
	};
}
else
{
	hint "Seule la police peut faire des missions de patrouille.";
};


