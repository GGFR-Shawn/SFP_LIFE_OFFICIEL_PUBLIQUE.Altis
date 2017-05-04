// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if !(cursortarget iskindof "Land_Suitcase_F") exitwith {hint "Impossible ce n'est pas une valise de farming !";};
if (cursortarget getvariable "valiser_de_farming" < 1) exitwith {hint "Impossible ce n'est pas une valise de farming !";};
if (isnil "jai_prit_une_valise") then {jai_prit_une_valise = 0;};
if (jai_prit_une_valise >= 1) exitwith {hint "Désolé, tu as déja une valise !";};
if !(isnil {player getvariable "je_collecte"}) exitwith {hint "Désolé, tu ne peux pas prendre une valise quand tu farmes !";};


la_valise = cursortarget; 

jai_prit_la_valise = 1;
deposer_la_valise = 0;

la_valise attachto [player,[-0.044,-0.06,-0.1],"righthand"];
la_valise setVectorDirAndUp [[0.5,0,0],[0,0,0.5]];
la_valise setvariable ["valise_prise",1,true];
jai_prit_une_valise = 1;

waituntil {sleep 0.5;deposer_la_valise >= 1 or !alive player}; 
la_valise setvariable ["valise_prise",0,true];
jai_prit_la_valise = 0;
detach la_valise; 


