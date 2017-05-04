// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_position_de_la_gendarmerie";
[] call detection_du_joueur_arrete_gendarmerie;
if (!(player in list gendarmedanslagendarmerie_un)) exitwith {Hint "Désolé, tu dois être proche de la gendarmerie pour mettre une personne en garde a vue !";};
if (player in list gendarmedanslagendarmerie_un) then {_position_de_la_gendarmerie = "à Neochori";};

detach le_joueur_arrete_gendarmerie;
[[[le_joueur_arrete_gendarmerie, player, _position_de_la_gendarmerie],"divers\gendarmerie\garde_a_vue\garde_a_vue_2.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;