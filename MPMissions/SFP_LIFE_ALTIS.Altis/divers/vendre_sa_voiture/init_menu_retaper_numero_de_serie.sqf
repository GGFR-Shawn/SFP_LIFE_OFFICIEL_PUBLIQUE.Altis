// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!sfp_config_activer_retaper_numero_de_serie) exitwith {hint "Désolé, cette fonction n'est pas autorisé sur ce serveur.";};
if (isnil "message_numero_de_serie") then {	message_numero_de_serie = 1; hint "N'oublie pas de la jouer RP pour garder cette fonction ;)"; sleep 2;};

if (cursortarget getvariable "vehicule_info_parvariable" select 0 == "Vehicule de marchandise") exitwith {hint "Désolé, ce véhicule n'est pas sauvegardable !";};
if (cursortarget getvariable "vehicule_info_parvariable" select 0 == "Vehicule de refuel") exitwith {hint "Désolé, ce véhicule n'est pas sauvegardable !";};
if (cursortarget getvariable "vehicule_info_parvariable" select 0 == name player) exitwith {hint "Désolé, c'est déja ton véhicule !";};

//---------------------------------------------------------------- Explication ----------------------------------------------------------------------------
hint "! TRAFFIC NUMEROS ! \n -------------------------- \n\n Salut à toi, le fonctionnement est simple : \n\n 1) Il te suffit de pointer ta souris sur le véhicule que tu souhaites retaper ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";

//------------------------------------------------------------- Selection du véhicule ----------------------------------------------------------------------------
waituntil {cursortarget iskindof "LandVehicle"};
_levehiculepournumerodeserie = cursortarget;
_cestpourqui = cursortarget getvariable "vehicule_info_parvariable" select 0;
hint format ["! TRAFFIC NUMEROS ! \n -------------------------- \n\n 2) Très bien, Le véhicule de %1 à bien été selectionné ! \n\n 3) Tu vas maintenant retaper les numéros de serie ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou",_cestpourqui];

//------------------------------------------------------------- Lancement du script ----------------------------------------------------------------------------
if (isnil {_levehiculepournumerodeserie getvariable "temps_numero_de_serie"}) then {_temps_numero_de_serie = round ( 60 + (random 500));_levehiculepournumerodeserie setvariable ["temps_numero_de_serie",_temps_numero_de_serie,true];};
sleep 5;
_temps_numero_de_serie = _levehiculepournumerodeserie getvariable "temps_numero_de_serie";
player playActionNow "medicstartup";
_jefaisleson = 0;
_levehiculepournumerodeserie say "coupdemarteau";
while {alive player and (player distance _levehiculepournumerodeserie) < 5 and speed _levehiculepournumerodeserie < 0.2 && _temps_numero_de_serie > 0} do 
{
	_temps_numero_de_serie = _levehiculepournumerodeserie getvariable "temps_numero_de_serie";
	_temps_numero_de_serie = round (_temps_numero_de_serie - 1);
	_levehiculepournumerodeserie setvariable ["temps_numero_de_serie",_temps_numero_de_serie,true];
	titleText [format["Encore %1 secondes avant la fin de ton traffic ;)", _temps_numero_de_serie], "PLAIN DOWN"];
	_jefaisleson = _jefaisleson + 1;
	if (_jefaisleson == 4) then {player playActionNow "medicstartup";_levehiculepournumerodeserie say "coupdemarteau";_jefaisleson = 0;};
	sleep 1;
};

//------------------------------------------------------------- Fin du script ----------------------------------------------------------------------------
if (speed _levehiculepournumerodeserie > 0.2) then {hint "! TRAFFIC NUMEROS ! \n -------------------------- \n\n Traffic annulé, le véhicule à bouger ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (player distance _levehiculepournumerodeserie > 5) then {hint "! TRAFFIC NUMEROS ! \n -------------------------- \n\n Traffic annulé, Tu n'es plus assez proche du véhicule ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (_temps_numero_de_serie <= 0) then {_levehiculepournumerodeserie setvariable ["vehicule_info_parvariable",[name player],true]; hint "! TRAFFIC NUMEROS ! \n -------------------------- \n\n Le numéro de série du véhicule à bien été changé ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};

