// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (!isnil {cursortarget getvariable "vehicule_en_cours_de_desincarceration"}) exitwith {hint "Opération Impossible, un pompier travail déja dessus !";};
if (isnil {cursortarget getvariable "attente_pompier_desincarceration"}) exitwith {hint "Désolé, personne n'est incarcerer dans le véhicule ";};
if (count crew cursortarget < 1) exitWith {hint "Personne n'est coincé dans le véhicule !";};
if ((cursortarget distance player) >= 6) exitWith {hint "La personne est trop loin pour être désincarcéré !";};
if (isnil {cursorTarget getvariable "vehicule_en_cours_de_desincarceration"}) then {cursorTarget setvariable ["vehicule_en_cours_de_desincarceration",1,true];};

_le_vehicule_pour_etre_desincarcere = cursorTarget;
je_desincarcere_la_victime = 1;

_temps_avant_desincarceration = (30 + (random 60));
_temps_avant_desincarceration spawn {[_this] call bar_de_progression_by_maxou;};
while {_temps_avant_desincarceration > 0 && alive player} do
{
	sleep 1;
	
	if (animationState player != "medicstartup") then {player playActionNow "medicstartup";};
	
	if (speed player < 1.6) then
	{
		if (player distance _le_vehicule_pour_etre_desincarcere < 5) then
		{
			_temps_avant_desincarceration = round (_temps_avant_desincarceration - 1);
			titletext [format ["\n\n\n\n ! DESINCARCERATION ! \n --------------------------------------------------------------- \n\n Encore %1 secondes avant de sortir le bléssé du véhicule !",_temps_avant_desincarceration],"PLAIN",1];
		}else
		{
			titletext ["\n\n\n\n ! DESINCARCERATION ! \n --------------------------------------------------------------- \n\n Désolé, tu es trop loin du véhicule !","PLAIN",1];
		};
	}else
	{
		titletext ["\n\n\n\n ! DESINCARCERATION ! \n --------------------------------------------------------------- \n\n Désolé, tu n'es pas à l'arret !","PLAIN",1];
	};
};

bar_de_progression_by_maxou_reinitialisation = true;

if (!alive player) exitwith {je_desincarcere_la_victime = nil; _le_vehicule_pour_etre_desincarcere setvariable ["vehicule_en_cours_de_desincarceration",nil,true];};

{[[[_x,"2"],"divers\vehiclelock\ejecter_civil_synchro.sqf"],"BIS_fnc_execVM",_x,false] spawn BIS_fnc_MP;} foreach (crew cursorTarget);
titletext ["\n\n\n\n ! DESINCARCERATION ! \n --------------------------------------------------------------- \n\n Tu as terminé la désincarcération ! \n\n Soigne maintenant le bléssé !","PLAIN",1];

_le_vehicule_pour_etre_desincarcere setvariable ["attente_pompier_desincarceration",nil,true];
_le_vehicule_pour_etre_desincarcere setvariable ["vehicule_en_cours_de_desincarceration",nil,true];
je_desincarcere_la_victime = nil;

autorisation_declenchement_desincarceration = 0; 
sleep 0.045;
publicvariable "autorisation_declenchement_desincarceration";

sleep 2;
player switchmove "";

