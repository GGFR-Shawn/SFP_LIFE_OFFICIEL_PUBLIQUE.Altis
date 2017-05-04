// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

while {true} do
{
	if (isnil "force_du_signal_telephone_by_maxou") then {force_du_signal_telephone_by_maxou = 0;};
	if (isnil "force_du_signal_telephone_by_maxou_maximum") then {force_du_signal_telephone_by_maxou_maximum = 5;};

	radar_detection_trouve_by_maxou = [];
	{
		if (isnil {_x getvariable "antenne_sfp_telecom_desactive"} && alive _x) then
		{	
			_valeur_by_maxou = player distance _x;
			[radar_detection_trouve_by_maxou, _valeur_by_maxou] call BIS_fnc_arrayPush;	
		};
		sleep 0.5;
	} foreach allmissionobjects "Land_Communication_F";

	radar_detection_trouve_by_maxou = radar_detection_trouve_by_maxou call BIS_fnc_sortNum;

	if (count radar_detection_trouve_by_maxou > 0) then
	{
		if ((radar_detection_trouve_by_maxou select 0) < 1000) then {force_du_signal_telephone_by_maxou = 5;};
		if ((radar_detection_trouve_by_maxou select 0) > 1400) then {force_du_signal_telephone_by_maxou = 4;};
		if ((radar_detection_trouve_by_maxou select 0) > 1700) then {force_du_signal_telephone_by_maxou = 3;};
		if ((radar_detection_trouve_by_maxou select 0) > 2200) then {force_du_signal_telephone_by_maxou = 2;};
		if ((radar_detection_trouve_by_maxou select 0) > 2600) then {force_du_signal_telephone_by_maxou = 1;};
		if ((radar_detection_trouve_by_maxou select 0) > 3100) then {force_du_signal_telephone_by_maxou = 0;};
	};
	
	_random_message_avertir_nombre_d_antenne_sfp_telecom = round (random 50);
	if (_random_message_avertir_nombre_d_antenne_sfp_telecom == 10) then
	{
		systemchat format ["SFP TELECOM couvre actuellement Altis avec %1 antennes relais !", count radar_detection_trouve_by_maxou];
	};
	
	sleep 10;
};