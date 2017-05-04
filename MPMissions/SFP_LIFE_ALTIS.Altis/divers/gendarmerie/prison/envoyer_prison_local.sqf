// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitwith {hint "Tu ne peux pas car le serveur va redémarrer dans moins de 20 minutes !";};
if !(player in list jesuisdevantlaprison) exitwith {Hint "Désolé, tu dois être dans la prison pour pouvoir le mettre en cellule !";}; 

[] call detection_du_joueur_arrete_gendarmerie;
_shooter = player;

createDialog "TempsDePrison";
ctrlSetText[11115,format["Choisir le temps de prison en minutes."]];

waituntil {!isnil "tempsdeprisonenminutes"};

_letemps = tempsdeprisonenminutes;

[[[le_joueur_arrete_gendarmerie,_shooter,_letemps],"divers\gendarmerie\prison\envoyer_prison_synchronisation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
detach le_joueur_arrete_gendarmerie;

sleep 1;
tempsdeprisonenminutes = nil;
