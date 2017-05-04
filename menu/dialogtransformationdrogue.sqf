// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

createDialog "dialogtransformationdrogue";


if (!isnil {player getvariable "licence_heroine"}) then {
hasheroinprocesslicense = "Oui";
} else {
hasheroinprocesslicense = "Non";
};

if (!isnil {player getvariable "licence_cannabis"}) then {
jailalicensedecannabis = "Oui";
} else {
jailalicensedecannabis = "Non";
};

ctrlSetText[77777,format["%1",hasheroinprocesslicense]];
ctrlSetText[77778,format["%1",jailalicensedecannabis]];
