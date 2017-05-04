// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_veh = cursortarget;
_cestaqui = _veh getVariable "vehicule_info_parvariable";

if (isnil "_veh") exitwith {hint "Erreur sur le véhicule, recommence ...";};
if (isnil "jepeuxdeverrouiller") then {jepeuxdeverrouiller = 1;};
if (jepeuxdeverrouiller != 1) exitwith {hint "Tu viens déja de faire cette action, patiente 2 secondes !";};
if (isnil {_veh getvariable "vehicule_info_parvariable"}) exitwith {hint "Ce n'est pas un véhicule !";};
if ((speed _veh) > 2) exitwith {hint "Impossible ! Ce véhicule est en mouvement !";};
if ((player distance _veh) > 10) exitwith {hint "Tu es trop loin pour effectuer cette action !";};
if (isNil {_veh getVariable "vehicule_info_parvariable"}) exitwith {hint "Aucune information concernant ce véhicule !";};
if (!isnil {_veh getvariable "sabot_roue_vehicule"}) exitwith {hint "Désolé, ce véhicule à un sabot sur la roue !";};
if ("Altis location\nVéhicule de location\n Véhicule SANS PERMIS" in _cestaqui) exitwith {hint "Tu ne peux pas verrouiller/deverrouiller les véhicules de location ! \n\n Si c'est une location qui t'appartiens, utilise VERROUILLER/DEVEROUILLER LOCATION.\n-----------------------------------\n BY SFP Maxou";};
if (!(name player in _cestaqui)) exitwith {hint "Ce n'est pas ton véhicule !"; [_veh] execvm "divers\vehiclelock\alarme.sqf";};

_veh setVelocity [((velocity _veh) select 0)+(sin (direction _veh)* 0.25),((velocity _veh) select 1)+(cos (direction _veh)* 0.25),((velocity _veh) select 2)];

jepeuxdeverrouiller = 0;
if (locked _veh == 2) then 
{	
	[[[_veh],"divers\vehiclelock\son_ouverture.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	[[[_veh,0],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

	if (!isnil {_veh getVariable "vehicule_info_parvariable" select 0}) then 
	{
		proprietaire_un = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 0];
	}
	else 
	{
		proprietaire_un = format ["Vous même !"];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 2) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 1}) then 
		{
			proprietaire_deux = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 1];
		}
	} else
	{
		proprietaire_deux = format ["<br/> Aucun prêt de clefs."];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 3) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 2}) then 
		{
			proprietaire_trois = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 2];
		}; 
	} else
	{
		proprietaire_trois = format [""];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 4) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 3}) then 
		{
			proprietaire_quatre = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 3];
		};
	} else 
	{
		proprietaire_quatre = format [""];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 5) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 4}) then 
		{
			proprietaire_cinq = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 4];
		};
	} else 
	{
		proprietaire_cinq = format [""];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 6) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 5}) then 
		{
			proprietaire_six = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 5];
		};
	} else 
	{
		proprietaire_six = format [""];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 7) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 6}) then 
		{
			proprietaire_sept = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 6];
		};
	} else 
	{
		proprietaire_sept = format [""];
	};
	
	_str = parseText format ["! VEHICULE DEVEROUILLE ! <br/> ------------------------------------ <br/>Propriétaire : <br/>%1<br/>Listes Prêt Clefs : <br/>%2%3%4%5%6%7<br/><t color='#EEEEEE' size='1'>-----------</t><br/><t color='#EEEEEE' size='1'>By [SFP] Maxou</t><br/><t color='#EEEEEE' size='1'>L'unique vrai mod by SFP!</t>",proprietaire_un,proprietaire_deux,proprietaire_trois,proprietaire_quatre,proprietaire_cinq,proprietaire_six,proprietaire_sept];hintsilent _str;

	sleep 2;
	jepeuxdeverrouiller = 1;
}else
{
	[[[_veh],"divers\vehiclelock\son_fermeture.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	[[[_veh,2],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	
	if (!isnil {_veh getVariable "vehicule_info_parvariable" select 0}) then {
	proprietaire_un = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 0];
	}
	else {
	proprietaire_un = format ["Vous même !"];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 2) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 1}) then 
		{
			proprietaire_deux = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 1];
		};
	} else
	{
		proprietaire_deux = format ["<br/> Aucun prêt de clefs."];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 3) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 2}) then 
		{
			proprietaire_trois = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 2];
		};
	} else
	{
		proprietaire_trois = format [""];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 4) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 3}) then 
		{
			proprietaire_quatre = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 3];
		}
	} else
	{
		proprietaire_quatre = format [""];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 5) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 4}) then 
		{
			proprietaire_cinq = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 4];
		};
	} else
	{
		proprietaire_cinq = format [""];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 6) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 5}) then 
		{
			proprietaire_six = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 5];
		};
	} else
	{
		proprietaire_six = format [""];
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (count (_veh getVariable "vehicule_info_parvariable") >= 7) then
	{
		if (!isnil {_veh getVariable "vehicule_info_parvariable" select 6}) then 
		{
			proprietaire_sept = format ["<br/> <t color='#4CCF00' size='1'> %1</t> <br/>", _veh getVariable "vehicule_info_parvariable" select 6];
		};
	} else
	{
		proprietaire_sept = format [""];
	};	
	_str = parseText format ["! VEHICULE VEROUILLE ! <br/> ------------------------------------ <br/>Propriétaire : <br/>%1<br/>Listes Prêt Clefs : <br/>%2%3%4%5%6%7<br/><t color='#EEEEEE' size='1'>-----------</t><br/><t color='#EEEEEE' size='1'>By [SFP] Maxou</t><br/><t color='#EEEEEE' size='1'>L'unique vrai mod by SFP!</t>",proprietaire_un,proprietaire_deux,proprietaire_trois,proprietaire_quatre,proprietaire_cinq,proprietaire_six,proprietaire_sept];hintsilent _str;
	
	sleep 2;
	jepeuxdeverrouiller = 1;
};