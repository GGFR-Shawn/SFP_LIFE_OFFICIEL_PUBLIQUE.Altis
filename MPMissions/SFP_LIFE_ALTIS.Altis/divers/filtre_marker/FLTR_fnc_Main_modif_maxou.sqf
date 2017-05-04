// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Modifié et Adapté par sfp maxou pour notre mission

FLTR_fnc_TreeSel = 
{
	params ["_crtl","_index","_alpha"];
	_tree = ((findDisplay 12) displayCtrl (2103));
	_indexNum = _index select 0;
	if ((count _index) == 1) then
	{
		_sizeIndex = _tree tvCount [];		
		switch (_indexNum) do 
		{
			case 0: { 
						_alpha = 0;
						for "_i" from 3 to (_sizeIndex -1) do
						{		
							// _tree tvSetPicture [[_i], "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa"];
							_tree tvSetValue [[_i], 0];						
						};
						{_x setMarkerAlphaLocal 1;}forEach allMapMarkers;
					};
			case 1: { 
						_alpha = 1;
						for "_i" from 3 to (_sizeIndex -1) do
						{			
							// _tree tvSetPicture [[_i], "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa"];
							_tree tvSetValue [[_i], 1];						
						};					
						{_x setMarkerAlphaLocal 0;}forEach allMapMarkers;
					};
		};
	}else
	{
		if (_indexNum == 2) then 
		{
			[_ctrl, _index] call FLTR_fnc_LocSel;
		}else
		{
			[_ctrl, _index] call FLTR_fnc_LocSel_Maxou;
		};
	};
};
FLTR_fnc_LocSel = 
{
	params ["_ctrl","_index"];
	_tree = ((findDisplay 12) displayCtrl (2103));
	_data =  _tree tvData _index;
	 _locations =  nearestLocations [getPosATL player, ["NameCity","NameCityCapital"], 25000];
	{
		_name = text _x;
		if (_data == _name) then 
		{
			_pos = locationPosition _x;			
			mapAnimClear;
			mapAnimAdd [0.75, 0.7,_pos];
			mapAnimAdd [0.75, 0.1,_pos];
			mapAnimCommit;
		};
	}forEach _locations;
};
FLTR_fnc_LocSel_Maxou = 
{
	params ["_ctrl","_index"];
	_tree = ((findDisplay 12) displayCtrl (2103));
	_data =  _tree tvData _index;
	{
		_nom_clique_sfp = (_data);
		_nom_scanne = _x select 0;
		if (_nom_clique_sfp == _nom_scanne) then 
		{
			_pos = _x select 1;			
			mapAnimClear;
			mapAnimAdd [0.50, 1,_pos];
			mapAnimAdd [2, 0.002,_pos];
			mapAnimCommit;
		};
	}forEach listes_des_marqueurs_filtre_sfp;
};
