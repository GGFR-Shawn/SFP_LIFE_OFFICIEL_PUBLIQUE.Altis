// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
								  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =======================================================================================================================================================================================
												  // SI DEBUG MAXOU //
// =======================================================================================================================================================================================
// if (isnil "commande_debug_maxou_en_cours" && !isnil "maxou_debug") then
// {
	// commande_debug_maxou_en_cours = true; [] spawn {sleep 10; commande_debug_maxou_en_cours = nil;};
	// maxou_debug = true; publicVariable "maxou_debug"; [] spawn {sleep 60; maxou_debug = nil; sleep 0.1; publicVariable "maxou_debug";};
// };

// if (!isnil "maxou_debug") exitWith
// {
	// _this call BIS_fnc_MPexec;
	// systemchat "Anti Hack : Hack distant détecté mais non bloqué (Maxou) !";
// };

// =======================================================================================================================================================================================
											  // SI PAS DE DEBUG MAXOU //
// =======================================================================================================================================================================================
private "_nom_du_paquet";
_nom_du_paquet = [_this, 0, "", [""]] call BIS_fnc_param;

if (_nom_du_paquet == "BIS_fnc_MP_packet") then
{
	private ["_valeurs", "_arguments", "_fonction", "_whiteliste"];
	
	_valeurs = [_this, 1, [], [[]]] call BIS_fnc_param;
	_arguments = [_valeurs, 1, []] call BIS_fnc_param;
	_fonction = [_valeurs, 2, "", [""]] call BIS_fnc_param;
	_whiteliste = false;
	
	if (count _valeurs < 3) exitWith 
	{
		if (isServer) then
		{
			_heure_du_log = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
			_detail_du_log = format ["Hack valeur trop petit : %1 !", [_this]];
			["Historique Hack Distant", "Historique Hack Distant", _heure_du_log, _detail_du_log] call saveToDB;
		};
	};

	{
		if (_fonction == _x) exitWith
		{
			_whiteliste = true;
		};
	} forEach autorisation_bis_fnc_mp;

	if (_whiteliste) then
	{
		_this call BIS_fnc_MPexec;	
	} else
	{
		_valeur_non_indique = ["BIS_fnc_effectKilledAirDestruction","BIS_fnc_effectKilledSecondaries"];
	
		if (isServer) then
		{
			if (!(_fonction in _valeur_non_indique)) then
			{
				_heure_du_log = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
				_detail_du_log = format ["Un hack a été bloqué : %1 !", [_this]];
				["Historique Hack Distant", "Historique Hack Distant", _heure_du_log, _detail_du_log] call saveToDB;
			};
			
			BIS_fnc_MP_packet = [];
			publicVariable "BIS_fnc_MP_packet";
		}else
		{
			if (!(_fonction in _valeur_non_indique)) then
			{
				systemchat "Anti Hack : Hack distant détecté et bloqué (2) !";
			};
		};
	};
};
