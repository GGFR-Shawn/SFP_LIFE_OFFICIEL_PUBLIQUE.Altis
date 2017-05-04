// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

createDialog "CivLicenseMenu";

prix_permis_leger_sfp = round (1500 + ((player getvariable "nombre_de_permis") * 1500));
((uiNamespace getVariable "CivLicenseMenu") displayCtrl 31157) ctrlSetText format ["$%1", prix_permis_leger_sfp];
if ((player getVariable "license_permis_de_conduire_by_sfp_maxou") >= 1) then {hasdriverlicense = "Oui";} else {hasdriverlicense = "Non";};
ctrlSetText[11157,format["%1",hasdriverlicense]];

prix_permis_lourd_sfp = round (5000 + ((player getvariable "nombre_de_permis") * 800));
((uiNamespace getVariable "CivLicenseMenu") displayCtrl 21165) ctrlSetText format ["$%1", prix_permis_lourd_sfp];
if ((player getVariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou") >= 1) then {hasdriverlicensepoidlourd = "Oui";} else {hasdriverlicensepoidlourd = "Non";};
ctrlSetText[11165,format["%1",hasdriverlicensepoidlourd]];

if (!isnil {player getvariable "permis_de_chasse"}) then {haspermis_de_chasse = "Oui";} else {haspermis_de_chasse = "Non";};
ctrlSetText[11158,format["%1",haspermis_de_chasse]];

if (!isnil {player getvariable "license_pilote_news"}) then {hasairlicense = "Oui";} else {hasairlicense = "Non";};
ctrlSetText[11159,format["%1",hasairlicense]];

if (!isnil {player getvariable "licence_bateau_news"}) then {hasboatlicense = "Oui";} else {hasboatlicense = "Non";};
ctrlSetText[11160,format["%1",hasboatlicense]];

if (!isnil {player getvariable "licence_petrole"}) then {hasoilprocesslicense = "Oui";} else {hasoilprocesslicense = "Non";};
ctrlSetText[11162,format["%1",hasoilprocesslicense]];

if (!isnil {player getvariable "licence_fusils"}) then {hasriflelicense = "Oui";} else {hasriflelicense = "Non";};
ctrlSetText[11163,format["%1",hasriflelicense]];

if (!isnil {player getvariable "permis_port_d_arme"}) then {haspistollicense = "Oui";} else {haspistollicense = "Non";};
ctrlSetText[11164,format["%1",haspistollicense]];


