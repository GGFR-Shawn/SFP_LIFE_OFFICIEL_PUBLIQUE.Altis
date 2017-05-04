// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (getPosATL (vehicle player) select 2 > 70) exitwith {0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Désolé, vous êtes trop haut ! Max autorisé %1, actuellement %2 mètres.", 70, round (getPosATL (vehicle player) select 2)],"PLAIN"];};
if ((vehicle player) getvariable "reservoir_d_eau_pour_pompier" <= 0) exitwith {hint "Désolé, votre hélicoptère n'a pas d'eau !";};
_rayon_max_de_proximite_pour_action_sur_le_feu = 50;

[[[player],"divers\nos_entreprises\sarl_pompier\sarl_pompier_client\helicoptere_eau\synchro_animation_helicoptere_eau.sqf"],"BIS_fnc_execVM",true, false] spawn BIS_fnc_MP;

_nombre_d_objet_detecte_en_feu = 0;
{
	if (!isnil {_x getvariable "temps_pour_eteindre_le_feu"}) then
	{
		_quantite_effet_avec_l_eau = round ( 50 + (random 200));
		_nombre_d_objet_detecte_en_feu = round (_nombre_d_objet_detecte_en_feu + 1);
		_type_nom_objet_en_feu = getText ( configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
		
		_x setvariable ["temps_pour_eteindre_le_feu",(_x getvariable "temps_pour_eteindre_le_feu") - _quantite_effet_avec_l_eau,true];
		
		if (_x getvariable "temps_pour_eteindre_le_feu" <= 0) then 
		{
			_x setvariable ["temps_pour_eteindre_le_feu",0,true];
			if (_x getvariable "jesuisenfeu" <= 1) then {deletevehicle _x;};
			if (_x getvariable "jesuisenfeu" >= 2) then {_x setvariable ["jesuisenfeu",nil,true];};
			
			0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n L'objet en feu numéro %1 de type %2 n'à pas été complétement éteint ! \n Il faut refaire un passage ...",_nombre_d_objet_detecte_en_feu, _type_nom_objet_en_feu],"PLAIN"];
		}else
		{
			0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n L'objet en feu numéro %1 de type %2 à été complètement eteint !",_nombre_d_objet_detecte_en_feu, _type_nom_objet_en_feu],"PLAIN"];
		};
	};
} foreach (nearestObjects [player, [], _rayon_max_de_proximite_pour_action_sur_le_feu]);

if (_nombre_d_objet_detecte_en_feu < 1) then
{
	0 cuttext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Aucun feu n'a été trouvé ...","PLAIN"];
};

(vehicle player) setvariable ["reservoir_d_eau_pour_pompier", 0, true];

