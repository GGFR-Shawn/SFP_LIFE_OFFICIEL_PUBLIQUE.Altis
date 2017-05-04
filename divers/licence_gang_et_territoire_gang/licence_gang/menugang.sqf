// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

createDialog "menugang";

if (!isnil {player getvariable "licence_gang_v2"}) then {
	hasganglicense = "Oui";
} else {
	hasganglicense = "Non";
};

if (isnil {player getvariable "licence_gang_v2"}) then {
	hasganglicensenon = "Oui";
} else {
	hasganglicensenon = "Non";
};

ctrlSetText[11157,format["%1",hasganglicense]];
ctrlSetText[11158,format["%1",hasganglicensenon]];