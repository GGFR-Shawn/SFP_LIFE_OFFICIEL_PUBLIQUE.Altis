// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_chercher"];
if (isnil "mission_livraison_colis") then {mission_livraison_colis = 0;};
if (mission_livraison_colis >= 1) exitwith {hintsilent "! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Vous avez déja une livraison ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
mission_livraison_colis = 1;
colis_livraison_livre = nil;

_nombre_de_relance = 5; 
while {_nombre_de_relance > 0} do 
{
	_nombre_de_relance = _nombre_de_relance - 1; 
	hintsilent "! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Bienvenu en tant que livreur de COLIS ;) \n\n Pour cette mission, tu devras livrer le colis au PNJ (mobile ou non) indiqué sur la carte grace au point jaune. \n\n Ce petit boulot te fera gagner de l'argent ! \n\n Patiente, je recherche une personne ayant besoin d'une livraison. \n\n Bon courage ;) \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	sleep 2;
};

hintsilent "! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Recherche d'une mission ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

_mission_livraison_trouve = false;
while {!_mission_livraison_trouve} do 
{
	_position_une_random = [(random 40000), (random -40000)] call BIS_fnc_selectRandom;
	_position_deux_random = [(random 40000), (random -40000)] call BIS_fnc_selectRandom;
	_pos = [_position_une_random,_position_deux_random,0];
	_chercher = nearestObjects [_pos, ["House"], 40];

	if (count _chercher > 0) then
	{
		if (({isPlayer _x} count (position (_chercher select 0) nearEntities ["man", 30]) < 1) && player distance position (_chercher select 0) > 400) then
		{
			_mission_livraison_trouve = true;
			_chercher = _chercher select 0;
		};
	};
};

_position_trouve = position _chercher;
_distance_de_livraison = player distance _position_trouve;
_argent_a_gagner_sfp_maxou = round (_distance_de_livraison * sfp_config_pourcentage_gain_mission_courrier);

hintsilent "! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Un PNJ à besoin d'un colis ! \n\n Retrouve le sur ta carte (position indiqué en jaune) pour le lui livrer. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

_spawn_un_civil = ["C_man_p_fugitive_F_asia","C_man_p_fugitive_F","C_man_polo_6_F_euro","C_man_polo_6_F","C_man_polo_5_F_asia","C_man_polo_5_F_euro","C_man_polo_5_F","C_man_polo_4_F_asia","C_man_polo_4_F","C_man_polo_2_F_afro","C_man_polo_2_F","C_man_polo_1_F_asia","C_man_polo_1_F_afro","C_man_1_1_F"] call BIS_fnc_selectRandom;
_le_pnj_creation = (group player) createUnit [_spawn_un_civil,_position_trouve,[],0,"NONE"];
[_le_pnj_creation] join grpNull;
_le_pnj_creation setvariable ["pnj_livraison_a_supprime", true, false];
_addaction_pnj = _le_pnj_creation addAction ["<t color=""#4FD5D6"">" + "Le Lui Livrer !",{{if (!isnil {_x getvariable "pnj_livraison_a_supprime"}) then {colis_livraison_livre = true; sleep 3; deletevehicle _x;};} foreach ((getPosATL player) nearEntities ["man", 30])},[], 15, true, true, '','player distance _this < 8'];

_nom_du_marker_mission_livraison = format ["colis_pos_%1", _position_trouve select 0];
_repere_du_marker = createMarkerlocal [_nom_du_marker_mission_livraison, _position_trouve];
_repere_du_marker setMarkerColorlocal "ColorYellow";
_repere_du_marker setMarkerShapelocal "ICON";
_repere_du_marker setMarkerTypelocal "mil_circle";
_repere_du_marker setMarkerSizelocal [1.2, 1.2];
_nom_du_marker_mission_livraison setMarkerTextlocal " Colis a livrer ici !";

while {alive _le_pnj_creation && alive player && isnil "colis_livraison_livre"} do
{
	if (player distance _le_pnj_creation > 1000) then 
	{
		_calcul_distance = round ((player distance _le_pnj_creation) / 1000);
		titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Distance à parcourir : %1 Kms / %2 Kms. \n Argent à gagner : %3 %4.", _calcul_distance, round ((_distance_de_livraison) / 1000), _argent_a_gagner_sfp_maxou, '€'],"PLAIN",1];
	}else
	{
		_calcul_distance = round (player distance _le_pnj_creation);
		titletext [format ["\n\n\n\n\n\n\n\n\n\n\n Distance à parcourir : %1 Mètres / %2 Mètres. \n Argent à gagner : %3 %4.", _calcul_distance, _distance_de_livraison, _argent_a_gagner_sfp_maxou, '€'],"PLAIN",1];
	};
	
	_repere_du_marker setMarkerPoslocal (position _le_pnj_creation);

	sleep 1;
};

mission_livraison_colis = 0;
deletemarker _repere_du_marker;

if (!alive player) exitwith
{
	deletevehicle _le_pnj_creation;
	waituntil {sleep 2; alive player};
	sleep 6;
	hintsilent "! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Mission terminé ! Vous n'avez pas gagné d'argent car vous êtes mort ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	titletext ["! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Mission terminé ! Vous n'avez pas gagné d'argent car vous êtes mort ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou","PLAIN",1];
};

if (!alive _le_pnj_creation) exitwith
{
	deletevehicle _le_pnj_creation;
	hintsilent "! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Mission terminé ! Vous n'avez pas gagné d'argent car le PNJ est mort ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";
	titletext ["! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Mission terminé ! Vous n'avez pas gagné d'argent car le PNJ est mort ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou","PLAIN",1];
};

hintsilent format ["! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Mission terminé ! Vous avez remporté %1 Euros ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", _argent_a_gagner_sfp_maxou];
titletext [format ["! LIVREUR DE COLIS ! \n -------------------------------------------- \n \n Mission terminé ! Vous avez remporté %1 %2 ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", _argent_a_gagner_sfp_maxou, '€'],"PLAIN",1];
player setVariable ['mon_argent_poche_by_sfp_maxou',(player getVariable 'mon_argent_poche_by_sfp_maxou') + _argent_a_gagner_sfp_maxou,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 

