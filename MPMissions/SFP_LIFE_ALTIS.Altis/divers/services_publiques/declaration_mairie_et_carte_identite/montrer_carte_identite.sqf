// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_avatar = _this select 0;
_nom_carte_identite = _this select 1;
_prenom_carte_identite = _this select 2;
_sexe_carte_identite = _this select 3;
_lieu_de_naissance_carte_identite = _this select 4;
_taille_carte_identite = _this select 5;
_heure_de_jeu = _this select 6;

if (isnil "_avatar" or isnil "_nom_carte_identite" or isnil "_prenom_carte_identite" or isnil "_sexe_carte_identite" or isnil "_lieu_de_naissance_carte_identite" or isnil "_taille_carte_identite" or isnil "_heure_de_jeu") exitwith {titletext ["Erreur sur le reçu de la carte d'identité ... Demande au joueur de recommencer ...","PLAIN DOWN"];};


numero_carte_identite_un = format ["%1%2%3%4",round (random 99999),round (random 99999),round (random 99999),round (random 99999)];
numero_carte_identite_deux = format ["%1%2%3%4%5",round (random 9999),round (random 9999),round (random 99999),round (random 9999),round (random 9999)];
numero_carte_identite_trois = format ["%1%2%3%4",round (random 999),round (random 999),round (random 999),round (random 999)];
numero_carte_identite_quatre = format ["%1%2%3%4%5%6%7",round (random 99999),round (random 99999),round (random 99999),round (random 9999),round (random 99999),round (random 99999),round (random 99999)];
numero_carte_identite_cinq = format ["%1%2%3",round (random 999),round (random 999),round (random 999)];
numero_carte_identite_six = format ["%1%2%3%4",round (random 99999),round (random 9999),round (random 999),round (random 999)];


createdialog "menu_carte_identite_sfp_maxou_affichage_seulement";

ctrlSetText[1000,format["%1",numero_carte_identite_un]];
ctrlSetText[1001,format["%1",numero_carte_identite_deux]];
ctrlSetText[1002,format["%1",numero_carte_identite_trois]];
ctrlSetText[1003,format["%1",numero_carte_identite_quatre]];
ctrlSetText[1004,format["%1",numero_carte_identite_cinq]];
ctrlSetText[1005,format["%1",numero_carte_identite_six]];

((findDisplay 156986) displayCtrl 1201) ctrlSetText (listes_des_avatars_carte_identite select _avatar);  
ctrlSetText[1007,format["%1",_nom_carte_identite]];
ctrlSetText[1008,format["%1",_prenom_carte_identite]];
ctrlSetText[1009,format["%1",_sexe_carte_identite]];
ctrlSetText[1006,format["%1 Minutes.",_heure_de_jeu]];
ctrlSetText[1010,format["%1",_lieu_de_naissance_carte_identite]];
ctrlSetText[1011,format["%1",_taille_carte_identite]];

