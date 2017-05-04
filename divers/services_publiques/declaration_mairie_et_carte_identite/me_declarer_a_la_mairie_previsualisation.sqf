// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (((ctrlText 1400) == "") or ((ctrlText 1400) == "Taper votre nom (RP).")) exitwith {Hint "! CARTE IDENTITE ! \n ---------------------------- \n\n Tu n'as tapé de nom de famille ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (((ctrlText 1401) == "") or ((ctrlText 1401) == "Taper votre prénom (RP).")) exitwith {Hint "! CARTE IDENTITE ! \n ---------------------------- \n\n Tu n'as tapé de prénom ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (((ctrlText 1402) == "") or ((ctrlText 1402) == "Taper votre sexe.")) exitwith {Hint "! CARTE IDENTITE ! \n ---------------------------- \n\n Tu n'as tapé de sexe ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (((ctrlText 1403) == "") or ((ctrlText 1403) == "Taper votre lieu de naissance.")) exitwith {Hint "! CARTE IDENTITE ! \n ---------------------------- \n\n Tu n'as tapé de lieu de naissance ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (((ctrlText 1404) == "") or ((ctrlText 1404) == "Taper votre taille.")) exitwith {Hint "! CARTE IDENTITE ! \n ---------------------------- \n\n Tu n'as tapé de taille ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

if (isnil "numero_carte_identite_un") then {numero_carte_identite_un = format ["%1%2%3%4",round (random 99999),round (random 99999),round (random 99999),round (random 99999)];};
if (isnil "numero_carte_identite_deux") then {numero_carte_identite_deux = format ["%1%2%3%4%5",round (random 9999),round (random 9999),round (random 99999),round (random 9999),round (random 9999)];};
if (isnil "numero_carte_identite_trois") then {numero_carte_identite_trois = format ["%1%2%3%4",round (random 999),round (random 999),round (random 999),round (random 999)];};
if (isnil "numero_carte_identite_quatre") then {numero_carte_identite_quatre = format ["%1%2%3%4%5%6%7",round (random 99999),round (random 99999),round (random 99999),round (random 9999),round (random 99999),round (random 99999),round (random 99999)];};
if (isnil "numero_carte_identite_cinq") then {numero_carte_identite_cinq = format ["%1%2%3",round (random 999),round (random 999),round (random 999)];};
if (isnil "numero_carte_identite_six") then {numero_carte_identite_six = format ["%1%2%3%4",round (random 99999),round (random 9999),round (random 999),round (random 999)];};

nom_carte_identite = ctrlText 1400;
prenom_carte_identite = ctrlText 1401;
sexe_carte_identite = ctrlText 1402;
lieu_de_naissance_carte_identite = ctrlText 1403;
taille_carte_identite = ctrlText 1404;

createdialog "menu_carte_identite_sfp_maxou_visualisation";

ctrlSetText[1000,format["%1",numero_carte_identite_un]];
ctrlSetText[1001,format["%1",numero_carte_identite_deux]];
ctrlSetText[1002,format["%1",numero_carte_identite_trois]];
ctrlSetText[1003,format["%1",numero_carte_identite_quatre]];
ctrlSetText[1004,format["%1",numero_carte_identite_cinq]];
ctrlSetText[1005,format["%1",numero_carte_identite_six]];

ctrlSetText[1007,format["%1",nom_carte_identite]];
ctrlSetText[1008,format["%1",prenom_carte_identite]];
ctrlSetText[1009,format["%1",sexe_carte_identite]];
ctrlSetText[1006,format["%1 Minutes.",player getvariable "ma_date_de_naissance"]];
ctrlSetText[1010,format["%1",lieu_de_naissance_carte_identite]];
ctrlSetText[1011,format["%1",taille_carte_identite]];

((findDisplay 456986) displayCtrl 1201) ctrlSetText (listes_des_avatars_carte_identite select choix_avatar_carte_identite);  
