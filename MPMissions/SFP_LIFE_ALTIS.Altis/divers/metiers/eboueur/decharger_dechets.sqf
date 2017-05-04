if (isnil ("jepeuxdecharger")) exitwith {Hint "Commence a lancer la mission avant de vider ! ;)";};

jevidemesdechetsun = [5188.54,10072.6,0];
jevidemesdechetsdeux = [5188.5,10075.1,0];
jevidemesdechetstrois = [5188.75,10077.6,0];
jevidemesdechetsquatre = [5189,10080.1,0];

if (jepeuxdecharger == 1) then
{
	if (jailequotadedechargement >= 6) then
	{
		jepeuxdecharger = 0;
		Hint "Très bien ! Tu as fait toutes tes collectes sans soucis ! \n\n De ce fait une petite prime va t'être octroyé ;)";
		["ToutesLesCollectes", [ format["Une prime de 1450 € vient de vous être octroyé !",(player getVariable "ma_paye_by_sfp_maxou")] ] ] call bis_fnc_showNotification;
		player setVariable["mon_argent_poche_by_sfp_maxou",(player getVariable "mon_argent_poche_by_sfp_maxou") + 1450,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		sleep 6;
		Hint "Patiente ton camion est entrain d'être vider !";
		sleep 3;
		tasdedechetsviderun = "Land_JunkPile_F" createvehicle getPosATL jevidemesdechetsun;
		sleep 3;
		tasdedechetsviderdeux = "Land_GarbagePallet_F" createvehicle getPosATL jevidemesdechetsdeux;
		sleep 3;
		tasdedechetsvidertrois = "Land_GarbageWashingMachine_F" createvehicle getPosATL jevidemesdechetstrois;
		sleep 3;
		tasdedechetsviderquatre = "Land_JunkPile_F" createvehicle getPosATL jevidemesdechetsquatre;
		sleep 3;
		Hint "Ok ton camion est vide tu peux repartir en collecte si tu le souhaites !";
		jepeuxramasserdechets = 1;
		sleep 60;
		deletevehicle tasdedechetsviderun;
		sleep 1;
		deletevehicle tasdedechetsviderdeux;
		sleep 1;
		deletevehicle tasdedechetsvidertrois;
		sleep 1;
		deletevehicle tasdedechetsviderquatre;
		sleep 1;
	}else
	{
		jepeuxdecharger = 0;
		Hint "Malheureusement, tu n'as pas fait toutes tes collectes ! \n\n De ce fait, tu ne recevras pas de prime ...";
		sleep 6;
		Hint "Patiente ton camion est entrain d'être vider !";
		sleep 3;
		tasdedechetsviderun = "Land_JunkPile_F" createvehicle getPosATL jevidemesdechetsun;
		sleep 3;
		tasdedechetsviderdeux = "Land_GarbagePallet_F" createvehicle getPosATL jevidemesdechetsdeux;
		sleep 3;
		tasdedechetsvidertrois = "Land_GarbageWashingMachine_F" createvehicle getPosATL jevidemesdechetstrois;
		sleep 3;
		tasdedechetsviderquatre = "Land_JunkPile_F" createvehicle getPosATL jevidemesdechetsquatre;
		sleep 3;
		Hint "Ok ton camion est vide tu peux repartir en collecte si tu le souhaites !";
		jepeuxramasserdechets = 1;
		sleep 60;
		deletevehicle tasdedechetsviderun;
		sleep 1;
		deletevehicle tasdedechetsviderdeux;
		sleep 1;
		deletevehicle tasdedechetsvidertrois;
		sleep 1;
		deletevehicle tasdedechetsviderquatre;
		sleep 1;
	};
}else
{
 Hint "Tu n'as pas encore commencer la collecte et tu veux déja vider ?!";
};