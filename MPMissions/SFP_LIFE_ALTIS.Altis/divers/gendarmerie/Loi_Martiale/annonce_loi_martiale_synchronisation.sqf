// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};

sleep 2;

[] spawn
{
	for "_i" from 0 to 4 do
	{
		titleText [format["!!! ATTENTION !!! \n\n La loi martiale est appliquée sur Neochori (%1 minute(s)) !", temps_restant_loi_martiale], "PLAIN"];
		systemchat format ["!!! ATTENTION !!! La loi martiale est appliquée sur Neochori (%1 minute(s)) !", temps_restant_loi_martiale];
		sleep 3;
	};
};

[] spawn
{
	if (isnil "sirene_loi_martiale_quand_activee") then
	{
		sirene_loi_martiale_quand_activee = true;
		
		while {!isnil "temps_restant_loi_martiale"} do
		{
			annonce_une say "loie_martiale_sirene_continu";
			annonce_deux say "loie_martiale_sirene_continu";
			annonce_trois say "loie_martiale_sirene_continu";
			annonce_quatre say "loie_martiale_sirene_continu";
			
			sleep 4;
		};

		sirene_loi_martiale_quand_activee = nil;
	};
};

annonce_une say "son_sirene_loi_martiale";
annonce_deux say "son_sirene_loi_martiale";
annonce_trois say "son_sirene_loi_martiale";
annonce_quatre say "son_sirene_loi_martiale";

sleep 10;

annonce_une say "Loie_Martial_Gendarmerie";
annonce_deux say "Loie_Martial_Gendarmerie";
annonce_trois say "Loie_Martial_Gendarmerie";
annonce_quatre say "Loie_Martial_Gendarmerie";

sleep 10;

annonce_une say "son_sirene_loi_martiale";
annonce_deux say "son_sirene_loi_martiale";
annonce_trois say "son_sirene_loi_martiale";
annonce_quatre say "son_sirene_loi_martiale";

sleep 10;

annonce_une say "Loie_Martial_Gendarmerie";
annonce_deux say "Loie_Martial_Gendarmerie";
annonce_trois say "Loie_Martial_Gendarmerie";
annonce_quatre say "Loie_Martial_Gendarmerie";
