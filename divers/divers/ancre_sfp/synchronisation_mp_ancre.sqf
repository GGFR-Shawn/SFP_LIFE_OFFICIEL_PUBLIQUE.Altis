// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_le_vehicule_a_encrer_sfp","_reglage_vitesse_encre_sfp","_speed"];
_le_vehicule_a_encrer_sfp = _this select 0;
_reglage_vitesse_encre_sfp = 0.1;
if (isnil "_le_vehicule_a_encrer_sfp") exitwith {hint "Erreur script ancre sur le choix de véhicule ...";};

while {!isnil {_le_vehicule_a_encrer_sfp getvariable "etat_de_l_ancre_sfp"} && alive _le_vehicule_a_encrer_sfp} do
{
	while {(speed _le_vehicule_a_encrer_sfp > 0.3 or speed _le_vehicule_a_encrer_sfp < -0.3)} do
	{
		if (speed (_le_vehicule_a_encrer_sfp) > 0) then
		{
			_speed = -_reglage_vitesse_encre_sfp;
		}else
		{
			_speed = _reglage_vitesse_encre_sfp;
		};
		
		_vel = velocity (_le_vehicule_a_encrer_sfp);
		_dir = direction (_le_vehicule_a_encrer_sfp);
		(_le_vehicule_a_encrer_sfp) setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed), 0];
		
		if (driver _le_vehicule_a_encrer_sfp == player) then
		{
			hintsilent "Ce véhicule à une ancre ! \n Utilisez le menu déroulant pour l'enlever !";
		};
		
		sleep 0.001;
	};
	
	sleep 0.1;
};

