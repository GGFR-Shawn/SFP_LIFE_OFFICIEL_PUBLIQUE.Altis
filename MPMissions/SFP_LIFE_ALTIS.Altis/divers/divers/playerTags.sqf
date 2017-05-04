// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};

[] spawn
{
	while {true} do 
	{
		_distance_de_depart = position player;
		_distance_a_scanner_sfp = 60;
		_ne_pas_afficher = ["SARL"," SARL"];
		enregistrement_liste_des_marqueurs_sfp = [];
		
		{
			_verification_du_nom_sfp = toArray (markerText _x);
			_verification_du_nom_sfp resize 5;

			if (markerText _x != "" && !(toString _verification_du_nom_sfp in _ne_pas_afficher) && player distance (getMarkerPos _x) < _distance_a_scanner_sfp) then
			{
				enregistrement_liste_des_marqueurs_sfp pushback _x;
			};
		} forEach allMapMarkers;
		
		affichage_des_noms_des_marqueurs =
		{
			{
				_ligne_de_recherche = lineIntersects [eyePos player, getMarkerPos _x,player, objnull];		
				if(!_ligne_de_recherche) then
				{
					_texte_playertag = format ["%1", markerText _x];
					
					drawIcon3D ["", [1,1,1,1], [(getMarkerPos _x select 0), (getMarkerPos _x select 1), (getMarkerPos _x select 2) + 0], 1.5, 0.08, 45, _texte_playertag, 0, 0.0275, "TahomaB","center"];
				};
			} forEach enregistrement_liste_des_marqueurs_sfp;
		};
		
		if (count enregistrement_liste_des_marqueurs_sfp > 0 && desactiver_message_infos_ecran < 1) then
		{
			["ID_Maxou_Joueurs_Marqueurs", "onEachFrame", "affichage_des_noms_des_marqueurs"] call BIS_fnc_addStackedEventHandler; 
			waituntil {sleep 1; player distance _distance_de_depart > _distance_a_scanner_sfp - 10 or desactiver_message_infos_ecran >= 1};
			["ID_Maxou_Joueurs_Marqueurs", "onEachFrame", "affichage_des_noms_des_marqueurs"] call BIS_fnc_removeStackedEventHandler;  
		}else
		{
			sleep 4;
		};
	};	
};


while {true} do
{
	waituntil {alive player;};

	_tag_listes_recherche_nom = ["ID_Maxou_Joueurs_Nom", "onEachFrame", "affichage_des_noms_des_joueurs"] call BIS_fnc_addStackedEventHandler; 
	sleep 3;
	["ID_Maxou_Joueurs_Nom", "onEachFrame", "affichage_des_noms_des_joueurs"] call BIS_fnc_removeStackedEventHandler;  
};
