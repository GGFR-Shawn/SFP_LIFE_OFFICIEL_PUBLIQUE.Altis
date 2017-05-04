// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

sleep (1200 + (random 600));

if (deplacement_valide == "Oui") then 
{
	_nomdusecteur = ["Neochori","Alikampos","Edessa","Dorida","Agios Konstantinos","kalithea","Zaros","Chalkeia","poliakko","Kavala","Lakka","Therisa","Neochori","Pyrgos","Agios_dionysios","Charkia","Stravos","Panochori"];
	nomdusecteur_valide = _nomdusecteur call BIS_fnc_selectRandom;
};

if (nomdusecteur_valide == "Neochori") then {nomdusecteur_valide_pour_marker = Neochori;};if (nomdusecteur_valide == "Alikampos") then {nomdusecteur_valide_pour_marker = Alikampos;};if (nomdusecteur_valide == "Edessa") then {nomdusecteur_valide_pour_marker = Edessa;};if (nomdusecteur_valide == "Dorida") then {nomdusecteur_valide_pour_marker = Dorida;};
if (nomdusecteur_valide == "kalithea") then {nomdusecteur_valide_pour_marker = kalithea;};if (nomdusecteur_valide == "Zaros") then {nomdusecteur_valide_pour_marker = Zaros;};if (nomdusecteur_valide == "Chalkeia") then {nomdusecteur_valide_pour_marker = Chalkeia;};if (nomdusecteur_valide == "poliakko") then {nomdusecteur_valide_pour_marker = poliakko;};if (nomdusecteur_valide == "Kavala") then {nomdusecteur_valide_pour_marker = Kavala;};
if (nomdusecteur_valide == "Lakka") then {nomdusecteur_valide_pour_marker = Lakka;};if (nomdusecteur_valide == "Therisa") then {nomdusecteur_valide_pour_marker = Therisa;};if (nomdusecteur_valide == "Neochori") then {nomdusecteur_valide_pour_marker = Neochori;};if (nomdusecteur_valide == "Pyrgos") then {nomdusecteur_valide_pour_marker = Pyrgos;};
if (nomdusecteur_valide == "Agios_dionysios") then {nomdusecteur_valide_pour_marker = Agios_dionysios;};
if (nomdusecteur_valide == "Charkia") then {nomdusecteur_valide_pour_marker = Charkia;};if (nomdusecteur_valide == "Stravos") then {nomdusecteur_valide_pour_marker = Stravos;};
if (nomdusecteur_valide == "Panochori") then {nomdusecteur_valide_pour_marker = Panochori;};


["Clock", ["TON PATRON","Ton patron à une mission à te confier !"] ] call bis_fnc_showNotification;
_temps = 10 + (random 20);
_temps = floor _temps;
hint format ["! TRAVAIL ! \n -------------------------------------------- \n \n Ton patron à une mission pour toi. \n\n Consultes ta carte et rends toi y ! \n\n Attention tu as %1 minutes pour la terminer ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_temps];

createMarkerLocal ["missionelectricien", (getPosATL nomdusecteur_valide_pour_marker)];
"missionelectricien" setMarkerShapeLocal "ICON";
"missionelectricien" setMarkerColorLocal "ColorYellow";
"missionelectricien" setMarkerSizeLocal [2,2];
"missionelectricien" setMarkerTypeLocal "hd_dot";
"missionelectricien" setMarkerTextLocal "Mission de ton patron !";

execvm "divers\offres_d_emplois\metiers_pour_missions\electricien\mission_une_electricien\commencer_quand_sur_place_electricien.sqf";

player setVariable["jesuisalleralamissiondemonpatron",0,false];
sleep 20;
while {_temps > 0 && player getVariable "jesuisalleralamissiondemonpatron" <= 0} do
{
	hint format ["! TRAVAIL ! \n -------------------------------------------- \n \n Attention, il te reste encore %1 minutes pour faire la mission de ton patron ou tu seras viré ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_temps];	
	sleep 60;
	_temps = _temps - 1;
};
if ((_temps <= 0) && ((player getVariable "jesuisalleralamissiondemonpatron") <= 0)) then {execvm "divers\offres_d_emplois\metiers_pour_missions\electricien\mission_une_electricien\supprimer_mission_electricien_si_pas_etaient.sqf";};
