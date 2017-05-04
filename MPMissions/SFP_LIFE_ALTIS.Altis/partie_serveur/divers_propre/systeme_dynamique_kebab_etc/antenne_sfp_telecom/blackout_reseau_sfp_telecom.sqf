// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "blackout_reseau_telecom") then {blackout_reseau_telecom = 0;};
if (isnil "blackout_reseau_telecom_decompte") then {blackout_reseau_telecom_decompte = 0;};

sleep 0.5; publicvariable "blackout_reseau_telecom"; sleep 2;

"blackout_reseau_telecom" addPublicVariableEventHandler 
{
	"DIAG SFP : Blackout télécom : Demande de blackout." spawn historique_creation_log_sfp;

	if (blackout_reseau_telecom_decompte < 1) then
	{
		blackout_reseau_telecom_decompte = 1;
		
		while {blackout_reseau_telecom > 0} do
		{
			sleep 60;
			blackout_reseau_telecom = round (blackout_reseau_telecom - 1);
			publicvariable "blackout_reseau_telecom";
		};
		
		if (blackout_reseau_telecom != 0) then
		{
			blackout_reseau_telecom = 0;
			publicvariable "blackout_reseau_telecom";
		};

		blackout_reseau_telecom_decompte = 0;
	};
};