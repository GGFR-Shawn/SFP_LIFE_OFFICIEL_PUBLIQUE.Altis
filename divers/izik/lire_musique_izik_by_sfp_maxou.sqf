//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if (!isClass(configFile >> "CfgPatches" >> "listes_musiques_sfp_maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour écouter la musique ! \n\n Vous pouvez le télécharger sur www.sfpteam.fr !";};
if (isnil "je_lance_izik") then {je_lance_izik = 1;};

if((lbCurSel 11173) == -1) exitwith {hint "Aucune musique selectionné !";};

if (je_lance_izik >= 1) then 
{
	je_lance_izik = 0;
	
	if((lbCurSel 11173) == 0) then
	{
		playMusic "Son_Un";
	};
	if((lbCurSel 11173) == 1) then
	{
		playMusic "Son_Deux";
	};
	if((lbCurSel 11173) == 2) then
	{
		playMusic "Son_Trois";
	};
	if((lbCurSel 11173) == 3) then
	{
		playMusic "Son_Quatre";
	};
	if((lbCurSel 11173) == 4) then
	{
		playMusic "Son_Cinq";
	};
	if((lbCurSel 11173) == 5) then
	{
		playMusic "Son_Six";
	};
	if((lbCurSel 11173) == 6) then
	{
		playMusic "Son_Sept";
	};
}else
{
	if (isnil "spam_boutton_play") then {spam_boutton_play = 0;};
	if (spam_boutton_play >= 1) exitwith {};
	spam_boutton_play = 1;
	_volume_du_son = musicVolume;
	1 fadeMusic 0;
	sleep 1;
	playMusic "";
	1 fadeMusic _volume_du_son;
	je_lance_izik = 1;
	spam_boutton_play = 0;
};