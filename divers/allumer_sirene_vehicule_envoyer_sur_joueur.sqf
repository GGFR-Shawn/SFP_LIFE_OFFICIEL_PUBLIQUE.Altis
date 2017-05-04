// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_vehicle","_choix_sirene","_temps_attente"];
_vehicle = _this select 0; 
_choix_sirene = _this select 1;
_temps_attente = _this select 2;
 if (isnil "_vehicle" or isnil "_choix_sirene" or isnil "_temps_attente") exitwith {hint "Erreur sirène véhicule ...";};
 
while {(alive _vehicle) && !isnil {_vehicle getvariable "sirene_sur_vehicule_active"}} do 
{ 
  _vehicle say _choix_sirene;
  sleep _temps_attente; 
};

