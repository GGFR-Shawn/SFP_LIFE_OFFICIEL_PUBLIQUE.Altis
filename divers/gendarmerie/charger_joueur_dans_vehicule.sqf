// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] call detection_du_joueur_arrete_gendarmerie;

hint "Pour charger ce prisonnier dans un véhicule, il te suffit de pointer ta souris vers le véhicule ou tu souhaites le mettre. \n\n Attention, il faut que tu sois à moins de 6 mètres du véhicule pour que cela fonctionne.";

waitUntil {(!isnil {cursortarget getvariable "vehicule_info_parvariable"}) && (player distance cursortarget) < 6}; 

detach player;
 
le_joueur_arrete_gendarmerie action ["getInCargo", vehicle cursortarget];

Hint "Le prisonnier est bien monté dans le véhicule !";

