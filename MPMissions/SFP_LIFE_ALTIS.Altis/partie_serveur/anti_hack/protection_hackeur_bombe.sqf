//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

"DIAG SFP : Protection Hackeur bombe : Initialisation démarrage." spawn historique_creation_log_sfp;

while {true} do
{
	if (isnil "jamaisdebombardement") then {sleep 10;}else{sleep 0.01;};
	if (!isnil "inscription_liste_bombe_hackeur") then {inscription_liste_bombe_hackeur = nil;};

	"DIAG SFP : Protection Hackeur bombe : Lancement scan." spawn historique_creation_log_sfp;
	
	_zone_recherche = ((getPosATL Neochori) nearObjects ["M_AT",500]);
	{		
		if (count _zone_recherche > 0) then 
		{
			joueur_recent_nom = [];
			{
				if (_x getvariable "ma_date_de_naissance" < 60 && isplayer _x) then 
				{
					joueur_recent_nom = joueur_recent_nom + [name _x];
					publicvariable "joueur_recent_nom";
				};
			} forEach allUnits;
		};
		deletevehicle _x;
		jamaisdebombardement = true;
		_null = [{hint format ["! PROTECTION HACK ! \n ------------------------------ \n\n Attention, notre script vient de detecté un bombarbement sur Georgetown ! \n\n Les bombes sont automatiquement supprimées ! \n\n Listes des joueurs de moins de 60 minutes de jeu : \n\n %1 \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",joueur_recent_nom];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;
	} forEach _zone_recherche;
	
	if (!isnil "joueur_recent_nom" && isnil "inscription_liste_bombe_hackeur") then
	{
		inscription_liste_bombe_hackeur = true;
		
		_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_du_log = format ["Bombe hack détecté, liste des noms : %1", joueur_recent_nom];
		["Historique Bombe Neochori", "Historique Hack Bombe", _heure_du_log, _detail_du_log] call saveToDB;
	};
};