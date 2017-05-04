// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2; !isnil "fin_verification_apres_chargement"};

execVM "divers\nos_entreprises\sarl_pompier\sarl_pompier_serveur\feu_voiture_joueur\initialisation_sarl_pompier_client_feu_voiture_joueur_effet.sqf";

while {true} do
{
	sleep 4;
	
	if (!isnil "quel_objet_prendre_choisit_dechets" && !isnil "creation_des_dechets") then
	{
		sleep 5;
		execVM "divers\nos_entreprises\sarl_pompier\sarl_pompier_serveur\dechets\initialisation_sarl_pompier_client_dechets.sqf";
		waituntil {sleep 3; isnil "creation_des_dechets" && isnil "creation_des_dechets_deux" && isnil "creation_des_dechets_trois" && isnil "creation_des_dechets_quatre"};
	};
	
	if (!isnil "creation_des_feux_de_champs") then
	{
		execVM "divers\nos_entreprises\sarl_pompier\sarl_pompier_serveur\feu_de_champs\initialisation_sarl_pompier_client_feu_de_champs.sqf";
		waituntil {sleep 2; isnil "creation_des_feux_de_champs";};
	};
		
	if (!isnil "demarrage_incendie_feu_de_maison") then
	{
		execVM "divers\nos_entreprises\sarl_pompier\sarl_pompier_serveur\feu_de_maison\initialisation_sarl_pompier_client_maison.sqf";
		waituntil {sleep 2; isnil "creation_du_feu_maison_sfp";};
	};
		
	if (!isnil "creation_de_la_poubelle") then
	{
		execVM "divers\nos_entreprises\sarl_pompier\sarl_pompier_serveur\poubelle\initialisation_sarl_pompier_client_que_feu_de_poubelle_en_ville.sqf";
		waituntil {sleep 1; isnil "creation_de_la_poubelle";};
	};
		
	if (!isnil "creation_de_la_voiture_incendie") then
	{
		execVM "divers\nos_entreprises\sarl_pompier\sarl_pompier_serveur\voitures\initialisation_sarl_pompier_client_voiture.sqf";
		waituntil {sleep 1; isnil "creation_de_la_voiture_incendie";};
	};
};