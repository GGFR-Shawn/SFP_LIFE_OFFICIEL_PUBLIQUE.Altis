// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private["_le_joueur"];
_le_joueur = _this select 0;
_parametre = _this select 1;

if (isnil "_le_joueur") exitwith {};
if (isnil "_parametre") exitwith {};

if (_parametre == "1") then
{
	if (alive _le_joueur && player == _le_joueur && player != vehicle player && revive_mon_side != west) then
	{
		player action ["Eject", vehicle player];
		detach player;
		
		[] spawn
		{
			player enableSimulation false;
			sleep 5;
			player enableSimulation true;
		};
		
		player action ["Eject", vehicle player];
		titleText["Vous avez été mit dehors par un GENDARME !","PLAIN"];
		titleFadeOut 4;
	};
};

if (_parametre == "2") then
{
	if(alive _le_joueur && player == _le_joueur && player != vehicle player) then
	{
		player action ["Eject", vehicle player];
		detach player;
		
		[] spawn
		{
			titleText["Vous avez été désincarcéré par un pompier !","PLAIN"];
			if (isnil {player getvariable "besoin_d_un_revive_news"}) then {player setVariable ["besoin_d_un_revive_news",true,true];};
			
			while {alive player && player getvariable "besoin_d_un_revive_news" >= 1} do
			{
				player switchMove "AinjPpneMstpSnonWrflDnon";
				sleep 1;
			};
			
			player playMove "amovppnemstpsraswrfldnon";
			sleep 4;
			player playMove "";
			player switchmove "";
		};
	};
};

if (_parametre == "3") then
{
	if (alive _le_joueur && player == _le_joueur) then
	{
		player action ["Eject", vehicle player];
		detach player;
		player action ["Eject", vehicle player];
		titleText["Vous avez été mit dehors de votre véhicule !","PLAIN"];
		titleFadeOut 4;
	};
};