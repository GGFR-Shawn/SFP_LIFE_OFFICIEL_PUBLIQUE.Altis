//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {alive player};
waitUntil {!isNil "fin_verification_apres_chargement"};

while {true} do
{
	if (player getvariable "ma_date_de_naissance" < 5) then 
	{
		sleep 120;
		player setvariable ["ma_date_de_naissance", (player getvariable "ma_date_de_naissance") + 2,true];
	}else
	{
		sleep 420;
		player setvariable ["ma_date_de_naissance", (player getvariable "ma_date_de_naissance") + 7,true];
	};
};