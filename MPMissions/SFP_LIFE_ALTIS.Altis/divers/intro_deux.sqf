// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fonction_de_la_sauvegarde_initialise"};

cutText ["... Configuration client en cours ... \n\n ... Patientez ... \n\n ... Intro activée ...","BLACK FADED",0];

if (isnil {['intro_serveur'] call uid_sauvegarde_lire_local_joueur_sfp}) then {['intro_serveur', false] call uid_sauvegarde_ecrire_local_joueur_sfp;};
if (['intro_serveur'] call uid_sauvegarde_lire_local_joueur_sfp) exitwith {finintro = true;};

hintsilent "";

cutText["","BLACK FADED"]; 0 cutFadeOut 9999999;
0 fadeSound 0.5;
0 fadeMusic 0.5;
playSound "Intro";
sleep 0.2;
0 cutText ["", "BLACK FADED",0];	
["<t align='center'><t shadow='1'shadowColor='#000000''color='#01D00D'size='1.9'>SFP Altis Life</t><br/>Inventez votre RP"] call bis_fnc_dynamictext;
0 cutText ["", "BLACK FADED",0];	
["<t align='center'><t shadow='1'shadowColor='#000000''color='#01D00D'size='1.9'>www.sfpteam.fr</t><br/>By Maxou"] call bis_fnc_dynamictext;
0 cutText ["", "BLACK FADED",0];	
["<t align='center'><t shadow='1'shadowColor='#000000''color='#01D00D'size='1.9'>Le Altis Life depuis Avril 2013</t>"] call bis_fnc_dynamictext;
0 cutText ["", "BLACK FADED",0]; 
0 cutFadeOut 9999999;
finintro = true;