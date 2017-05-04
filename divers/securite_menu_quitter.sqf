// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {!isNil "fin_verification_apres_chargement"};
waitUntil {!isNil "sfp_config_liste_moderateur"};

if (debug_mission_pour_dev) exitwith {};
if (getplayeruid player in sfp_config_liste_moderateur) exitwith {};

while {true} do
{
	private["_bouton_quitter","_boutton_respawn","_boutton_manuel"];
	
	waitUntil {sleep 0.2; !isNull (findDisplay 49)};

	disableSerialization;

	_bouton_quitter = (findDisplay 49) displayCtrl 104;
	_boutton_respawn = (findDisplay 49) displayCtrl 1010;
	_boutton_manuel = (findDisplay 49) displayCtrl 122;
	
	_boutton_manuel ctrlEnable false;
	_bouton_quitter ctrlEnable false;
	_boutton_respawn ctrlEnable false;

	if ({isplayer _x} count (nearestObjects [player, ["MAN"], 20]) > 1) then
	{
		_boutton_respawn ctrlSetText "Trop près d'un joueur !";
		_bouton_quitter ctrlSetText "Trop près d'un joueur !";
		_bouton_quitter ctrlCommit 0;
		_boutton_respawn ctrlCommit 0;
		waitUntil {sleep 0.1; isNull (findDisplay 49)};
	};	

	if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) then
	{
			_boutton_respawn ctrlSetText "Impossible, sac sur la tete !";
			_bouton_quitter ctrlSetText "Impossible, sac sur la tete !";
			_bouton_quitter ctrlCommit 0;
			_boutton_respawn ctrlCommit 0;
			waitUntil {sleep 0.1; isNull (findDisplay 49)};
	};

	if (!isnil {player getvariable "joueur_menotte"}) then
	{
			_boutton_respawn ctrlSetText "Impossible, vous êtes menotté !";
			_bouton_quitter ctrlSetText "Impossible, vous êtes menotté !";
			_bouton_quitter ctrlCommit 0;
			_boutton_respawn ctrlCommit 0;
			waitUntil {sleep 0.1; isNull (findDisplay 49)};
	};

	_boutton_respawn ctrlEnable true;
	_bouton_quitter ctrlEnable true;
	_boutton_respawn ctrlSetText "Vous pouvez respawn !";
	_bouton_quitter ctrlSetText "Vous pouvez quitter !";
	
	_application_son_respawn = _boutton_respawn ctrlAddEventHandler ["MouseButtonDown",{[player, position player] spawn {_player = _this select 0; _pos = _this select 1; waitUntil {isNull (findDisplay 49) or !alive _player}; if !(alive _player) then {[[[_pos, "bruit_respawn"], "divers\divers\synchronisation_son_respawn.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;};};}]; 
	
	// Forcer sauvegarde automatique quand echap
	if (vehicle player == player) then
	{	
		[_boutton_manuel, _bouton_quitter, _boutton_respawn] spawn 
		{
			disableSerialization;
			_boutton_manuel = _this select 0;
			_bouton_quitter = _this select 1;
			_boutton_respawn = _this select 2;
			if (isnil "_boutton_manuel" or isnil "_bouton_quitter" or isnil "_boutton_respawn") exitwith {};
			
			if (isnil "relire_toute_ma_sauvegarde_confirme_attente") then
			{
				relire_toute_ma_sauvegarde_confirme_attente = true;
				relire_toute_ma_sauvegarde = "oui";
				forcer_re_sauvegarde = true;
				
				_boutton_respawn ctrlEnable false;
				_bouton_quitter ctrlEnable false;
				_bouton_quitter ctrlCommit 0;
				_boutton_respawn ctrlCommit 0;
				disableUserInput true;
				
				_attente = 20;
				for "_i" from 1 to _attente do
				{
					_boutton_respawn ctrlSetText format ["Backup Auto En Cours ! (%1 Secondes).",round (_attente - _i)];
					_bouton_quitter ctrlSetText format ["Backup Auto En Cours ! (%1 Secondes).",round (_attente - _i)];
					sleep 1;
				};
				
				_boutton_respawn ctrlEnable true;
				_bouton_quitter ctrlEnable true;
				_boutton_respawn ctrlSetText "Vous pouvez respawn !";
				_bouton_quitter ctrlSetText "Vous pouvez quitter !";
				disableUserInput false;

				[] spawn
				{
					sleep (round (60 * 20));
					relire_toute_ma_sauvegarde_confirme_attente = nil;
				};
			}else
			{
				_boutton_respawn ctrlSetText "Pas De Backup Auto De Dispo.";
				_bouton_quitter ctrlSetText "Pas De Backup Auto De Dispo.";
				sleep 4;
				_boutton_respawn ctrlSetText "Vous pouvez respawn !";
				_bouton_quitter ctrlSetText "Vous pouvez quitter !";
			};
		};
	};
		
	waitUntil {sleep 0.1; isNull (findDisplay 49)};
	
	_boutton_respawn ctrlRemoveEventHandler ["MouseButtonDown", _application_son_respawn];	
};