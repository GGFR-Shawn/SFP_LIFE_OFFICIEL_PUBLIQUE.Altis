// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "liste_de_mes_maisons") then {liste_de_mes_maisons = [];};
if (count liste_de_mes_maisons < 1) exitwith {hint "! MES MAISONS ! \n -------------------------------------------- \n \n Désolé, aucunes maisons n'a encore été detectées. \n\n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";}; 	

closedialog 0;

if (!visibleMap) then {openMap [true, false];};
waituntil {visibleMap};

waitUntil {!(isNull (findDisplay 12))};
disableSerialization;

for "_i" from 0 to (count liste_de_mes_maisons - 1) do
{
	if (visibleMap) then
	{
		verif_maison_check = nearestObjects [liste_de_mes_maisons select _i, ["house"], 50] select 0;
		if (!isnil "verif_maison_check") then
		{
			if (verif_maison_check getvariable "proprietaire_de_la_maison" select 0 == name player) then 
			{
				_control_carte = (findDisplay 12) displayCtrl 51;	
				_control_carte ctrlMapAnimAdd [0.6, 0.001, liste_de_mes_maisons select _i];
				ctrlMapAnimCommit _control_carte;
				
				waituntil {ctrlMapAnimDone _control_carte};
				
				liste_de_mes_maisons select _i spawn
				{
					_nom_du_marqueur = format ["%1%2",name player, _this select 0];
					_le_marqueur = createMarkerlocal [_nom_du_marqueur, _this];
					_le_marqueur setMarkerShapelocal "ICON";
					_le_marqueur setMarkerColorlocal "ColorBlue";
					_le_marqueur setMarkerSizelocal [1,1];
					_le_marqueur setMarkerTypelocal "hd_dot";
					_le_marqueur setMarkerTextlocal "Maison vous appartenant.";
					waituntil {!visibleMap};
					deletemarkerlocal _le_marqueur;
				};
				
				player globalchat format ["Maison numéro %1 affichée ...",round (_i + 1)];
				
				sleep 1;
				
				_control_carte = (findDisplay 12) displayCtrl 51;	
				_control_carte ctrlMapAnimAdd [1.5, 0.8, liste_de_mes_maisons select _i];
				ctrlMapAnimCommit _control_carte;
				
				sleep 3;
			};
		};
	};
};

waituntil {!visibleMap};
execvm "divers\tablette_sfp\initialisation_tablette_sfp.sqf";