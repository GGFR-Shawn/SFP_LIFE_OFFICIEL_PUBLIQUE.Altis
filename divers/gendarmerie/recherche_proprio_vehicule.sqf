// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_veh","_data"];
_veh = cursorTarget;
_type = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");
_typearma = typeOf _veh;

if (!isnil {_veh getvariable "vehicule_info_parvariable"}) then
{
	if(!alive _veh) exitWith {hint "Désolé, le véhicule est HS !";};
	if(player distance _veh > 10 || !alive player) exitWith {hint "Désolé, tu es trop loin du véhicule !";};

	_cestaqui = _veh getVariable "vehicule_info_parvariable" select 0;
	
	if(isNil {_cestaqui}) exitWith {hint "Aucune information concernant ce véhicule au SIV!";};
	
	hint "Consultation de la base de donnée du SIV ...";
	sleep 4;

	hint parseText format["
	<t align='left'><img image='textures\icones\drapeaufr.jpg'/><t color='#ffffff'><t align='center'><t size='1'>www.sfpteam.fr<t align='right'><img image='textures\icones\drapeaufr.jpg'/></t>
	<br/><t color='#ffffff'><t align='center'><t size='1'>By Maxou
	<br/><t color='#ffffff'><t align='center'><t size='1'>----------------------------
	<br/>
	<br/>
	<t color='#FFD700'><t size='1.5'>Propriétaire Véhicule</t></t>
	<br/>
	<br/>
	<t align='center'><t size='1.1'>- %1 -</t>
	<br/>
	<br/>
	<t color='#FFD700'><t size='1.5'>Référence Véhicule</t></t>
	<br/>
	<br/>
	<t align='center'><t size='1.1'>- %2 -</t>
	<br/>
	<br/>
	<t color='#FFD700'><t size='1.5'>Type Véhicule</t></t>
	<br/>
	<br/>
	<t align='center'><t size='1.1'>- %3 -</t>
	<br/>
	<br/>
	<br/><t color='#ffffff'><t align='center'><t size='1'>----------------------------
	<br/><t color='#ff0000'><t align='center'><t size='1'>! La préfecture des SFP !	
	",
	_cestaqui,
	_type,
	_typearma
	];
}else
{
	hint "Désolé, tu n'as pas pointé ta souris vers un véhicule !";
};