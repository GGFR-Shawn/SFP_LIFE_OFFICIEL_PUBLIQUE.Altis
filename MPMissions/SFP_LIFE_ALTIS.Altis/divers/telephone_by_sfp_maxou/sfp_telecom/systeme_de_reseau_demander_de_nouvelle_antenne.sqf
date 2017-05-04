// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_calcul";
_nombre_max_d_antenne_sur_Altis = 15;
position_desire_antenne_sfp_telecom_valider = false;
position_desire_antenne_sfp_telecom = nil;

if (isnil "distance_interdite_entre_les_antennes_SFP_TELECOM") then {hint "Erreur, variable SFP TELECOM. Contact Maxou.";};
if (isnil "choix_budget_sfp_telecom") then {choix_budget_sfp_telecom = round (random 1); publicvariable "choix_budget_sfp_telecom";};
if (choix_budget_sfp_telecom < 1) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Cher client bonjour \n\n Nous sommes désolés, SFP TELECOM n'a pas le budget necessaire sur ce reboot pour implanter de nouveaux relais ... \n\n Re essayer plus tard. \n Cordialement. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (isnil "antenne_sfp_telecom_en_cours_de_creation") exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Opération impossible, une antenne est déja en cours de traitement. \n Cordialement. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (antenne_sfp_telecom_en_cours_de_creation >= 1) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Opération impossible, une antenne est déja en cours de traitement. \n Cordialement. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};

// Nombre max antennes
{
	if (alive _x) then
	{
		_nombre_max_d_antenne_sur_Altis = round (_nombre_max_d_antenne_sur_Altis - 1);
	};
} foreach allmissionobjects "Land_Communication_F";
if (_nombre_max_d_antenne_sur_Altis <= 0) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Cher client bonjour \n\n Nous sommes désolés, SFP TELECOM à déja dépensé tout son budget pour ce reboot ... \n Cordialement. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};

hint "! SFP TELECOM !\n ------------------------------------- \n Choisissez l'emplacement ou vous souhaitez une nouvelle antenne relais ... \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";

openMap true;
onMapSingleClick "position_desire_antenne_sfp_telecom = _pos; position_desire_antenne_sfp_telecom_valider = true; onMapSingleClick ''; true;";

waitUntil {position_desire_antenne_sfp_telecom_valider or !(visiblemap)};
if (!visibleMap) exitwith {openMap false; hint "! SFP TELECOM !\n ------------------------------------- \n Action annulée ... \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};

_nombre_de_maison_minimum = 5;
_dans_un_rayon_de = 100;
_nombre_de_maison_trouve = 0;
{
	_nombre_de_maison_trouve = round (_nombre_de_maison_trouve + 1);
} foreach (nearestObjects [position_desire_antenne_sfp_telecom, ["House"], _dans_un_rayon_de]);

if (_nombre_de_maison_trouve < _nombre_de_maison_minimum) exitwith
{
	hint format ["! SFP TELECOM !\n ------------------------------------- \n Vous ne pouvez pas poser d'antenne en dehors des villes. \n\n Il faut au minimum %1 maisons et nous en avons trouvé %2. \n Cordialement. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr", _nombre_de_maison_minimum, _nombre_de_maison_trouve];
	openMap false;	
};

if (position_desire_antenne_sfp_telecom_valider && (isOnRoad position_desire_antenne_sfp_telecom or surfaceIsWater position_desire_antenne_sfp_telecom)) exitwith
{
	hint "! SFP TELECOM !\n ------------------------------------- \n Vous ne pouvez pas poser d'antenne relais dans l'eau ou sur la route. \n Cordialement. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";
	openMap false;	
};

openMap false;

if (position_desire_antenne_sfp_telecom_valider) then
{
	_calcul = false; 
	{
		if (alive _x) then
		{
			_calcul = true;
		};
	} foreach (nearestObjects [position_desire_antenne_sfp_telecom, ["Land_Communication_F"], distance_interdite_entre_les_antennes_SFP_TELECOM]);

	if !(_calcul) then
	{
		[[[0,position_desire_antenne_sfp_telecom],"partie_serveur\divers_propre\systeme_dynamique_kebab_etc\antenne_sfp_telecom\systeme_de_reseau_creation_des_antennes.sqf"],"BIS_fnc_execVM",false,false] spawn BIS_fnc_MP;
		hint "! SFP TELECOM !\n ------------------------------------- \n Nous avons bien recu votre demande d'implantation d'une nouvelle antenne. \n\n Veuillez patienter, nous recherchons le meilleur endroit possible. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";
		waitUntil {sleep 0.1; antenne_sfp_telecom_en_cours_de_creation >= 1};
		waitUntil {sleep 0.1; antenne_sfp_telecom_en_cours_de_creation < 1};
		hint "! SFP TELECOM !\n ------------------------------------- \n Nous vous confirmons la nouvelle implantation de l'antenne relais SFP TELECOM. \n Cordialement. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";
	}else
	{
		hint "! SFP TELECOM !\n ------------------------------------- \n Opération impossible, une antenne est trop prête de cette position. \n\n Cordialement. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";
	};
};

