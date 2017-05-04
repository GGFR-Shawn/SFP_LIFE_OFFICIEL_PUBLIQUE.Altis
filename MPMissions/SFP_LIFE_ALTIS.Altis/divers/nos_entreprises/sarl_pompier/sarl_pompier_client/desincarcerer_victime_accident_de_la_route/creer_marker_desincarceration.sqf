// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_voiture_de_desincarceration = _this select 0;
_position_du_marker_de_desincarceration = _this select 1;
if (isnull _la_voiture_de_desincarceration) exitwith {};

createMarkerLocal ["joueur_incarcere", _position_du_marker_de_desincarceration];
"joueur_incarcere" setMarkerShapeLocal "ICON";
"joueur_incarcere" setMarkerColorLocal "ColorRed";	
"joueur_incarcere" setMarkerSizeLocal [2,2];
"joueur_incarcere" setMarkerTypeLocal "hd_dot";
"joueur_incarcere" setMarkerTextLocal "Joueur Incarcéré !";

if !(player in list sarl_pompier) then
{
	["Incarceration",["Joueur incarcéré, consultez la carte !", ""]] call bis_fnc_showNotification;
};
if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then
{
	[] spawn
	{
		for "_i" from 0 to 4 do
		{
			player say "beeper_pompier_sfp";
			sleep 1;
		};
	};
};
tombe_sirene_pompier say "pompier_depart_sap";

_nombre_avertissement_joueur_incarcere = 4;
while {_nombre_avertissement_joueur_incarcere > 0} do
{
	sleep 1;
	player globalchat "Un joueur est incarcéré dans un véhicule, regardez la carte pour le trouver !";
	_nombre_avertissement_joueur_incarcere = round (_nombre_avertissement_joueur_incarcere - 1);
};

waituntil {sleep 1; isnil {_la_voiture_de_desincarceration getvariable "attente_pompier_desincarceration"} or !alive _la_voiture_de_desincarceration};

deletemarkerlocal "joueur_incarcere";
