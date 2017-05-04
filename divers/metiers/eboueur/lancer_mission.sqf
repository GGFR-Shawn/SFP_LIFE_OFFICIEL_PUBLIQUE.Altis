//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !

ordurecollecteeun = [5845.21,10773.8,0];
ordurecollecteedeux = [5196.89,10048.6,0];
ordurecollecteetrois = [9655.05,13607.2,0];
ordurecollecteequatre = [13597.2,11821.5,0];
ordurecollecteecinq = [14384.5,8826.38,0];
ordurecollecteesix = [7936.88,7894,0];

if (isnil "jepeuxramasserdechets") then {jepeuxramasserdechets = 0;};
if (jepeuxramasserdechets == 1) then
{
	Hint "Mission lancée ! Regarde ta carte pour connaitre les emplacements de collecte indiqués en ROUGE !";
	jepeuxramasserdechets = 0;
	jailequotadedechargement = 0;
	jepeuxdecharger = 0;

	// ------------------------------------ collecte dechets UN ----------------------------------- //

	createMarkerLocal ["pointdecollecteun", (ordurecollecteeun)];"pointdecollecteun" setMarkerShapeLocal "ICON";"pointdecollecteun" setMarkerColorLocal "Colorred";	"pointdecollecteun" setMarkerSizeLocal [3,3];"pointdecollecteun" setMarkerTypeLocal "hd_dot";
	tasdedechetsun = "Land_JunkPile_F" createvehicle ordurecollecteeun;
	"pointdecollecteun" setMarkerTextLocal "Point de collecte 1";

	// ------------------------------------ collecte dechets DEUX ----------------------------------- //

	createMarkerLocal ["pointdecollectedeux", (ordurecollecteedeux)];"pointdecollectedeux" setMarkerShapeLocal "ICON";"pointdecollectedeux" setMarkerColorLocal "Colorred";	"pointdecollectedeux" setMarkerSizeLocal [3,3];"pointdecollectedeux" setMarkerTypeLocal "hd_dot";
	tasdedechetsdeux = "Land_GarbageWashingMachine_F" createvehicle ordurecollecteedeux;
	"pointdecollectedeux" setMarkerTextLocal "Point de collecte 2";

	// ------------------------------------ collecte dechets TROIS ----------------------------------- //

	createMarkerLocal ["pointdecollectetrois", (ordurecollecteetrois)];"pointdecollectetrois" setMarkerShapeLocal "ICON";"pointdecollectetrois" setMarkerColorLocal "Colorred";	"pointdecollectetrois" setMarkerSizeLocal [3,3];"pointdecollectetrois" setMarkerTypeLocal "hd_dot";
	tasdedechetstrois = "Land_JunkPile_F" createvehicle ordurecollecteetrois;
	"pointdecollectetrois" setMarkerTextLocal "Point de collecte 3";

	// ------------------------------------ collecte dechets QUATRE ----------------------------------- //

	createMarkerLocal ["pointdecollectequatre", (ordurecollecteequatre)];"pointdecollectequatre" setMarkerShapeLocal "ICON";"pointdecollectequatre" setMarkerColorLocal "Colorred";	"pointdecollectequatre" setMarkerSizeLocal [3,3];"pointdecollectequatre" setMarkerTypeLocal "hd_dot";
	tasdedechetsquatre = "Land_GarbagePallet_F" createvehicle ordurecollecteequatre;
	"pointdecollectequatre" setMarkerTextLocal "Point de collecte 4";

	// ------------------------------------ collecte dechets CINQ ----------------------------------- //

	createMarkerLocal ["pointdecollectecinq", (ordurecollecteecinq)];"pointdecollectecinq" setMarkerShapeLocal "ICON";"pointdecollectecinq" setMarkerColorLocal "Colorred";	"pointdecollectecinq" setMarkerSizeLocal [3,3];"pointdecollectecinq" setMarkerTypeLocal "hd_dot";
	tasdedechetscinq = "Land_JunkPile_F" createvehicle ordurecollecteecinq;
	"pointdecollectecinq" setMarkerTextLocal "Point de collecte 5";


	// ------------------------------------ collecte dechets SIX ----------------------------------- //

	createMarkerLocal ["pointdecollectesix", (ordurecollecteesix)];"pointdecollectesix" setMarkerShapeLocal "ICON";"pointdecollectesix" setMarkerColorLocal "Colorred";	"pointdecollectesix" setMarkerSizeLocal [3,3];"pointdecollectesix" setMarkerTypeLocal "hd_dot";
	tasdedechetssix = "Land_GarbagePallet_F" createvehicle ordurecollecteesix;
	"pointdecollectesix" setMarkerTextLocal "Point de collecte 6";
}else
{
	hint "Désolé, tu es déja en mission de collecte !";
};