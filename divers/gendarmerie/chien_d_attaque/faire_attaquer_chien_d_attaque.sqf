//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_la_personne_a_attaquer = _this select 0;
_mon_chien = _this select 1;
_nom_du_gendarme = _this select 2;
_distance_max_attaque = 2;

_mon_chien doMove (getPosATL _la_personne_a_attaquer);
_mon_chien lookAt _la_personne_a_attaquer;
[_mon_chien] joinSilent grpNull;
_mon_chien stop false; 
_mon_chien setUnitPos "AUTO";

[[[_mon_chien,"1"],"divers\gendarmerie\chien_d_attaque\son_quand_attaque_chien.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
choix_delai_aboiement = nil;

while {alive _la_personne_a_attaquer && alive _mon_chien && _mon_chien distance _la_personne_a_attaquer > _distance_max_attaque && je_lance_l_attaque_de_mon_chien >= 1} do
{
	sleep 0.3;
	_mon_chien doMove (getPosATL _la_personne_a_attaquer);
	
	// Aboiement
	if (isnil "choix_delai_aboiement") then {choix_delai_aboiement = 3;};
	choix_delai_aboiement = choix_delai_aboiement - 0.3;

	if (choix_delai_aboiement <= 0) then
	{
		[[[_mon_chien],"divers\gendarmerie\chien_d_attaque\son_quand_attaque_chien.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		choix_delai_aboiement = nil,
	};
};

if (je_lance_l_attaque_de_mon_chien < 1) exitwith 
{
	titleText [format["Votre chien %1 arrete son attaque et va revenir vers vous !",name _mon_chien],"PLAIN"];	
};

if (!alive _la_personne_a_attaquer or !alive _mon_chien) then 
{
	je_lance_l_attaque_de_mon_chien = 0;
}else
{
	[[[_la_personne_a_attaquer,_nom_du_gendarme],"divers\gendarmerie\chien_d_attaque\effet_attaque_du_chien.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	
	
	[_mon_chien] joinSilent player;
	_mon_chien stop false; 
	_mon_chien setUnitPos "AUTO";
	
	je_lance_l_attaque_de_mon_chien = 0;
	titleText [format["Votre chien %1 à bien réussi à attaquer %2 !",name _mon_chien, name _la_personne_a_attaquer],"PLAIN"];	
};