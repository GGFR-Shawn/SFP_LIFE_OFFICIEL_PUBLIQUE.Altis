//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

// ======================================================= SECURITE ===============================================================
if (revive_mon_side != west) exitwith {hint "Opération impossible ! Seul les gendarmes peuvent faire cette action !";};

_max_chien = 1;
_compter = 0;
{if (_x getvariable "appartenance_du_chien_by_sfp_maxou" == name player) then {_compter = round (_compter + 1);};} foreach allunits;
if (_compter >= _max_chien) exitwith {hint format ["! CHIEN D'ATTAQUE ! \n -------------------------------------------- \n\n Désolé, vous avez déja %1 chien d'attaque sur l'ile ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr",_max_chien];};

// ========================================================= ACTION ====================================================================
waituntil {!isnil "spawn_un_chien_d_attaque_by_sfp_maxou"};


_spawn_le_chien_d_attaque = spawn_un_chien_d_attaque_by_sfp_maxou call BIS_fnc_selectRandom;

_le_chien_d_attaque_creation = (group player) createUnit [_spawn_le_chien_d_attaque,getPosATL player,[],0,"NONE"];
[_le_chien_d_attaque_creation] join grpNull;

_le_chien_d_attaque_creation setvariable ["appartenance_du_chien_by_sfp_maxou",name player,true];
_le_chien_d_attaque_creation setvariable ["je_peux_attaquer_chien_attaque_by_sfp_maxou",0,true];
_le_chien_d_attaque_creation setvariable ["chien_d_attaque_attache_voiture_by_sfp_maxou",0,true];
_le_chien_d_attaque_creation setvariable ["chien_d_attaque_pas_bouger_by_sfp_maxou",true,false];

_le_chien_d_attaque_creation switchmove "";sleep 0.045;
[_le_chien_d_attaque_creation] joinSilent player;
_le_chien_d_attaque_creation stop true; 

[_le_chien_d_attaque_creation] execvm "divers\gendarmerie\chien_d_attaque\desactiver_approche_joueur.sqf";

hint "Chien d'attaque acheté ...";