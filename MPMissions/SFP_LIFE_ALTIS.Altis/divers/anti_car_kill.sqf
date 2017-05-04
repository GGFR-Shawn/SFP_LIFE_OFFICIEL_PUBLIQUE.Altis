//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_le_joueur_causant_dammage = _this select 0;
_la_vitesse_du_joueur_causant_degat = _this select 1;
_la_position_du_joueur_causant_degat = _this select 2;
_joueur_recevant_le_degat = _this select 3;

if (isnil "_le_joueur_causant_dammage" or isnil "_la_vitesse_du_joueur_causant_degat" or isnil "_la_position_du_joueur_causant_degat" or isnil "_joueur_recevant_le_degat") exitwith {};

if (player == _le_joueur_causant_dammage) then
{
	if (isnil "nombre_autorise_de_car_kill") then {nombre_autorise_de_car_kill = sfp_config_nombre_carkill_autorise;};
	nombre_autorise_de_car_kill = round (nombre_autorise_de_car_kill - 1);
	if (nombre_autorise_de_car_kill <= 0) then 
	{
		_heure_du_kill = format ["%1/%2/%3 à %4H%5Min:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
		_nom_du_kill = format ["%1: CarKill sur %2", _heure_du_kill, _joueur_recevant_le_degat];
		_detail_du_kill = format ["à été carkill par %1 à une vitesse de %2. Il était à la position %3.", name _le_joueur_causant_dammage, _la_vitesse_du_joueur_causant_degat, _la_position_du_joueur_causant_degat];
		["Historique carkill", "Historique carkill des joueurs", _nom_du_kill, _detail_du_kill] call fn_SaveToServer;
	
		["anti_car_kill_end_mission",false,true] call BIS_fnc_endMission;
		mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
	}else
	{
		titletext [format ["Attention, vous avez fait un CARKILL ! Il vous reste encore %1 autorisé avant d'être banni automatiquement !",nombre_autorise_de_car_kill],"PLAIN DOWN"];
	};
};