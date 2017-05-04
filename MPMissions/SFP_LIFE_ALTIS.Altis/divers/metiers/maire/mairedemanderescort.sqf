if (jaidemanderlesflics == 0) then
{
	jaidemanderlesflics = 1;
	hint "Tu viens de demander une escorte policière, patiente que la police arrive à la mairie.";
	[[[],"divers\metiers\maire\mairedemanderescortok.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	sleep 30;
	jaidemanderlesflics = 0;
}else
{
	hint "Patiente, tu viens déja de faire une demande !";
};