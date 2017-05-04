// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side != west) exitwith {};

while {sfp_config_activer_marqueur_gendarmes} do
{
	marker_gendarme_sur_la_carte = [];
	{
		if (side _x == West && isnil {_x getvariable "jai_un_sac_sur_la_tete"}) then
		{
			_marker = createMarkerLocal [name _x, getPosATL _x];
			_marker setMarkerTypeLocal "hd_dot";
			_marker setMarkerColorLocal "ColorBlue";
			_text = format ["%1",name _x];
			_marker setMarkerTextLocal _text;
			marker_gendarme_sur_la_carte = marker_gendarme_sur_la_carte + [_marker];
		};
	} foreach playableUnits;
	
    sleep 3;
	
    {
        deleteMarkerLocal _x;
    } foreach marker_gendarme_sur_la_carte;	
};
