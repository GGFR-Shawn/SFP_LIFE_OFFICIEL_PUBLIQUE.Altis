// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if ((ctrlText 1400) == "       Taper ici directement la reponse ...") exitwith {hint "Taper ici directement la reponse n'est pas possible d'être envoyé ...";};
if ((ctrlText 1400) == "") exitwith {hint "Tu dois taper un message obligatoirement ...";};


envoyeurdumessage = name player;
publicVariable 'envoyeurdumessage';

nomdujoueur = le_nom_selectionne;
publicVariable "nomdujoueur";

lemessage = (ctrlText 1400);
publicVariable 'lemessage';

closedialog 0;

player setvariable ["je_possede_un_telephone_sfp", [(player getvariable "je_possede_un_telephone_sfp" select 0), (player getvariable "je_possede_un_telephone_sfp" select 1), ((player getvariable "je_possede_un_telephone_sfp" select 2) - 1)], true];

_encouleur = parseText format ["! SFP TELECOM !<br/> ------------------------------------- <br/><br/> Votre message : <br/><br/> %1  <br/><br/> à bien été envoyé à %2 !<br/> --------------------------------------------- <br/> SFP TEAM <br/> www.sfpteam.fr",lemessage, le_nom_selectionne];
hint _encouleur;

