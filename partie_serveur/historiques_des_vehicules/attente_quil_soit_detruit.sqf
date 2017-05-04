//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

private ["_la_plaque_d_immatriculation"];
_le_vehicule_a_surveiller = _this select 0;
_le_proprietaire = _le_vehicule_a_surveiller getvariable "vehicule_info_parvariable" select 0;
_securite_type_of_vehicule = typeof _le_vehicule_a_surveiller;
_securite_le_vehicule_a_surveiller = format ["%1",_le_vehicule_a_surveiller];
_la_plaque_d_immatriculation = _le_vehicule_a_surveiller getVariable "plaque_immatriculation_news" select 0;
if (isnil "_la_plaque_d_immatriculation" or isnil "_le_vehicule_a_surveiller") exitwith {};

"DIAG SFP : Historique des véhicules : Lancement d'un scan sur un véhicule." spawn historique_creation_log_sfp;

while {alive _le_vehicule_a_surveiller && !isnull _le_vehicule_a_surveiller} do
{
	sleep 5;

	if (isNull _le_vehicule_a_surveiller) exitwith 
	{
		{
			if (name _x == _le_proprietaire) then
			{
				_nom_du_fichier = format["%1_type_%2_historiques_voiture",getplayeruid _x, _securite_type_of_vehicule];
				_nom_dans_le_fichier = format["%1/%2/%3 %4 H %5 Type : %6 Proprio: %7 Plaque : %8", heure_serveur select 2, heure_serveur select 1, heure_serveur select 0, heure_serveur select 3, heure_serveur select 4, _securite_le_vehicule_a_surveiller, _le_proprietaire, _la_plaque_d_immatriculation];

				sleep 1;
		
				if (!(_le_vehicule_a_surveiller in historique_confirmation_sauvegarde_vehicule_serveur)) then 
				{
					_ecrire_dedans = "Le véhicule à dépop et il n'y à pas eu de sauvegarde.";
					[_nom_du_fichier, _nom_dans_le_fichier, "Changement de degat", _ecrire_dedans] call saveToDB;						
				}else
				{
					_ecrire_dedans = "Le véhicule à dépop et à été sauvegardé.";
					[_nom_du_fichier, _nom_dans_le_fichier, "Changement de degat", _ecrire_dedans] call saveToDB;										

					historique_confirmation_sauvegarde_vehicule_serveur = historique_confirmation_sauvegarde_vehicule_serveur - [_le_vehicule_a_surveiller];
				};
			};
			sleep 0.01;
		} foreach playableunits;
	};
			
	if (!alive _le_vehicule_a_surveiller) exitwith
	{
		{
			if (name _x == _le_proprietaire) then
			{
				_nom_du_fichier = format["%1_type_%2_historiques_voiture",getplayeruid _x, _securite_type_of_vehicule];
				_nom_dans_le_fichier = format["%1/%2/%3 %4 H %5 Type : %6 Proprio: %7 Plaque : %8", heure_serveur select 2, heure_serveur select 1, heure_serveur select 0, heure_serveur select 3, heure_serveur select 4, _le_vehicule_a_surveiller, _le_proprietaire, _la_plaque_d_immatriculation];

				_ecrire_dedans = "Le véhicule à été détruit.";
				[_nom_du_fichier, _nom_dans_le_fichier, "Véhicule Détruit", _ecrire_dedans] call saveToDB;			
			};
			sleep 0.01;
		} foreach playableunits;
	};

	if (_le_proprietaire != _le_vehicule_a_surveiller getvariable "vehicule_info_parvariable" select 0) then
	{
		{
			if (name _x == _le_proprietaire) then
			{
				_nom_du_fichier = format["%1_type_%2_historiques_voiture",getplayeruid _x, _securite_type_of_vehicule];
				_nom_dans_le_fichier = format["%1/%2/%3 %4 H %5 Type : %6 Proprio: %7 Plaque : %8", heure_serveur select 2, heure_serveur select 1, heure_serveur select 0, heure_serveur select 3, heure_serveur select 4, _le_vehicule_a_surveiller, _le_proprietaire, _la_plaque_d_immatriculation];

				_ecrire_dedans = format ["Le véhicule à changé de nom, de %1 à %2.",_le_proprietaire, _le_vehicule_a_surveiller getvariable "vehicule_info_parvariable" select 0];
				[_nom_du_fichier, _nom_dans_le_fichier, "Changement de nom", _ecrire_dedans] call saveToDB;
			};
			sleep 0.01;
		} foreach playableunits;
	};
	
	if (_le_proprietaire != _le_vehicule_a_surveiller getvariable "vehicule_info_parvariable" select 0) then
	{
		_le_proprietaire = _le_vehicule_a_surveiller getvariable "vehicule_info_parvariable" select 0;
	};
};