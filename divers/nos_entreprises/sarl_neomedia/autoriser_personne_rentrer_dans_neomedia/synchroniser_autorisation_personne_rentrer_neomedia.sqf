// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
								  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_a_qui_l_appliquer = _this select 0;
if (player != _a_qui_l_appliquer) exitwith {};

player setvariable ["autorisation_rentrer_neomedia",true,true];

_temps = time + 300;
waituntil {sleep 1; time > _temps};

player setvariable ["autorisation_rentrer_neomedia",nil,true];

systemchat "Fin de l'autorisation de rentrer dans Néomédia ...";