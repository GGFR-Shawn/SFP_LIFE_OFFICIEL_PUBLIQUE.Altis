//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (speed player > 0.1) exitwith {hint "Arrete toi pour le poser !";};

hint "Patiente, je vérifie si tu es dans l'herbe ! \n\n Sachez qu'il se peut que tu arrives à outrepasser cette sécurité car la détection de l'herbe beug parfois, merci bohémia ;)";
sleep 4;

_surfacedeux = surfaceType getPosATL player;
_verificationsurface = ["#GdtGrassShort","#GdtGrassTall","#GdtGrassDry","#GdtGrassGreen"];
if !(_surfacedeux in _verificationsurface) exitwith {hint "Désolé, tu n'es pas dans l'herbe !";};

jedeposelatente = 1;
