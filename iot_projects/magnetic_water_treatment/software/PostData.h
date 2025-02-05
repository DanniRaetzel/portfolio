/*
============================================
Name        : PostData.h
Author      : Danni Raetzel
Version     : 1.0
Date        : 23.04.2024
Copyright   : Open for all
Description : Headerfil til data fra byerne
============================================
*/

// PostData.h
struct PostData {
  int postNr;
  const char* kommune;
  float hardhed;
  float pH;
};

// Definer et array af PostData strukturer
PostData postData[] = {
  {6950, "Ringkøbing", 0.6, 7.5},
  {6900, "Skjern", 0.6, 7.5},
  {7190, "Billund", 0.6, 7.75},
  {7430, "Ikast-Brande", 0.6, 7.5},
  {8600, "Silkeborg", 0.6, 8.25},
  {9940, "Læsø", 1.0, 7.5},
  {9900, "Frederikshavn", 1.0, 7.5},
  {9700, "Brønderslev", 1.0, 7.5},
  {9330, "Dronninglund", 1.0, 7.5},
  {9550, "Mariager", 1.0, 7.5},
  {8800, "Viborg", 1.0, 7.75},
  {7800, "Skive", 1.0, 7.5},
  {7500, "Holstebro", 1.0, 7.25},
  {7400, "Herning", 1.0, 7.25},
  {7600, "Struer", 1.0, 7.5},
  {7620, "Lemvig", 1.0, 7.5},
  {7100, "Vejle", 1.0, 7.5},
  {6800, "Varde", 1.0, 7.5},
  {6600, "Vejen", 1.0, 7.5},
  {6700, "Esbjerg", 1.0, 7.5},
  {6270, "Tønder", 1.0, 7.5},
  {6200, "Aabenraa", 1.0, 7.5},
  {2730, "Herlev", 1.5, 7.5},
  {3450, "Allerød", 1.5, 7.5},
  {2970, "Hørsholm", 1.5, 7.5},
  {3460, "Fredensborg", 1.5, 7.5},
  {3450, "Hillerød", 1.5, 7.5},
  {4000, "Roskilde", 1.5, 7.5},
  {4320, "Lejre", 1.5, 7.5},
  {4300, "Holbæk", 1.5, 7.5},
  {4100, "Ringsted", 1.5, 7.5},
  {4180, "Sorø", 1.5, 7.5},
  {4400, "Kalundborg", 1.5, 7.5},
  {4200, "Slagelse", 1.5, 7.25},
  {4700, "Næstved", 1.5, 7.5},
  {4640, "Faxe", 1.5, 7.5},
  {5600, "Faaborg", 1.5, 7.5},
  {5000, "Odense", 1.5, 7.5},
  {5610, "Assens", 1.5, 7.5},
  {5400, "Bogense", 1.5, 7.5},
  {6400, "Sønderborg", 1.5, 7.5},
  {6100, "Haderslev", 1.5, 7.5},
  {6000, "Kolding", 1.5, 7.5},
  {8722, "Hedensted", 1.5, 7.5},
  {8700, "Horsens", 1.5, 7.5},
  {8300, "Odder", 1.5, 7.5},
  {8660, "Skanderborg", 1.5, 7.5},
  {8000, "Aarhus", 1.5, 7.25},
  {8900, "Randers", 1.5, 7.5},
  {8000, "Aalborg", 1.5, 7.25},
  {9800, "Hjørring", 1.5, 7.75},
  {7700, "Thisted", 1.5, 7.5},
  {2750, "Ballerup", 2.1, 7.5},
  {2605, "Brøndby", 2.1, 7.5},
  {2820, "Gentofte", 2.1, 7.5},
  {2860, "Gladsaxe", 2.1, 7.5},
  {2670, "Greve", 2.1, 7.5},
  {2630, "Høje Taastrup", 2.1, 7.5},
  {2635, "Ishøj", 2.1, 7.5},
  {2800, "Lyngby-Taarbæk", 2.1, 7.5},
  {2625, "Vallensbæk", 2.1, 7.5},
  {4760, "Vordingborg", 2.1, 7.5},
  {5300, "Kerteminde", 2.1, 7.5},
  {5800, "Nyborg", 2.1, 7.5},
  {5500, "Middelfart", 2.1, 7.5},
  {3600, "Frederikssund", 2.1, 7.5},
  {2620, "Albertslund", 2.7, 7.5},
  {2790, "Dragør", 2.7, 7.5},
  {2600, "Glostrup", 2.7, 7.5},
  {2000, "Frederiksberg", 3.0, 7.75},
  {2650, "Hvidovre", 3.0, 7.5},
  {2610, "Rødovre", 3.0, 7.5}
};

int postDataSize = sizeof(postData) / sizeof(postData[0]);
