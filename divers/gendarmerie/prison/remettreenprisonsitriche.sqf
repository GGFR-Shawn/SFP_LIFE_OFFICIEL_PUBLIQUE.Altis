// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};
sleep 4;
jaitricheralaprison = 1;

if (!isnil {player getvariable "joueur_arreter"}) then
{
	["Jail",["ARRESTED!", "Tu as été RE placé en état d'arrestation !"]] call bis_fnc_showNotification;

	disableUserInput false;
	player playMove "";
	removeAllWeapons player;
	if (!isnil "joueur_en_prison") then {joueur_en_prison = nil;};
	if (isnil {player getvariable "joueur_arreter"}) then {player setVariable["joueur_arreter",true,true];};
	if (!isnil {player getvariable "joueur_menotte"}) then {player setVariable["joueur_menotte",nil,true];};
	sleep 1;
	jai_le_droit_de_me_tp = 1; 
	player setPos (getMarkerPos "marker_prison");

	hint "Tu es retourné en prison pour y avoir été avant de te déconnecter !";
	
	nombredeminutesenprisonsitriche = 15;		
	while {nombredeminutesenprisonsitriche > 0 && alive player} do
	{
		if (!alive player) exitWith {};
		if (isnil "soudoyerlegarde") then {soudoyerlegarde = 0;};
		if (soudoyerlegarde == 1) exitwith {soudoyerlegarde = 0;};
		call compile format [ "['Jail',['ARRESTED','Encore %1 minutes de prison !']] call bis_fnc_showNotification;",nombredeminutesenprisonsitriche];
		sleep 60;
		if (!alive player) exitWith {};
		nombredeminutesenprisonsitriche = nombredeminutesenprisonsitriche - 1;
	};
	if (!alive player) exitWith {};

	["Jail",["Free to go!", "Tu es libéré! Ne triches plus la prochaine fois ;)"]] call bis_fnc_showNotification;
	jai_le_droit_de_me_tp = 1; 
	player setPos (getmarkerpos "respawn_civilian");
	if (!isnil {player getvariable "joueur_arreter"}) then {player setVariable["joueur_arreter",nil,true];};
	jaitricheralaprison = 0;
};
