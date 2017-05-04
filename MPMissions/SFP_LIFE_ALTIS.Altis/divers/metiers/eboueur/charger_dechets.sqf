//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !


hint "! COLLECTE DECHETS ! \n\n Le fonctionnement est simple : \n\n Pour collecter des déchets, il te suffit de : \n\n
1) Te rendre sur les marqueurs ROUGE indiqués sur ta carte.\n \n
2) Une fois sur place, de pointer ta souris vers le tas d'ordure. \n\n
3) Une fois la phase 2 terminée, il te suffit de pointer ta souris vers le véhicule de collecte pour charger les déchets dedans. \n\n
4) Une fois tout les points de collecte terminer, reviens au dépot pour vider ton camion et encaisser !
\n\n Et te voila maintenant riche ;)";

waitUntil {(cursortarget isKindOf "Land_JunkPile_F") or (cursortarget isKindOf "Land_GarbageWashingMachine_F") or (cursortarget isKindOf "Land_GarbagePallet_F") && (player distance cursortarget) < 4};
if ((player distance ordurecollecteeun < 10) or (player distance ordurecollecteedeux < 10) or (player distance ordurecollecteetrois < 10) or (player distance ordurecollecteequatre < 10) or (player distance ordurecollecteecinq < 10) or (player distance ordurecollecteesix < 10)) then
{
	jepeuxdecharger = 1;
	_lesdechetsaenlever = cursortarget;
	_type = typeOf _lesdechetsaenlever;

	hint "Ok, les déchets sont bien en attente de chargement !\n\n Il ne te reste plus qu'à les charger dans ton camion en te collant près de la benne !";

	waitUntil {(cursortarget isKindOf "B_Truck_01_box_F") && (player distance cursortarget) < 4};
	_mesdechets = cursortarget;

	hint "Les déchets vont être chargés !";

	player playMove "AinvPknlMstpSlayWrflDnon_healed";

	_lesdechetsaenlever attachTo [_mesdechets,[0,0,0]];

	hint "Les déchets ont bien été enlevés !";
	sleep 8;
	["ToutesLesCollectes", [ format["Une prime de 80 € vient de vous être octroyé !",(player getVariable "ma_paye_by_sfp_maxou")] ] ] call bis_fnc_showNotification;
	player setVariable["mon_argent_poche_by_sfp_maxou",(player getVariable "mon_argent_poche_by_sfp_maxou") + 80,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

	if (player distance ordurecollecteeun < 10) then {deleteMarkerLocal "pointdecollecteun";deletevehicle tasdedechetsun; sleep 1;deleteMarkerLocal "pointdecollecteun";deletevehicle tasdedechetsun;};
	if (player distance ordurecollecteedeux < 10) then {deleteMarkerLocal "pointdecollectedeux";deletevehicle tasdedechetsdeux; sleep 1;deleteMarkerLocal "pointdecollectedeux";deletevehicle tasdedechetsdeux;};
	if (player distance ordurecollecteetrois < 10) then {deleteMarkerLocal "pointdecollectetrois";deletevehicle tasdedechetstrois; sleep 1;deleteMarkerLocal "pointdecollectetrois";deletevehicle tasdedechetstrois;};
	if (player distance ordurecollecteequatre < 10) then {deleteMarkerLocal "pointdecollectequatre";deletevehicle tasdedechetsquatre; sleep 1;deleteMarkerLocal "pointdecollectequatre";deletevehicle tasdedechetsquatre;};
	if (player distance ordurecollecteecinq < 10) then {deleteMarkerLocal "pointdecollectecinq";deletevehicle tasdedechetscinq; sleep 1;deleteMarkerLocal "pointdecollectecinq";deletevehicle tasdedechetscinq;};
	if (player distance ordurecollecteesix < 10) then {deleteMarkerLocal "pointdecollectesix";deletevehicle tasdedechetssix; sleep 1;deleteMarkerLocal "pointdecollectesix";deletevehicle tasdedechetssix;};
	jailequotadedechargement = jailequotadedechargement + 1;
}else
{
	Hint "Désolé, tu n'es pas sur un point de collecte !";
};