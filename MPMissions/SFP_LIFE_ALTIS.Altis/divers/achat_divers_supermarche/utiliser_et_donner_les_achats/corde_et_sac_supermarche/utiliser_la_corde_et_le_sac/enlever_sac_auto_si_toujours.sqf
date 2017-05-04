// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


_time = 500;
hint format ["Dans %1 secondes ton sac sur la tête te sera enlevé automatiquement si tu l'a encore ... \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr",_time];

while {(!isnil {player getvariable "jai_un_sac_sur_la_tete"}) && (_time > 1) && alive player} do
{
	_time = _time - 2;
	if (_time > 0) then {titleText [format ["Encore %1 secondes pour que ton sac soit enlevé automatiquement ... \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr",_time],"PLAIN",1];};
	if (_time <= 0) then {hint "Tu n'as maintenant plus de sac sur la tete !\n\n Appuis maintenant sur V ! \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr";};
	sleep 2;
};

if (!(alive player)) exitwith {};
		
if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) exitWith
{
	player setVariable["jai_un_sac_sur_la_tete",nil,true];
	if (!isnil "effet_quand_sac_sur_la_tete_maxou") then {ppEffectDestroy effet_quand_sac_sur_la_tete_maxou;};
	sleep 1;
	titleText ["Ton sac à été enlevé automatiquement pour l'avoir été trop longtemps ! \n\n Appuis maintenant sur V !","PLAIN"];
	if (!isnil "noesckey") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];};
};
