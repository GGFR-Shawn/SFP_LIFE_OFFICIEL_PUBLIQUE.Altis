// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

createDialog "Formation_Laboratoire_Dialogue";

if ((player getVariable "experience_transformation_cocaine") >= 0) then {experience_niveau_zero = "Oui";} else {experience_niveau_zero = "Non";};
if ((player getVariable "experience_transformation_cocaine") >= 1) then {experience_niveau_un = "Oui";} else {experience_niveau_un = "Non";};
if ((player getVariable "experience_transformation_cocaine") >= 2) then {experience_niveau_deux = "Oui";} else {experience_niveau_deux = "Non";};
if ((player getVariable "experience_transformation_cocaine") >= 3) then {experience_niveau_trois = "Oui";} else {experience_niveau_trois = "Non";};
if ((player getVariable "experience_transformation_cocaine") >= 4) then {experience_niveau_quatre = "Oui";} else {experience_niveau_quatre = "Non";};
if ((player getVariable "experience_transformation_cocaine") >= 5) then {experience_niveau_cinq = "Oui";} else {experience_niveau_cinq = "Non";};


ctrlSetText[11157,format["%1",experience_niveau_zero]];
ctrlSetText[11165,format["%1",experience_niveau_un]];
ctrlSetText[11158,format["%1",experience_niveau_deux]];
ctrlSetText[11159,format["%1",experience_niveau_trois]];
ctrlSetText[11160,format["%1",experience_niveau_quatre]];
ctrlSetText[11162,format["%1",experience_niveau_cinq]];
