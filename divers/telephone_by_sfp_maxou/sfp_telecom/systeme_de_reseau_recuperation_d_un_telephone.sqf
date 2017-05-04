// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_detection_recuperation_du_telephone_by_maxou = (nearestObjects [getPosATL player, ['Land_MobilePhone_smart_F'], 5]);
if (count _detection_recuperation_du_telephone_by_maxou < 1) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Désolé, \n\n Aucun téléphone n'a été trouvé !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (player getvariable "je_possede_un_telephone_sfp" select 0 >= 1) exitwith {hint "! SFP TELECOM !\n ------------------------------------- \n Désolé, \n\n Vous possédez déja un téléphone !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
_recuperation_du_telephone_by_maxou = _detection_recuperation_du_telephone_by_maxou select 0;

_valeur = round (_recuperation_du_telephone_by_maxou getvariable "je_possede_un_telephone_sfp" select 2);

player setvariable ["je_possede_un_telephone_sfp", [1, 1, _valeur], true];

player action ["TakeMine", player];

deletevehicle _recuperation_du_telephone_by_maxou;

hint format ["! SFP TELECOM !\n ------------------------------------- \n Le téléphone à bien été récupéré avec un crédit de %1 textos restant. ;)\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr",_valeur];
