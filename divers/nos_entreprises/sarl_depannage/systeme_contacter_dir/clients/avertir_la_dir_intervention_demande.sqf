// =======================================================================================================================================================================================
											// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
											  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (je_suis_en_service_a_la_sarl_depannage < 1) exitwith {};

_nom_du_joueur_demandant_depannage = _this select 0;
_le_nom_du_vehicule = _this select 1;
_le_vehicule = _this select 2;
if (isnil "_nom_du_joueur_demandant_depannage" or isnil "_le_nom_du_vehicule" or isnil "_le_vehicule") exitwith {};

["Demande_Depannage_Dir_Vehicule",["Un dépannage est demandé par la balise !", ""]] call bis_fnc_showNotification;
systemchat format ["%1 demande un dépannage sur %2 ! Ouvre ton menu DIR pour lui confirmer ton arrivee ! Vous êtes à %3 mètres de distance.", name _nom_du_joueur_demandant_depannage, _le_nom_du_vehicule, round (player distance _nom_du_joueur_demandant_depannage)];
titletext [format ["! REPARATION DIR! \n --------------------------------------------------------------- \n\n %1 demande un dépannage sur %2 ! \n Ouvre ton menu DIR pour lui confirmer ton arrivee ! \n\n Vous êtes à %3 mètres de distance. ! \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr", name _nom_du_joueur_demandant_depannage, _le_nom_du_vehicule, round (player distance _nom_du_joueur_demandant_depannage)],"PLAIN",1];

_nom_du_marqueur = format ["%1%2%3",name player, _nom_du_joueur_demandant_depannage, _le_nom_du_vehicule];
_le_marqueur = createMarkerlocal [_nom_du_marqueur, position _nom_du_joueur_demandant_depannage];
_le_marqueur setMarkerShapelocal "ICON";
_le_marqueur setMarkerColorlocal "ColorBlue";
_le_marqueur setMarkerSizelocal [1.5,1.5];
_le_marqueur setMarkerTypelocal "hd_dot";
_le_marqueur setMarkerTextlocal "Dépannage demandé.";

_temps_effacement = 600;
while {_temps_effacement > 0 && player distance _nom_du_joueur_demandant_depannage > 5 && !isnil {_le_vehicule getvariable "vehicule_attente_reparation"}} do
{
	_temps_effacement = round (_temps_effacement - 1);
	sleep 1;
};		

deletemarkerlocal _le_marqueur;
