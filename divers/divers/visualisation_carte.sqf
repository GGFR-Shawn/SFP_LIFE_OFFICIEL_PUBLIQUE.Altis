// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; !isnil "fin_verification_apres_chargement" && !isnil "uid_sauvegarde_lire_local_joueur_sfp"};
sleep 5;

[] spawn
{
	if (isnil {['centrage_carte'] call uid_sauvegarde_lire_local_joueur_sfp}) then {['centrage_carte', true] call uid_sauvegarde_ecrire_local_joueur_sfp;};
	
	while {true} do
	{
		waituntil {sleep 1; visibleMap};
		
		map_sfp_ouverte = true;		
		
		_nom_marqueur = format ["position_%1",name player];
		_marqueur_ma_position = createMarkerLocal [_nom_marqueur, getPosATL player];
		_marqueur_ma_position setMarkerColorLocal "ColorRed";
		_marqueur_ma_position setMarkerShapeLocal "ICON";
		_marqueur_ma_position setMarkerTypeLocal "mil_arrow2";
		_marqueur_ma_position setMarkerDirLocal (getdir player);
		
		if !(['centrage_carte'] call uid_sauvegarde_lire_local_joueur_sfp) then
		{
			_marqueur_ma_position setMarkerSizeLocal [1, 1];
		}else
		{
			waitUntil {!(isNull (findDisplay 12))};
			disableSerialization;

			_control_carte = (findDisplay 12) displayCtrl 51;	
			_control_carte ctrlMapAnimAdd [1, 0.15, getPosATL player];
			ctrlMapAnimCommit _control_carte;
			
			_marqueur_ma_position spawn
			{
				_marqueur_ma_position = _this;
				_valeur_taille_default = 300;
				_temps_maj = 0.01;
				_division = 30;
				_saut = 20;
				
				_marqueur_ma_position setMarkerSizeLocal [0, 0];
				for "_i" from 0 to _valeur_taille_default step _saut do
				{
					_marqueur_ma_position setMarkerSizeLocal [_i / _division, _i / _division];
					sleep _temps_maj;
				};
				
				for "_i" from 0 to _valeur_taille_default step _saut do
				{
					_calcul = ((_valeur_taille_default - _i) / _division);
					_marqueur_ma_position setMarkerSizeLocal [_calcul, _calcul];
					sleep _temps_maj;
				};
				
				_marqueur_ma_position setMarkerSizeLocal [1, 1];			
			};
		};
		
		while {visibleMap} do
		{
			_marqueur_ma_position setMarkerPosLocal (getPosATL player);
			sleep 0.001;
		};
		
		deletemarkerlocal _nom_marqueur;
		map_sfp_ouverte = nil;
	};
};
