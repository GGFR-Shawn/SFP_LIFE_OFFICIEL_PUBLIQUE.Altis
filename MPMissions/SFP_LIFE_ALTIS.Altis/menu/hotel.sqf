// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Maison
_verif_maison_check_dormir = ((nearestObjects [getPosATL player, ["house"], 6]) select 0);
if (!isnil "_verif_maison_check_dormir") then 
{
	if (!isnil {_verif_maison_check_dormir getvariable "proprietaire_de_la_maison"}) then
	{
		if ((name player) in (_verif_maison_check_dormir getvariable "proprietaire_de_la_maison")) then
		{
			le_prix_de_larticle = 0; le_nom_de_larticle = "nuit chez vous";
		};
	};
};

// Voiture
if (vehicle player != player) then {le_prix_de_larticle = 0; le_nom_de_larticle = "nuit dans un véhicule";};

// Trigger
if (player in list hotel_un_uneetoile) then {le_prix_de_larticle = ceil(random 8) * 20; le_nom_de_larticle = "nuit un peu bizarre";};
if (player in list hotel_quatre_cinqetoile) then {le_prix_de_larticle = ceil(random 7) * 60; le_nom_de_larticle = "nuit de rêve";};
if (player distance (markerpos "hotel_cinq_troisetoile") < 7) then {le_prix_de_larticle = ceil(random 7) * 25; le_nom_de_larticle = "nuit bruyante";};
if (player in list hotel_qg_flic) then {le_prix_de_larticle = ceil(random 5) * 12; le_nom_de_larticle = "nuit au HQ";};
if (player distance (getmarkerpos "copcarspawn") < 30) then {le_prix_de_larticle = ceil(random 5) * 16; le_nom_de_larticle = "nuit dans votre HQ";};
if (player in list sarl_pompier) then {le_prix_de_larticle = ceil(random 5) * 14; le_nom_de_larticle = "nuit au HQ";};
if (player in list sarl_avocat) then {le_prix_de_larticle = ceil(random 5) * 14; le_nom_de_larticle = "nuit au HQ";};
if (player in list sarltaxisgsept) then {le_prix_de_larticle = ceil(random 5) * 14; le_nom_de_larticle = "nuit au HQ";};
if (player in list sarl_depannage) then {le_prix_de_larticle = ceil(random 5) * 14; le_nom_de_larticle = "nuit au HQ";};
if (player in list trigger_famille_une) then {le_prix_de_larticle = ceil(random 5) * 19; le_nom_de_larticle = format ["nuit chez %1", sfp_config_famille_une_nom];};
if (player in list trigger_famille_deux) then {le_prix_de_larticle = ceil(random 5) * 19; le_nom_de_larticle = format ["nuit chez %1", sfp_config_famille_deux_nom];};
if (player in list sarl_neomedia) then {le_prix_de_larticle = ceil(random 5) * 19; le_nom_de_larticle = "nuit au QG Néomédia";};
if (cursortarget iskindof "Land_TentA_F") then {le_prix_de_larticle = 0; le_nom_de_larticle = "nuit dans votre tente";};

if (!sfp_config_activer_dormir) exitwith {hint "Cette fonction n'est pas activée sur ce serveur.";};
if (player getVariable "mon_argent_banque_by_sfp_maxou" < le_prix_de_larticle) exitwith {hint format ["Vous n'avez pas d'argent en banque ! Revenez avec %1 euros.",le_prix_de_larticle];};
if (player getVariable "fautdormir" >= 100) exitwith {hint "Vous n'êtes pas fatigué.";};

cutText["\n\n Bonne nuit ... :)","BLACK FADED",45];

if (vehicle player == player ) then {player switchMove "TestSurrender";};
player allowDamage false;
player hideobjectglobal true;

10 fadeSound 3;
10 fadeMusic 3;

while {player getVariable "fautdormir" < 100 && speed player < 1} do
{
	player say "Jeronfle";
	_aleatoire = ceil(random 8) * 1;
	player setVariable["fautdormir",(player getVariable "fautdormir") + _aleatoire,false];
	if (player getVariable "fautdormir" > 100) then {player setVariable["fautdormir",100,false];};
	sleep 2;
};

sleep 1;

if (vehicle player == player) then {player playmove "AmovPpneMstpSrasWrflDnon";};
player allowDamage true;
player hideobjectglobal false;

player setVariable ['mon_argent_banque_by_sfp_maxou', (player getVariable "mon_argent_banque_by_sfp_maxou") - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

if (speed player > 1) exitwith {cutText ["\n\n Tu as bougé pendant ton sommeil ! Tu n'es donc pas en pleine forme ;)", "BLACK IN", 4];};
cutText ["\n\n Tu es maintenant en pleine forme ! Et tu te reveilles doucement ;)", "BLACK IN", 45];
hint format['Vous avez passé une %1 d''un montant de %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp, (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];
