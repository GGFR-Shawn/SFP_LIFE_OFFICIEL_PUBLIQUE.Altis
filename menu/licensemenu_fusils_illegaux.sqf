// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_licence_fusils_illegaux";
createDialog "dialogue_licence_fusil_illegal";

if (!isnil {player getvariable "licence_fusils_illegaux"}) then {_licence_fusils_illegaux = "Oui";} else {_licence_fusils_illegaux = "Non";};
ctrlSetText[11157,format["%1",_licence_fusils_illegaux]];