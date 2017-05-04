// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = _this select 0;
_la_synchro = _this select 1;
if (isnil "_le_vehicule" or isnil "_la_synchro") exitwith {};

switch _la_synchro do
{
	case 1 :
	{
		if (player distance _le_vehicule > 300) exitwith {};
		
		while {speed _le_vehicule < 0 && alive _le_vehicule} do
		{
			_le_vehicule say "radar_de_recul_bip";
			sleep 0.85;
		};
	};
	
	case 2 :
	{
		if (!isnil "activation_du_bip_de_recul_pompier") exitwith {};
		activation_du_bip_de_recul_pompier = true;
		
		_liste_des_vehicules_avec_bip_de_recul = _this select 2;
		if (isnil "_liste_des_vehicules_avec_bip_de_recul") exitwith {};
		
		while {true} do
		{
			waituntil {sleep 1; vehicle player != player};
			waituntil {sleep 0.5; speed vehicle player < 0 or vehicle player == player or !alive vehicle player};
						
			if (vehicle player != player && alive vehicle player && speed vehicle player < 0) then
			{
				[vehicle player,1] execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_client\divers\bip_de_recul.sqf";
			};
			
			waituntil {sleep 0.1; speed vehicle player > 0 or vehicle player == player or !alive vehicle player};
		};
	};
};