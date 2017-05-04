// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if !(player in list sarl_pompier) then
{
	["Incendie",["Incendie de champs, soyez vigilant !", ""]] call bis_fnc_showNotification;
};

if (!isnil "jesuis_au_taff_a_la_sarl_pompier") then
{
	[] spawn
	{
		for "_i" from 0 to 4 do
		{
			player say "beeper_pompier_sfp";
			sleep 1;
		};
	};
};
tombe_sirene_pompier say "pompier_depart_feux_de_champs";

execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_serveur\feu_de_champs\creation_flamme_sur_feu_de_champs.sqf";

waituntil {sleep 2; isnil "creation_des_feux_de_champs";};

player globalChat format ["Salut %1, la SARL POMPIER à réussi à maitriser l'incendie déclaré il y à peu dans un champs ! Félicitation à eux pour leur bravoure !!!",name player];
