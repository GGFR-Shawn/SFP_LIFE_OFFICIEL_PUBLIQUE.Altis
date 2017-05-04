// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "joueurlumiere") then {joueurlumiere = 0;};

le_prix_de_larticle = 7;
le_nom_de_larticle = "chemlight sarl DIR";

if (joueurlumiere >= 1) exitwith {hint "Tu en est déja équipé !";};
if ((player getVariable "mon_argent_banque_by_sfp_maxou") < le_prix_de_larticle) exitwith {Hint format ["Tu n'as pas assez d'argent. Tu as actuellement %1 Euros et tu as besoin de %2 Euros !",(player getVariable 'mon_argent_banque_by_sfp_maxou'),(le_prix_de_larticle)];};

joueurlumiere = 1;
hint "Le chemlight à bien été installé sur toi, il te reste plus qu'à te ballader !";

detacher_chemlight = {detach lumierechemlightjoueur; player removeaction chemlightaction; joueurlumiere = 0;};

lumierechemlightjoueur = "Chemlight_yellow" createVehicle (getPosATL player);
lumierechemlightjoueur attachTo [player,[0,0,1.2]];
player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable "mon_argent_banque_by_sfp_maxou") - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

chemlightaction = player addAction ['Deposer le chemlight (DIR)', detacher_chemlight,[],7,true,true,'','']; 
sleep 1;
hint format["Le chemlight à bien été installé sur toi, il te reste plus qu'à te ballader ! \n\n Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

waituntil {sleep 1; !alive player or joueurlumiere < 1};
if (joueurlumiere >= 1) then {[] call detacher_chemlight;};