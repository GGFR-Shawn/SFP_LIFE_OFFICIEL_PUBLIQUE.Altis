// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (player getvariable "etat_verrou_du_groupe_sfp" < 1) then
{
	player globalchat "Votre groupe PERSONNEL à bien été verrouillé pour ne plus que personne ne le rejoint !";
	player setvariable ["etat_verrou_du_groupe_sfp",1,true];
}else
{
	player globalchat "Votre groupe PERSONNEL à bien été déverrouillé, il peut maintenant être rejoint !";
	player setvariable ["etat_verrou_du_groupe_sfp",0,true];
};

