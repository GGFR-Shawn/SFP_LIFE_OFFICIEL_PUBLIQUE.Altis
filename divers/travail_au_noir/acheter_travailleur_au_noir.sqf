// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// ======================================================= SECURITE ===============================================================
if (!sfp_config_activer_travailleur_au_noir) exitwith {hint "Désolé, l'achat n'est pas possible sur ce serveur.";};
if (revive_mon_side == west) exitwith {hint "Opération impossible ! Seul les civils peuvent faire cette action !";};
if (player getvariable "mon_argent_poche_by_sfp_maxou" < 1000) exitwith {hint "Opération impossible ! Il faut vous 1 000 € en poche ...";};

_max_travailleur = 2;
_compter = 0;
{if (_x getvariable "appartenance_du_bot" == name player) then {_compter = round (_compter + 1);};} foreach allunits;
if (_compter >= _max_travailleur) exitwith {_compter = nil; hint format ["! TRAVAIL AU NOIR ! \n -------------------------------------------- \n\n Désolé, vous avez déja %1 travailleurs illégaux sur l'ile ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr",_max_travailleur];};

// ========================================================= ACTION ====================================================================
_spawn_un_civil = ["C_man_p_fugitive_F_asia","C_man_p_fugitive_F","C_man_polo_6_F_euro","C_man_polo_6_F","C_man_polo_5_F_asia","C_man_polo_5_F_euro","C_man_polo_5_F","C_man_polo_4_F_asia","C_man_polo_4_F","C_man_polo_2_F_afro","C_man_polo_2_F","C_man_polo_1_F_asia","C_man_polo_1_F_afro","C_man_1_1_F"] call BIS_fnc_selectRandom;

_le_pnj_creation = (group player) createUnit [_spawn_un_civil,getPosATL player,[],0,"NONE"];
[_le_pnj_creation] join grpNull;

_le_pnj_creation setvariable ["appartenance_du_bot",name player,true];
_le_pnj_creation setvariable ["je_peux_travailler",0,true];

player setVariable ['mon_argent_poche_by_sfp_maxou', (player getvariable "mon_argent_poche_by_sfp_maxou") - 1000,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
