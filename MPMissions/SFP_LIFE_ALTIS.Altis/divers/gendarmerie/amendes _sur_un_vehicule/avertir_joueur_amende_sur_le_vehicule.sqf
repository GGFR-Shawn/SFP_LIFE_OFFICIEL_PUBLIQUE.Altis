// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_joueur = _this select 0;
_montant_de_l_amende = _this select 1;
_position_de_l_amende = _this select 2;
_le_vehicule = _this select 3;
if (isnil "_le_joueur" or isnil "_montant_de_l_amende" or isnil "_position_de_l_amende" or isnil "_le_vehicule") exitwith {hint "Erreur information publique amende.";};
if (name player != _le_joueur) exitwith {};

for '_i' from 0 to 2 do
{
	systemchat format ["!!! ATTENTION !!! Une amende de %1 %2 à été avisée sur votre véhicule : Plaque : %3 ; Position %4.",	(_montant_de_l_amende) call retour_formatage_chiffre_sfp, "€", _le_vehicule getvariable "plaque_immatriculation_news" select 0, mapgridposition _position_de_l_amende];
	
	titleText [format["!!! ATTENTION !!! \n\n Une amende de %1 %2 à été avisée sur votre véhicule : \n\n - Plaque : %3 \n - Position %4. \n\n La gendarmerie national.",	(_montant_de_l_amende) call retour_formatage_chiffre_sfp, "€", _le_vehicule getvariable "plaque_immatriculation_news" select 0, mapgridposition _position_de_l_amende], "BLACK IN", 1];
	sleep 1;
	titleText [format["!!! ATTENTION !!! \n\n Une amende de %1 %2 à été avisée sur votre véhicule : \n\n - Plaque : %3 \n - Position %4. \n\n La gendarmerie national.",	(_montant_de_l_amende) call retour_formatage_chiffre_sfp, "€", _le_vehicule getvariable "plaque_immatriculation_news" select 0, mapgridposition _position_de_l_amende], "PLAIN", 3];
	sleep 2;
};