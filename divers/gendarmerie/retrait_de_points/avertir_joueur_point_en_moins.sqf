// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nom_du_gendarme = _this select 0;
_personne_reprimande = _this select 1;

if (isnil "_nom_du_gendarme") exitwith {};
if (isnil "_personne_reprimande") exitwith {};

if (player getvariable "combien_de_point_by_sfp_maxou" < 1) then
{
	systemchat format ["Le gendarme %1 à retiré des points du permis de %2 et à été suspendu.", _nom_du_gendarme, name _personne_reprimande];
}else
{
	systemchat format ["Le gendarme %1 à retiré des points du permis de %2.", _nom_du_gendarme, name _personne_reprimande];
};
