//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (player distance cursortarget < 5 && (!isnil {cursortarget getvariable "vehicule_info_parvariable"})) exitwith {hint "Désolé tu ne peux pas poser d'objets à proximité des véhicules ...";};
if (speed player > 0.1) exitwith {hint "Arrete toi pour le poser !";};
jedeposelecone = 1;
