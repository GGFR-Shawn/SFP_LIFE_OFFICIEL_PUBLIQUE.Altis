if (isnil "checkpointgang") then {checkpointgang = 0;};

if (!isnil {player getvariable "licence_gang_v2"}) then 
{
	if (checkpointgang == 0) then
	{
		hint "Le checkpoint est sous notre controle !";
		[[[],"divers\gendarmerie\mission_de_patrouille\joueur_son_cp_3.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		checkpointgang = 1;
		_start = time;
		waitUntil {!(vehicle player in list checkpointduty3)};
		_finish = time - _start;
		_pay = ceil(_finish * 3) / 1.5;
		_time = ceil(_finish / 60);
		player setVariable ["mon_argent_banque_by_sfp_maxou", (player getVariable "mon_argent_banque_by_sfp_maxou") + _pay,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		checkpointgang = 0;
		hint format['Vous avez gagné %1 euros grace à la garde du poste de contrôle qui a durée %2 minutes.',_pay,_time];
	}else
	{
		hint "Le checkpoint est déja sous votre controle";
	};
}else
{
hint "Seul les gangs peuvent prendre le checkpoint !";
};