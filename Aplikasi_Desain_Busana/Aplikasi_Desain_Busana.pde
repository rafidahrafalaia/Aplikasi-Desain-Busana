//Last Update 14 juli 2019

ClassOneDropDownMenu[] menuList = new ClassOneDropDownMenu[7];
PGraphics[] pg = new PGraphics[26];
BufferedReader reader;
String line;
PrintWriter output;
ArrayList<Node> nodes, garisRok, garisRok2, polaRok1, polaRok2, polaRok3, polaRok4, polaRok5;
ArrayList<Node> garisAtasan, garisAtasan2, polaAtasan1, polaAtasan2, polaAtasan3, polaAtasan4, polaAtasan5, polaAtasan6, polaAtasan7,polaAtasan8;
ArrayList<Node> garisLeher, garisLeher2, polaLeher1, polaLeher2, polaLeher3, polaLeher4, polaLeher5;
ArrayList<Node> garisLengan, garisLengan2, polaLengan1, polaLengan2, polaLengan3, polaLengan4, polaLengan5;
ArrayList<Node> garisGaun, garisGaun2, polaGaun1, polaGaun2, polaGaun3, polaGaun4, polaGaun5, polaGaun6, polaGaun7, polaGaun8;
ArrayList<Node> garisCelana, garisCelana2, polaCelana1, polaCelana2, polaCelana3, polaCelana4, polaCelana5, polaCelana6, polaCelana7, polaCelana8;
ArrayList<Node>  garisAtasanlk, garisAtasanlk2, polaAtasanlk1, polaAtasanlk2, polaAtasanlk3, polaAtasanlk4, polaAtasanlk5,polaAtasanlk6, polaAtasanlk7, polaAtasanlk8;
ArrayList<Node>  garisLeherlk, garisLeherlk2, polaLeherlk1, polaLeherlk2, polaLeherlk3, polaLeherlk4, polaLeherlk5;
ArrayList<Node>  garisLenganlk, garisLenganlk2, polaLenganlk1, polaLenganlk2, polaLenganlk3, polaLenganlk4, polaLenganlk5;
ArrayList<Node>  garisCelanalk, garisCelanalk2, polaCelanalk1, polaCelanalk2, polaCelanalk3, polaCelanalk4, polaCelanalk5, polaCelanalk6, polaCelanalk7, polaCelanalk8;
Printer myPrinter;
ArrayList<Node1> rok1, rok2, rok3, atasan1, atasan2, atasan3, leher1, leher2, leher3, lengan1, lengan2, lengan3,lengan4, gaun1, gaun2, gaun3,
celana1, celana2, celana3, atasanlk1, atasanlk2, atasanlk3, leherlk1, leherlk2, leherlk3,lenganlk1, lenganlk2, lenganlk3,celanalk1, celanalk2, celanalk3 ;
String[] urlTex1 = new String[56], urlTex2 = new String[56], urlTex3 = new String[56];
String urlTexture;
PImage[] img2d = new PImage[21], imgtex1 = new PImage[56], imgtex2 = new PImage[56],  
         imgRok = new PImage[19], imgAtasan = new PImage[10],imgLeher = new PImage[19], imgLengan = new PImage[25], 
         imgGaun = new PImage[13], imgCelana = new PImage[7], //wanita
         imgAtasanLk = new PImage[7], imgLeherLk = new PImage[19], imgLenganLk = new PImage[13],imgCelanaLk = new PImage[7];        
PImage imageTexture;
int text=0;
boolean pgTutor = true, pgAction = true, pgTex1 = false, pgTex2 = false, pgUkuranW = false, pgUkuranP= false, 
        pgRok = false, pgAtasan = false, pgLeher = false,pgLengan = false, pgGaun = false, pgCelana = false, 
        pgAtasanLk = false,pgLeherLk = false, pgLenganLk, pgCelanaLk = false, pgOpt = false;
boolean grid2D = true, controlDown = false,threeDimension = false, shiftDown = false, newProject = true;//threeDimension = false
boolean citraKain = false;
boolean rok = false, atasan = false, leher= false, lengan = false, gaun = false, celana = false, 
        atasanlk = false, leherlk = false, lenganlk = false, celanalk = false;
int nodesSize = 0, selectedTex = 0, templateRok = 0, templateAtasan = 0, templateLeher = 0, templateLengan = 0,//geserNode = -1,
    templateGaun = 0, templateCelana = 0, templateAtasanlk = 0, templateLeherlk = 0, templateLenganlk = 0, templateCelanalk = 0;
int c;
int size=2;
//davin
ArrayList<String> child = new ArrayList<String>();

void setup() {
  //size(1200, 500, p2d);
  fullScreen(P2D);
  noSmooth();
  pg[1] = createGraphics(width, 25, P2D); //menubar
  pg[2] = createGraphics(width/3, height-25, P2D); //menubar
  for (int i=3; i<=9; i++)
    pg[i] = createGraphics(width/3, height-25, P2D); //draw 2D
  pg[10] = createGraphics(width/3, 300, P2D); //menubar
  pg[11] = createGraphics(width/3, height-250, P2D); //menubar
  pg[12] = createGraphics(width/3, height-250, P2D); // Template Atasan
  pg[13] = createGraphics(width/3, height-250, P2D); // Template Rok
  pg[14] = createGraphics(width/3, height-250, P2D); // Template Gaun
  pg[15] = createGraphics(width/3, height-250, P2D); // Template Celana
  pg[16] = createGraphics(width/3, height-250, P2D); //Template Atasan Laki-laki
  pg[17] = createGraphics(width/3, height-250, P2D); //Template Celana Laki-laki
  pg[18] = createGraphics(width/3, height-250, P2D); //template Leher wanita
  pg[19] = createGraphics(width/3, height-250, P2D); // template lengan wanita
  pg[20] = createGraphics(width/3, height-250, P2D); // template leher laki-laki
  pg[21] = createGraphics(width/3, height-250, P2D); //template lengan laki-laki
  pg[22] = createGraphics(width/3, height-250, P2D); //template ukuran cewe
  pg[23] = createGraphics(width/3, height-250, P2D); //template ukuran pria
  
  //davin
  pg[24] = createGraphics(width/3, height-250, P2D); //outer
  pg[25] = createGraphics(417, 150, P2D); //inner
  
  myPrinter = new Printer();
  nodes = new ArrayList<Node>();
  rok1 = new ArrayList<Node1>();
  rok2 = new ArrayList<Node1>();
  rok3 = new ArrayList<Node1>();
  garisRok = new ArrayList<Node>();
  garisRok2 = new ArrayList<Node>();
  polaRok1 = new ArrayList<Node>();
  polaRok2 = new ArrayList<Node>();
  polaRok3 = new ArrayList<Node>();
  polaRok4 = new ArrayList<Node>();
  polaRok5 = new ArrayList<Node>();
  
  atasan1 = new ArrayList<Node1>();
  atasan2 = new ArrayList<Node1>();
  atasan3 = new ArrayList<Node1>();
  garisAtasan = new ArrayList<Node>();
  garisAtasan2 = new ArrayList<Node>();
  polaAtasan1 = new ArrayList<Node>();
  polaAtasan2 = new ArrayList<Node>();
  polaAtasan3 = new ArrayList<Node>();
  polaAtasan4 = new ArrayList<Node>();
  polaAtasan5 = new ArrayList<Node>();
  polaAtasan6 = new ArrayList<Node>();
  polaAtasan7 = new ArrayList<Node>();
  polaAtasan8 = new ArrayList<Node>();
  
  gaun1 = new ArrayList<Node1>();
  gaun2 = new ArrayList<Node1>();
  gaun3 = new ArrayList<Node1>();
  garisGaun = new ArrayList<Node>();
  garisGaun2 = new ArrayList<Node>();
  polaGaun1 = new ArrayList<Node>();
  polaGaun2 = new ArrayList<Node>();
  polaGaun3 = new ArrayList<Node>();
  polaGaun4 = new ArrayList<Node>();
  polaGaun5 = new ArrayList<Node>();
  polaGaun6 = new ArrayList<Node>();
  polaGaun7 = new ArrayList<Node>();
  polaGaun8 = new ArrayList<Node>();
  
  celana1 = new ArrayList<Node1>();
  celana2 = new ArrayList<Node1>();
  celana3 = new ArrayList<Node1>();
  garisCelana = new ArrayList<Node>();
  garisCelana2 = new ArrayList<Node>();
  polaCelana1 = new ArrayList<Node>();
  polaCelana2 = new ArrayList<Node>();
  polaCelana3 = new ArrayList<Node>();
  polaCelana4 = new ArrayList<Node>();
  polaCelana5 = new ArrayList<Node>();
  polaCelana6 = new ArrayList<Node>();
  polaCelana7 = new ArrayList<Node>();
  polaCelana8 = new ArrayList<Node>();
  
  atasanlk1 = new ArrayList<Node1>();
  atasanlk2 = new ArrayList<Node1>();
  atasanlk3 = new ArrayList<Node1>();
  garisAtasanlk = new ArrayList<Node>();
  garisAtasanlk2 = new ArrayList<Node>();
  polaAtasanlk1 = new ArrayList<Node>();
  polaAtasanlk2 = new ArrayList<Node>();
  polaAtasanlk3 = new ArrayList<Node>();
  polaAtasanlk4 = new ArrayList<Node>();
  polaAtasanlk5 = new ArrayList<Node>();
  polaAtasanlk6 = new ArrayList<Node>();
  polaAtasanlk7 = new ArrayList<Node>();
  polaAtasanlk8 = new ArrayList<Node>();
  
  celanalk1 = new ArrayList<Node1>();
  celanalk2 = new ArrayList<Node1>();
  celanalk3 = new ArrayList<Node1>();
  garisCelanalk = new ArrayList<Node>();
  garisCelanalk2 = new ArrayList<Node>();
  polaCelanalk1 = new ArrayList<Node>();
  polaCelanalk2 = new ArrayList<Node>();
  polaCelanalk3 = new ArrayList<Node>();
  polaCelanalk4 = new ArrayList<Node>();
  polaCelanalk5 = new ArrayList<Node>();
  polaCelanalk6 = new ArrayList<Node>();
  polaCelanalk7 = new ArrayList<Node>();
  polaCelanalk8 = new ArrayList<Node>();
  
  leher1 = new ArrayList<Node1>();
  leher2 = new ArrayList<Node1>();
  leher3 = new ArrayList<Node1>();
  garisLeher = new ArrayList<Node>();
  garisLeher2 = new ArrayList<Node>();
  polaLeher1 = new ArrayList<Node>();
  polaLeher2 = new ArrayList<Node>();
  polaLeher3 = new ArrayList<Node>();
  polaLeher4 = new ArrayList<Node>();
  polaLeher5 = new ArrayList<Node>();
  
  lengan1 = new ArrayList<Node1>();
  lengan2 = new ArrayList<Node1>();
  lengan3 = new ArrayList<Node1>();
  lengan4 = new ArrayList<Node1>();
  garisLengan = new ArrayList<Node>();
  garisLengan2 = new ArrayList<Node>();
  polaLengan1 = new ArrayList<Node>();
  polaLengan2 = new ArrayList<Node>();
  polaLengan3 = new ArrayList<Node>();
  polaLengan4 = new ArrayList<Node>();
  polaLengan5 = new ArrayList<Node>();
  
  leherlk1 = new ArrayList<Node1>();
  leherlk2 = new ArrayList<Node1>();
  leherlk3 = new ArrayList<Node1>();
  garisLeherlk = new ArrayList<Node>();
  garisLeherlk2 = new ArrayList<Node>();
  polaLeherlk1 = new ArrayList<Node>();
  polaLeherlk2 = new ArrayList<Node>();
  polaLeherlk3 = new ArrayList<Node>();
  polaLeherlk4 = new ArrayList<Node>();
  polaLeherlk5 = new ArrayList<Node>();

  lenganlk1 = new ArrayList<Node1>();
  lenganlk2 = new ArrayList<Node1>();
  lenganlk3 = new ArrayList<Node1>();
  garisLenganlk = new ArrayList<Node>();
  garisLenganlk2 = new ArrayList<Node>();
  polaLenganlk1 = new ArrayList<Node>();
  polaLenganlk2 = new ArrayList<Node>();
  polaLenganlk3 = new ArrayList<Node>();
  polaLenganlk4 = new ArrayList<Node>();
  polaLenganlk5 = new ArrayList<Node>();
  urlTexture = "Textures/a/imgtex_default.jpg";
  defineMenus();
 
  for (int i=1; i<urlTex1.length; i++) {
    urlTex1[i] = "Textures/a/imgtex ("+i+").jpg";
    imgtex1[i] = loadImage(urlTex1[i]);
  }
  for (int i=1; i<urlTex2.length; i++) {
    urlTex2[i] = "Textures/b/imgtex ("+i+").jpg";
    imgtex2[i] = loadImage(urlTex2[i]);
  }
  for (int i=1; i<imgRok.length; i++) {
    imgRok[i] = loadImage("Busana_Rok/Rok_"+i+".jpg");
  }
  for (int i=1; i<imgAtasan.length; i++) {
    imgAtasan[i] = loadImage("Busana_Atasan/Atasan_"+i+".jpg");
  }
  for (int i=1; i<imgLeher.length; i++) {
    imgLeher[i] = loadImage("Busana_Leher/Leher_"+i+".jpg");
  }
  for (int i=1; i<imgLengan.length; i++) {
    imgLengan[i] = loadImage("Busana_Lengan/Lengan_"+i+".jpg");
  }
  for (int i=1; i<imgGaun.length; i++) {
    imgGaun[i] = loadImage("Busana_Gaun/Gaun_"+i+".jpg");
  }
  for (int i=1; i<imgCelana.length; i++) {
    imgCelana[i] = loadImage("Busana_Celana/Celana_"+i+".jpg");
  }
  for (int i=1; i<imgAtasanLk.length; i++) {
    imgAtasanLk[i] = loadImage("Busana_AtasanLk/AtasanLk_"+i+".jpg");
  }
  for (int i=1; i<imgCelanaLk.length; i++) {
    imgCelanaLk[i] = loadImage("Busana_CelanaLk/CelanaLk_"+i+".jpg");
  }
  for (int i=1; i<imgLeherLk.length; i++) {
    imgLeherLk[i] = loadImage("Busana_LeherLk/LeherLk_"+i+".jpg");
  }
  for (int i=1; i<imgLenganLk.length; i++) {
    imgLenganLk[i] = loadImage("Busana_LenganLk/LenganLk_"+i+".jpg");
  }
  
  //davinpg
}

public void draw() {
  drawPgMenuBar();
  drawPgVisualisasiPola();
  drawPgVisualisasiBusana();
  drawPgTemplateRok();
  drawPgTemplateAtasan();
  drawPgTemplateLeher();
  drawPgTemplateLengan();
  drawPgTemplateGaun();
  drawPgTemplateCelana();
  drawPgTemplateAtasanLk();
  drawPgTemplateCelanaLk();
  drawPgTemplateLeherLk();
  drawPgTemplateLenganLk();
  drawPgTemplateUkuranW();
  drawPgTemplateUkuranP();
  drawPgTutorial();
  
  //davin
  //drawPgOpt();
  
  drawPgAction();
  drawPola();
  imagePgs();
  drawMenuBar();
}

public void base() {  
  pg[3].beginDraw();
  pg[3].fill(35);
  if (rok) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = rok1.size()-1; i >= 0; i--)
      pg[3].vertex(rok1.get(i).x1, rok1.get(i).z1-pg[1].height,rok1.get(i).x2, rok1.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = rok2.size()-1; i >= 0; i--)
      pg[3].vertex(rok2.get(i).x1, rok2.get(i).z1-pg[1].height, rok2.get(i).x2, rok2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = rok3.size()-1; i >= 0; i--)
      pg[3].vertex(rok3.get(i).x1, rok3.get(i).z1-pg[1].height, rok3.get(i).x2, rok3.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisRok.size()-1; i >= 0; i--)
      pg[3].vertex(garisRok.get(i).x, garisRok.get(i).z-pg[1].height);
    pg[3].endShape();  
    pg[3].beginShape(LINES);
    for (int i = garisRok2.size()-1; i >= 0; i--)
      pg[3].vertex(garisRok2.get(i).x, garisRok2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  if (atasan) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = atasan1.size()-1; i >= 0; i--)
      pg[3].vertex(atasan1.get(i).x1, atasan1.get(i).z1-pg[1].height, atasan1.get(i).x2, atasan1.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = atasan2.size()-1; i >= 0; i--)
      pg[3].vertex(atasan2.get(i).x1, atasan2.get(i).z1-pg[1].height,atasan2.get(i).x2, atasan2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = atasan3.size()-1; i >= 0; i--)
      pg[3].vertex(atasan3.get(i).x1, atasan3.get(i).z1-pg[1].height, atasan3.get(i).x2, atasan3.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisAtasan.size()-1; i >= 0; i--)
      pg[3].vertex(garisAtasan.get(i).x, garisAtasan.get(i).z-pg[1].height);
    pg[3].endShape();  
    pg[3].beginShape(LINES);
    for (int i = garisAtasan2.size()-1; i >= 0; i--)
      pg[3].vertex(garisAtasan2.get(i).x, garisAtasan2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  if (lengan) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = lengan1.size()-1; i >= 0; i--)
      pg[3].vertex(lengan1.get(i).x1, lengan1.get(i).z1-pg[1].height,lengan1.get(i).x2, lengan1.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = lengan2.size()-1; i >= 0; i--)
      pg[3].vertex(lengan2.get(i).x1, lengan2.get(i).z1-pg[1].height,lengan2.get(i).x2, lengan2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = lengan3.size()-1; i >= 0; i--)
      pg[3].vertex(lengan3.get(i).x1, lengan3.get(i).z1-pg[1].height,lengan3.get(i).x2, lengan3.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = lengan4.size()-1; i >= 0; i--)
      pg[3].vertex(lengan4.get(i).x1, lengan4.get(i).z1-pg[1].height,lengan4.get(i).x2, lengan4.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisLengan.size()-1; i >= 0; i--)
      pg[3].vertex(garisLengan.get(i).x, garisLengan.get(i).z-pg[1].height);
    pg[3].endShape();  
    pg[3].beginShape(LINES);
    for (int i = garisLengan2.size()-1; i >= 0; i--)
      pg[3].vertex(garisLengan2.get(i).x, garisLengan2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  if (lenganlk) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = lenganlk1.size()-1; i >= 0; i--)
      pg[3].vertex(lenganlk1.get(i).x1, lenganlk1.get(i).z1-pg[1].height, lenganlk1.get(i).x2, lenganlk1.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = lenganlk2.size()-1; i >= 0; i--)
      pg[3].vertex(lenganlk2.get(i).x1, lenganlk2.get(i).z1-pg[1].height, lenganlk2.get(i).x2, lenganlk2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = lenganlk3.size()-1; i >= 0; i--)
      pg[3].vertex(lenganlk3.get(i).x1, lenganlk3.get(i).z1-pg[1].height, lenganlk3.get(i).x2, lenganlk3.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisLenganlk.size()-1; i >= 0; i--)
      pg[3].vertex(garisLenganlk.get(i).x, garisLenganlk.get(i).z-pg[1].height);
    pg[3].endShape();  
    pg[3].beginShape(LINES);
    for (int i = garisLenganlk2.size()-1; i >= 0; i--)
      pg[3].vertex(garisLenganlk2.get(i).x, garisLenganlk2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  if (leher) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = leher1.size()-1; i >= 0; i--)
      pg[3].vertex(leher1.get(i).x1, leher1.get(i).z1-pg[1].height,leher1.get(i).x2, leher1.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = leher2.size()-1; i >= 0; i--)
      pg[3].vertex(leher2.get(i).x1, leher2.get(i).z1-pg[1].height,leher2.get(i).x2, leher2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = leher3.size()-1; i >= 0; i--)
      pg[3].vertex(leher3.get(i).x1, leher3.get(i).z1-pg[1].height,leher3.get(i).x2, leher3.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisLeher.size()-1; i >= 0; i--)
      pg[3].vertex(garisLeher.get(i).x, garisLeher.get(i).z-pg[1].height);
    pg[3].endShape();  
    pg[3].beginShape(LINES);
    for (int i = garisLeher2.size()-1; i >= 0; i--)
      pg[3].vertex(garisLeher2.get(i).x, garisLeher2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  if (leherlk) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = leherlk1.size()-1; i >= 0; i--)
      pg[3].vertex(leherlk1.get(i).x1, leherlk1.get(i).z1-pg[1].height, leherlk1.get(i).x2, leherlk1.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = leherlk2.size()-1; i >= 0; i--)
      pg[3].vertex(leherlk2.get(i).x1, leherlk2.get(i).z1-pg[1].height,leherlk2.get(i).x2, leherlk2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = leherlk3.size()-1; i >= 0; i--)
      pg[3].vertex(leherlk3.get(i).x1, leherlk3.get(i).z1-pg[1].height, leherlk3.get(i).x2, leherlk3.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisLeherlk.size()-1; i >= 0; i--)
      pg[3].vertex(garisLeherlk.get(i).x, garisLeherlk.get(i).z-pg[1].height);
    pg[3].endShape();  
    pg[3].beginShape(LINES);
    for (int i = garisLeherlk2.size()-1; i >= 0; i--)
      pg[3].vertex(garisLeherlk2.get(i).x, garisLeherlk2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  if (gaun) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = gaun1.size()-1; i >= 0; i--)
      pg[3].vertex(gaun1.get(i).x1, gaun1.get(i).z1-pg[1].height, gaun1.get(i).x2, gaun1.get(i).y2-pg[1].height); 
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = gaun2.size()-1; i >= 0; i--)
      pg[3].vertex(gaun2.get(i).x1, gaun2.get(i).z1-pg[1].height ,gaun2.get(i).x2, gaun2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = gaun3.size()-1; i >= 0; i--)
      pg[3].vertex(gaun3.get(i).x1, gaun3.get(i).z1-pg[1].height, gaun3.get(i).x2, gaun3.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisGaun.size()-1; i >= 0; i--)
      pg[3].vertex(garisGaun.get(i).x, garisGaun.get(i).z-pg[1].height);
    pg[3].endShape();  
    pg[3].beginShape(LINES);
    for (int i = garisGaun2.size()-1; i >= 0; i--)
      pg[3].vertex(garisGaun2.get(i).x, garisGaun2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  if (celana) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = celana1.size()-1; i >= 0; i--)
      pg[3].vertex(celana1.get(i).x1, celana1.get(i).z1-pg[1].height, celana1.get(i).x2, celana1.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = celana2.size()-1; i >= 0; i--)
      pg[3].vertex(celana2.get(i).x1, celana2.get(i).z1-pg[1].height ,celana2.get(i).x2, celana2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = celana3.size()-1; i >= 0; i--)
      pg[3].vertex(celana3.get(i).x1, celana3.get(i).z1-pg[1].height ,celana3.get(i).x2, celana3.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisCelana.size()-1; i >= 0; i--)
      pg[3].vertex(garisCelana.get(i).x, garisCelana.get(i).z-pg[1].height);
    pg[3].endShape();  
    pg[3].beginShape(LINES);
    for (int i = garisCelana2.size()-1; i >= 0; i--)
      pg[3].vertex(garisCelana2.get(i).x, garisCelana2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  if (atasanlk) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = atasanlk1.size()-1; i >= 0; i--)
      pg[3].vertex(atasanlk1.get(i).x1, atasanlk1.get(i).z1-pg[1].height,atasanlk1.get(i).x2, atasanlk1.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = atasanlk2.size()-1; i >= 0; i--)
      pg[3].vertex(atasanlk2.get(i).x1, atasanlk2.get(i).z1-pg[1].height,atasanlk2.get(i).x2, atasanlk2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = atasanlk3.size()-1; i >= 0; i--)
      pg[3].vertex(atasanlk3.get(i).x1, atasanlk3.get(i).z1-pg[1].height,atasanlk3.get(i).x2, atasanlk3.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisAtasanlk.size()-1; i >= 0; i--)
      pg[3].vertex(garisAtasanlk.get(i).x, garisAtasanlk.get(i).z-pg[1].height);
    pg[3].endShape();  
    pg[3].beginShape(LINES);
    for (int i = garisAtasanlk2.size()-1; i >= 0; i--)
      pg[3].vertex(garisAtasanlk2.get(i).x, garisAtasanlk2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  if (celanalk) {
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = celanalk1.size()-1; i >= 0; i--)
      pg[3].vertex(celanalk1.get(i).x1, celanalk1.get(i).z1-pg[1].height,celanalk1.get(i).x2, celanalk1.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE); 
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = celanalk2.size()-1; i >= 0; i--)
      pg[3].vertex(celanalk2.get(i).x1, celanalk2.get(i).z1-pg[1].height,celanalk2.get(i).x2, celanalk2.get(i).y2-pg[1].height);
    pg[3].endShape(CLOSE);
    pg[3].beginShape(POLYGON);
    if (citraKain)
      pg[3].texture(imageTexture);
    for (int i = celanalk3.size()-1; i >= 0; i--)
      pg[3].vertex(celanalk3.get(i).x1, celanalk3.get(i).z1-pg[1].height,celanalk3.get(i).x2, celanalk3.get(i).y2-pg[1].height);//,celanalk3.get(i).x1, celanalk3.get(i).y1
    pg[3].endShape(CLOSE);
    pg[3].beginShape(LINES);
    for (int i = garisCelanalk.size()-1; i >= 0; i--)
      pg[3].vertex(garisCelanalk.get(i).x, garisCelanalk.get(i).z-pg[1].height);
    pg[3].endShape();  
    for (int i = garisCelanalk2.size()-1; i >= 0; i--)
      pg[3].vertex(garisCelanalk2.get(i).x, garisCelanalk2.get(i).z-pg[1].height);
    pg[3].endShape();
  }
  pg[3].endDraw();
}

public void base1() {
  pg[2].beginDraw();
  pg[2].fill(35);
  if (rok) {
    pg[2].beginShape(POLYGON);
    for (int i = polaRok1.size()-1; i >= 0; i--)
      pg[2].vertex(polaRok1.get(i).x, polaRok1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaRok2.size()-1; i >= 0; i--)
      pg[2].vertex(polaRok2.get(i).x, polaRok2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaRok3.size()-1; i >= 0; i--)
      pg[2].vertex(polaRok3.get(i).x, polaRok3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaRok4.size()-1; i >= 0; i--)
      pg[2].vertex(polaRok4.get(i).x, polaRok4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaRok5.size()-1; i >= 0; i--)
      pg[2].vertex(polaRok5.get(i).x, polaRok5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  if (atasan) {
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasan1.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasan1.get(i).x, polaAtasan1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasan2.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasan2.get(i).x, polaAtasan2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasan3.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasan3.get(i).x, polaAtasan3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasan4.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasan4.get(i).x, polaAtasan4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasan5.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasan5.get(i).x, polaAtasan5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasan6.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasan6.get(i).x, polaAtasan6.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasan7.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasan7.get(i).x, polaAtasan7.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasan8.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasan8.get(i).x, polaAtasan8.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  if (leher) {
    pg[2].beginShape(POLYGON);
    for (int i = polaLeher1.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeher1.get(i).x, polaLeher1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaLeher2.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeher2.get(i).x, polaLeher2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaLeher3.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeher3.get(i).x, polaLeher3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaLeher4.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeher4.get(i).x, polaLeher4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaLeher5.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeher5.get(i).x, polaLeher5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  if (leherlk) {
    pg[2].beginShape(POLYGON);
    for (int i = polaLeherlk1.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeherlk1.get(i).x, polaLeherlk1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaLeherlk2.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeherlk2.get(i).x, polaLeherlk2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaLeherlk3.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeherlk3.get(i).x, polaLeherlk3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaLeherlk4.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeherlk4.get(i).x, polaLeherlk4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaLeherlk5.size()-1; i >= 0; i--)
      pg[2].vertex(polaLeherlk5.get(i).x, polaLeherlk5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  if (lengan) {
    pg[2].beginShape(POLYGON);
    for (int i = polaLengan1.size()-1; i >= 0; i--)
      pg[2].vertex(polaLengan1.get(i).x, polaLengan1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaLengan2.size()-1; i >= 0; i--)
      pg[2].vertex(polaLengan2.get(i).x, polaLengan2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaLengan3.size()-1; i >= 0; i--)
      pg[2].vertex(polaLengan3.get(i).x, polaLengan3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaLengan4.size()-1; i >= 0; i--)
      pg[2].vertex(polaLengan4.get(i).x, polaLengan4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaLengan5.size()-1; i >= 0; i--)
      pg[2].vertex(polaLengan5.get(i).x, polaLengan5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  if (lenganlk) {
    pg[2].beginShape(POLYGON);
    for (int i = polaLenganlk1.size()-1; i >= 0; i--)
      pg[2].vertex(polaLenganlk1.get(i).x, polaLenganlk1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaLenganlk2.size()-1; i >= 0; i--)
      pg[2].vertex(polaLenganlk2.get(i).x, polaLenganlk2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaLenganlk3.size()-1; i >= 0; i--)
      pg[2].vertex(polaLenganlk3.get(i).x, polaLenganlk3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaLenganlk4.size()-1; i >= 0; i--)
      pg[2].vertex(polaLenganlk4.get(i).x, polaLenganlk4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaLenganlk5.size()-1; i >= 0; i--)
      pg[2].vertex(polaLenganlk5.get(i).x, polaLenganlk5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  if (gaun) {
    pg[2].beginShape(POLYGON);
    for (int i = polaGaun1.size()-1; i >= 0; i--)
      pg[2].vertex(polaGaun1.get(i).x, polaGaun1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaGaun2.size()-1; i >= 0; i--)
      pg[2].vertex(polaGaun2.get(i).x, polaGaun2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaGaun3.size()-1; i >= 0; i--)
      pg[2].vertex(polaGaun3.get(i).x, polaGaun3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaGaun4.size()-1; i >= 0; i--)
      pg[2].vertex(polaGaun4.get(i).x, polaGaun4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaGaun4.size()-1; i >= 0; i--)
      pg[2].vertex(polaGaun4.get(i).x, polaGaun4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaGaun5.size()-1; i >= 0; i--)
      pg[2].vertex(polaGaun5.get(i).x, polaGaun5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaGaun6.size()-1; i >= 0; i--)
      pg[2].vertex(polaGaun6.get(i).x, polaGaun6.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaGaun7.size()-1; i >= 0; i--)
      pg[2].vertex(polaGaun7.get(i).x, polaGaun7.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
     pg[2].beginShape(POLYGON);
    for (int i = polaGaun8.size()-1; i >= 0; i--)
      pg[2].vertex(polaGaun8.get(i).x, polaGaun8.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  if (celana) {
    pg[2].beginShape(POLYGON);
    for (int i = polaCelana1.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelana1.get(i).x, polaCelana1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaCelana2.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelana2.get(i).x, polaCelana2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaCelana3.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelana3.get(i).x, polaCelana3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaCelana4.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelana4.get(i).x, polaCelana4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaCelana5.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelana5.get(i).x, polaCelana5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaCelana6.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelana6.get(i).x, polaCelana6.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaCelana7.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelana7.get(i).x, polaCelana7.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaCelana8.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelana8.get(i).x, polaCelana8.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  if (atasanlk) {
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasanlk1.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasanlk1.get(i).x, polaAtasanlk1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasanlk2.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasanlk2.get(i).x, polaAtasanlk2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasanlk3.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasanlk3.get(i).x, polaAtasanlk3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasanlk4.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasanlk4.get(i).x, polaAtasanlk4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasanlk5.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasanlk5.get(i).x, polaAtasanlk5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasanlk6.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasanlk6.get(i).x, polaAtasanlk6.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasanlk7.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasanlk7.get(i).x, polaAtasanlk7.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaAtasanlk8.size()-1; i >= 0; i--)
      pg[2].vertex(polaAtasanlk8.get(i).x, polaAtasanlk8.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  if (celanalk) {
    pg[2].beginShape(POLYGON);
    for (int i = polaCelanalk1.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelanalk1.get(i).x, polaCelanalk1.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaCelanalk2.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelanalk2.get(i).x, polaCelanalk2.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaCelanalk3.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelanalk3.get(i).x, polaCelanalk3.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaCelanalk4.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelanalk4.get(i).x, polaCelanalk4.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaCelanalk5.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelanalk5.get(i).x, polaCelanalk5.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
    pg[2].beginShape(POLYGON);
    for (int i = polaCelanalk6.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelanalk6.get(i).x, polaCelanalk6.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaCelanalk7.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelanalk7.get(i).x, polaCelanalk7.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE); 
    pg[2].beginShape(POLYGON);
    for (int i = polaCelanalk8.size()-1; i >= 0; i--)
      pg[2].vertex(polaCelanalk8.get(i).x, polaCelanalk8.get(i).z-pg[1].height);
    pg[2].endShape(CLOSE);
  }
  pg[2].endDraw();
}

void newProject() {
  background(255);
  newProject = true;
  for (int i = rok1.size()-1; i >= 0; i--)
    rok1.remove(rok1.get(i));
  for (int i = rok2.size()-1; i >= 0; i--)
    rok2.remove(rok2.get(i));  
  for (int i = rok3.size()-1; i >= 0; i--)
    rok3.remove(rok3.get(i));
  for (int i = garisRok.size()-1; i >= 0; i--)
    garisRok.remove(garisRok.get(i));  
  for (int i = garisRok2.size()-1; i >= 0; i--)
    garisRok2.remove(garisRok2.get(i)); 
  for (int i = polaRok1.size()-1; i >= 0; i--)
    polaRok1.remove(polaRok1.get(i)); 
  for (int i = polaRok2.size()-1; i >= 0; i--)
    polaRok2.remove(polaRok2.get(i)); 
  for (int i = polaRok3.size()-1; i >= 0; i--)
    polaRok3.remove(polaRok3.get(i)); 
  for (int i = polaRok4.size()-1; i >= 0; i--)
    polaRok4.remove(polaRok4.get(i)); 
  for (int i = polaRok5.size()-1; i >= 0; i--)
    polaRok5.remove(polaRok5.get(i));   
  //atasan
  for (int i = atasan1.size()-1; i >= 0; i--)
    atasan1.remove(atasan1.get(i)); 
  for (int i = atasan2.size()-1; i >= 0; i--)
    atasan2.remove(atasan2.get(i));  
  for (int i = atasan3.size()-1; i >= 0; i--)
    atasan3.remove(atasan3.get(i));
  for (int i = garisAtasan.size()-1; i >= 0; i--)
    garisAtasan.remove(garisAtasan.get(i));  
  for (int i = garisAtasan2.size()-1; i >= 0; i--)
    garisAtasan2.remove(garisAtasan2.get(i)); 
  for (int i = polaAtasan1.size()-1; i >= 0; i--)
    polaAtasan1.remove(polaAtasan1.get(i)); 
  for (int i = polaAtasan2.size()-1; i >= 0; i--)
    polaAtasan2.remove(polaAtasan2.get(i)); 
  for (int i = polaAtasan3.size()-1; i >= 0; i--)
    polaAtasan3.remove(polaAtasan3.get(i)); 
  for (int i = polaAtasan4.size()-1; i >= 0; i--)
    polaAtasan4.remove(polaAtasan4.get(i)); 
  for (int i = polaAtasan5.size()-1; i >= 0; i--)
    polaAtasan5.remove(polaAtasan5.get(i));   
  for (int i = polaAtasan6.size()-1; i >= 0; i--)
    polaAtasan6.remove(polaAtasan6.get(i)); 
  for (int i = polaAtasan7.size()-1; i >= 0; i--)
    polaAtasan7.remove(polaAtasan7.get(i)); 
  for (int i = polaAtasan8.size()-1; i >= 0; i--)
    polaAtasan8.remove(polaAtasan8.get(i));    
    
  //leher
  for (int i = leher1.size()-1; i >= 0; i--)
    leher1.remove(leher1.get(i)); 
  for (int i = leher2.size()-1; i >= 0; i--)
    leher2.remove(leher2.get(i));  
  for (int i = leher3.size()-1; i >= 0; i--)
    leher3.remove(leher3.get(i));
  for (int i = garisLeher.size()-1; i >= 0; i--)
    garisLeher.remove(garisLeher.get(i));  
  for (int i = garisLeher2.size()-1; i >= 0; i--)
    garisLeher2.remove(garisLeher2.get(i)); 
  for (int i = polaLeher1.size()-1; i >= 0; i--)
    polaLeher1.remove(polaLeher1.get(i)); 
  for (int i = polaLeher2.size()-1; i >= 0; i--)
    polaLeher2.remove(polaLeher2.get(i)); 
  for (int i = polaLeher3.size()-1; i >= 0; i--)
    polaLeher3.remove(polaLeher3.get(i)); 
  for (int i = polaLeher4.size()-1; i >= 0; i--)
    polaLeher4.remove(polaLeher4.get(i)); 
  for (int i = polaLeher5.size()-1; i >= 0; i--)
    polaLeher5.remove(polaLeher5.get(i)); 
  
  //lengan
  for (int i = lengan1.size()-1; i >= 0; i--)
    lengan1.remove(lengan1.get(i)); 
  for (int i = lengan2.size()-1; i >= 0; i--)
    lengan2.remove(lengan2.get(i));  
  for (int i = lengan3.size()-1; i >= 0; i--)
    lengan3.remove(lengan3.get(i));
  for (int i = lengan4.size()-1; i >= 0; i--)
    lengan4.remove(lengan4.get(i));  
  for (int i = garisLengan.size()-1; i >= 0; i--)
    garisLengan.remove(garisLengan.get(i));  
  for (int i = garisLengan2.size()-1; i >= 0; i--)
    garisLengan2.remove(garisLengan2.get(i)); 
  for (int i = polaLengan1.size()-1; i >= 0; i--)
    polaLengan1.remove(polaLengan1.get(i)); 
  for (int i = polaLengan2.size()-1; i >= 0; i--)
    polaLengan2.remove(polaLengan2.get(i)); 
  for (int i = polaLengan3.size()-1; i >= 0; i--)
    polaLengan3.remove(polaLengan3.get(i)); 
  for (int i = polaLengan4.size()-1; i >= 0; i--)
    polaLengan4.remove(polaLengan4.get(i)); 
  for (int i = polaLengan5.size()-1; i >= 0; i--)
    polaLengan5.remove(polaLengan5.get(i)); 
  //gaun
  for (int i = gaun1.size()-1; i >= 0; i--)
    gaun1.remove(gaun1.get(i)); 
  for (int i = gaun2.size()-1; i >= 0; i--)
    gaun2.remove(gaun2.get(i));  
  for (int i = gaun3.size()-1; i >= 0; i--)
    gaun3.remove(gaun3.get(i));
  for (int i = garisGaun.size()-1; i >= 0; i--)
    garisGaun.remove(garisGaun.get(i));  
  for (int i = garisGaun2.size()-1; i >= 0; i--)
    garisGaun2.remove(garisGaun2.get(i)); 
  for (int i = polaGaun1.size()-1; i >= 0; i--)
    polaGaun1.remove(polaGaun1.get(i)); 
  for (int i = polaGaun2.size()-1; i >= 0; i--)
    polaGaun2.remove(polaGaun2.get(i)); 
  for (int i = polaGaun3.size()-1; i >= 0; i--)
    polaGaun3.remove(polaGaun3.get(i)); 
  for (int i = polaGaun4.size()-1; i >= 0; i--)
    polaGaun4.remove(polaGaun4.get(i)); 
  for (int i = polaGaun5.size()-1; i >= 0; i--)
    polaGaun5.remove(polaGaun5.get(i)); 
  for (int i = polaGaun6.size()-1; i >= 0; i--)
    polaGaun6.remove(polaGaun6.get(i)); 
  for (int i = polaGaun7.size()-1; i >= 0; i--)
    polaGaun7.remove(polaGaun7.get(i)); 
  for (int i = polaGaun8.size()-1; i >= 0; i--)
    polaGaun8.remove(polaGaun8.get(i));   
  //celana
   for (int i = celana1.size()-1; i >= 0; i--)
    celana1.remove(celana1.get(i)); 
  for (int i = celana2.size()-1; i >= 0; i--)
    celana2.remove(celana2.get(i));  
  for (int i = celana3.size()-1; i >= 0; i--)
    celana3.remove(celana3.get(i));
  for (int i = garisCelana.size()-1; i >= 0; i--)
    garisCelana.remove(garisCelana.get(i));  
  for (int i = garisCelana2.size()-1; i >= 0; i--)
    garisCelana2.remove(garisCelana2.get(i)); 
  for (int i = polaCelana1.size()-1; i >= 0; i--)
    polaCelana1.remove(polaCelana1.get(i)); 
  for (int i = polaCelana2.size()-1; i >= 0; i--)
    polaCelana2.remove(polaCelana2.get(i)); 
  for (int i = polaCelana3.size()-1; i >= 0; i--)
    polaCelana3.remove(polaCelana3.get(i)); 
  for (int i = polaCelana4.size()-1; i >= 0; i--)
    polaCelana4.remove(polaCelana4.get(i)); 
  for (int i = polaCelana5.size()-1; i >= 0; i--)
    polaCelana5.remove(polaCelana5.get(i));
  for (int i = polaCelana6.size()-1; i >= 0; i--)
    polaCelana6.remove(polaCelana6.get(i)); 
  for (int i = polaCelana7.size()-1; i >= 0; i--)
    polaCelana7.remove(polaCelana7.get(i)); 
  for (int i = polaCelana8.size()-1; i >= 0; i--)
    polaCelana8.remove(polaCelana8.get(i));  
  //atasanlk  
  for (int i = atasanlk1.size()-1; i >= 0; i--)
    atasanlk1.remove(atasanlk1.get(i)); 
  for (int i = atasanlk2.size()-1; i >= 0; i--)
    atasanlk2.remove(atasanlk2.get(i));  
  for (int i = atasanlk3.size()-1; i >= 0; i--)
    atasanlk3.remove(atasanlk3.get(i));
  for (int i = garisAtasanlk.size()-1; i >= 0; i--)
    garisAtasanlk.remove(garisAtasanlk.get(i));  
  for (int i = garisAtasanlk2.size()-1; i >= 0; i--)
    garisAtasanlk2.remove(garisAtasanlk2.get(i)); 
  for (int i = polaAtasanlk1.size()-1; i >= 0; i--)
    polaAtasanlk1.remove(polaAtasanlk1.get(i)); 
  for (int i = polaAtasanlk2.size()-1; i >= 0; i--)
    polaAtasanlk2.remove(polaAtasanlk2.get(i)); 
  for (int i = polaAtasanlk3.size()-1; i >= 0; i--)
    polaAtasanlk3.remove(polaAtasanlk3.get(i)); 
  for (int i = polaAtasanlk4.size()-1; i >= 0; i--)
    polaAtasanlk4.remove(polaAtasanlk4.get(i)); 
  for (int i = polaAtasanlk5.size()-1; i >= 0; i--)
    polaAtasanlk5.remove(polaAtasanlk5.get(i)); 
  for (int i = polaAtasanlk6.size()-1; i >= 0; i--)
    polaAtasanlk6.remove(polaAtasanlk6.get(i)); 
  for (int i = polaAtasanlk7.size()-1; i >= 0; i--)
    polaAtasanlk7.remove(polaAtasanlk7.get(i)); 
  for (int i = polaAtasanlk8.size()-1; i >= 0; i--)
    polaAtasanlk8.remove(polaAtasanlk8.get(i));   
   //leherlk
  for (int i = leherlk1.size()-1; i >= 0; i--)
    leherlk1.remove(leherlk1.get(i)); 
  for (int i = leherlk2.size()-1; i >= 0; i--)
    leherlk2.remove(leherlk2.get(i));  
  for (int i = leherlk3.size()-1; i >= 0; i--)
    leherlk3.remove(leherlk3.get(i));
  for (int i = garisLeherlk.size()-1; i >= 0; i--)
    garisLeherlk.remove(garisLeherlk.get(i));  
  for (int i = garisLeherlk2.size()-1; i >= 0; i--)
    garisLeherlk2.remove(garisLeherlk2.get(i)); 
  for (int i = polaLeherlk1.size()-1; i >= 0; i--)
    polaLeherlk1.remove(polaLeherlk1.get(i)); 
  for (int i = polaLeherlk2.size()-1; i >= 0; i--)
    polaLeherlk2.remove(polaLeherlk2.get(i)); 
  for (int i = polaLeherlk3.size()-1; i >= 0; i--)
    polaLeherlk3.remove(polaLeherlk3.get(i)); 
  for (int i = polaLeherlk4.size()-1; i >= 0; i--)
    polaLeherlk4.remove(polaLeherlk4.get(i)); 
  for (int i = polaLeherlk5.size()-1; i >= 0; i--)
    polaLeherlk5.remove(polaLeherlk5.get(i)); 
  //lengan laki-laki
  for (int i = lenganlk1.size()-1; i >= 0; i--)
    lenganlk1.remove(lenganlk1.get(i)); 
  for (int i = lenganlk2.size()-1; i >= 0; i--)
    lenganlk2.remove(lenganlk2.get(i));  
  for (int i = lenganlk3.size()-1; i >= 0; i--)
    lenganlk3.remove(lenganlk3.get(i));
  for (int i = garisLenganlk.size()-1; i >= 0; i--)
    garisLenganlk.remove(garisLenganlk.get(i));  
  for (int i = garisLenganlk2.size()-1; i >= 0; i--)
    garisLenganlk2.remove(garisLenganlk2.get(i)); 
  for (int i = polaLenganlk1.size()-1; i >= 0; i--)
    polaLenganlk1.remove(polaLenganlk1.get(i)); 
  for (int i = polaLenganlk2.size()-1; i >= 0; i--)
    polaLenganlk2.remove(polaLenganlk2.get(i)); 
  for (int i = polaLenganlk3.size()-1; i >= 0; i--)
    polaLenganlk3.remove(polaLenganlk3.get(i)); 
  for (int i = polaLenganlk4.size()-1; i >= 0; i--)
    polaLenganlk4.remove(polaLenganlk4.get(i)); 
  for (int i = polaLenganlk5.size()-1; i >= 0; i--)
    polaLenganlk5.remove(polaLenganlk5.get(i));   
  //celanalk
   for (int i = celanalk1.size()-1; i >= 0; i--)
    celanalk1.remove(celanalk1.get(i)); 
  for (int i = celanalk2.size()-1; i >= 0; i--)
    celanalk2.remove(celanalk2.get(i));  
  for (int i = celanalk3.size()-1; i >= 0; i--)
    celanalk3.remove(celanalk3.get(i));
  for (int i = garisCelanalk.size()-1; i >= 0; i--)
    garisCelanalk.remove(garisCelanalk.get(i));  
  for (int i = garisCelanalk2.size()-1; i >= 0; i--)
    garisCelanalk2.remove(garisCelanalk2.get(i)); 
  for (int i = polaCelanalk1.size()-1; i >= 0; i--)
    polaCelanalk1.remove(polaCelanalk1.get(i)); 
  for (int i = polaCelanalk2.size()-1; i >= 0; i--)
    polaCelanalk2.remove(polaCelanalk2.get(i)); 
  for (int i = polaCelanalk3.size()-1; i >= 0; i--)
    polaCelanalk3.remove(polaCelanalk3.get(i)); 
  for (int i = polaCelanalk4.size()-1; i >= 0; i--)
    polaCelanalk4.remove(polaCelanalk4.get(i)); 
  for (int i = polaCelanalk5.size()-1; i >= 0; i--)
    polaCelanalk5.remove(polaCelanalk5.get(i));  
  for (int i = polaCelanalk6.size()-1; i >= 0; i--)
    polaCelanalk6.remove(polaCelanalk6.get(i)); 
  for (int i = polaCelanalk7.size()-1; i >= 0; i--)
    polaCelanalk7.remove(polaCelanalk7.get(i)); 
  for (int i = polaCelanalk8.size()-1; i >= 0; i--)
    polaCelanalk8.remove(polaCelanalk8.get(i));          
}

public void selectAtasan() {
  if (templateAtasan>0) {
    if (!newProject) {
      for (int i = atasan1.size()-1; i >= 0; i--)
        atasan1.remove(atasan1.get(i));
      for (int i = atasan2.size()-1; i >= 0; i--)
        atasan2.remove(atasan2.get(i));
      for (int i = atasan3.size()-1; i >= 0; i--)
        atasan3.remove(atasan3.get(i));
      for (int i = garisAtasan.size()-1; i >= 0; i--)
        garisAtasan.remove(garisAtasan.get(i));
      for (int i = garisAtasan2.size()-1; i >= 0; i--)
        garisAtasan2.remove(garisAtasan2.get(i));
      for (int i = polaAtasan1.size()-1; i >= 0; i--)
        polaAtasan1.remove(polaAtasan1.get(i));
      for (int i = polaAtasan2.size()-1; i >= 0; i--)
        polaAtasan2.remove(polaAtasan2.get(i));
      for (int i = polaAtasan3.size()-1; i >= 0; i--)
        polaAtasan3.remove(polaAtasan3.get(i));
      for (int i = polaAtasan4.size()-1; i >= 0; i--)
        polaAtasan4.remove(polaAtasan4.get(i));
      for (int i = polaAtasan5.size()-1; i >= 0; i--)
        polaAtasan5.remove(polaAtasan5.get(i));
      for (int i = polaAtasan6.size()-1; i >= 0; i--)
        polaAtasan6.remove(polaAtasan6.get(i));
      for (int i = polaAtasan7.size()-1; i >= 0; i--)
        polaAtasan7.remove(polaAtasan7.get(i));
      for (int i = polaAtasan8.size()-1; i >= 0; i--)
        polaAtasan8.remove(polaAtasan8.get(i));  
    }
    newProject = true;
    if (templateAtasan==1 && size==1) { //POLA TANPA BUKAAN UKURAN S
      atasan1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasan1.add(new Node1(pg[3].width/2-20, 230,100,0));
      atasan1.add(new Node1(pg[3].width/2, 240,0,0));
      atasan1.add(new Node1(pg[3].width/2+20, 230,0,0));
      atasan1.add(new Node1(pg[3].width/2+25, 220,100,0)); // leher
      atasan1.add(new Node1(pg[3].width/2+55, 240,100,100)); //ketiak
      atasan1.add(new Node1(pg[3].width/2+45, 285,0,100));
      atasan1.add(new Node1(pg[3].width/2+45, 300,100,0));
      atasan1.add(new Node1(pg[3].width/2+55, 320,0,100));//ketiak
      atasan1.add(new Node1(pg[3].width/2+50, 350,0,0));
      atasan1.add(new Node1(pg[3].width/2+53, 380,0,0));
      atasan1.add(new Node1(pg[3].width/2+60, 420,50,500));
      atasan1.add(new Node1(pg[3].width/2-60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-53, 380,0,0));
      atasan1.add(new Node1(pg[3].width/2-50, 350,0,0));
      atasan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      atasan1.add(new Node1(pg[3].width/2-45, 300,100,50));
      atasan1.add(new Node1(pg[3].width/2-45, 285,50,50));
      atasan1.add(new Node1(pg[3].width/2-55, 240,0,50));
      //(Pola Depan)
      polaAtasan1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 22.5 *2.5, 50+ 3.5  *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 25.5 *2.5, 50+ 7    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 28.5 *2.5, 50+ 7    *2.5)); //3
      polaAtasan1.add(new Node(pg[2].width/20+ 31.5 *2.5, 50+ 3.5  *2.5)); //4
      polaAtasan1.add(new Node(pg[2].width/20+ 33   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 44   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 42.5 *2.5, 50+ 14.5 *2.5)); //I
      polaAtasan1.add(new Node(pg[2].width/20+ 44.5 *2.5, 50+ 18.5 *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 47   *2.5, 50+ 20.5 *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 22.5 *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 37.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 48.5 *2.5, 50+ 45.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 56.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 56.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 6.5  *2.5, 50+ 45.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 37.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 22.5 *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 20.5 *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 18.5 *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 11.5 *2.5, 50+ 14.5 *2.5)); //I

      //(Pola Belakang)     
      polaAtasan2.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20+ 22.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 50+ 2    *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 2    *2.5)); //3
      polaAtasan2.add(new Node(pg[2].width/20+ 31.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaAtasan2.add(new Node(pg[2].width/20+ 33   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20+ 44   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20+ 42.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      polaAtasan2.add(new Node(pg[2].width/20+ 44.5 *2.5 +200, 50+ 18.5 *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 20.5 *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 22.5 *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 37.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 48.5 *2.5 +200, 50+ 45.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 56.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 56.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20+ 6.5  *2.5 +200, 50+ 45.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 37.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I
    }
    if (templateAtasan==2  && size==1) { //POLA BUKAAN DEPAN UKURAN S
        atasan1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasan1.add(new Node1(pg[3].width/2-20, 230,100,0));
      atasan1.add(new Node1(pg[3].width/2, 240,50,50));
      atasan1.add(new Node1(pg[3].width/2+20, 230,100,100));
      atasan1.add(new Node1(pg[3].width/2+25, 220,0,100)); // leher
      atasan1.add(new Node1(pg[3].width/2+55, 240,0,0)); //ketiak
      atasan1.add(new Node1(pg[3].width/2+45, 285,100,0));
      atasan1.add(new Node1(pg[3].width/2+45, 300,100,100));
      atasan1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
      atasan1.add(new Node1(pg[3].width/2+50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2+53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2+60, 420,100,0));
      atasan1.add(new Node1(pg[3].width/2-60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2-50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      atasan1.add(new Node1(pg[3].width/2-45, 300,0,50));
      atasan1.add(new Node1(pg[3].width/2-45, 285,50,50));
      atasan1.add(new Node1(pg[3].width/2-55, 240,50,50));
      
      garisAtasan.add(new Node(pg[3].width/2, 240));
      garisAtasan.add(new Node(pg[3].width/2, 420));

      //(Pola Depan)
      //#Kiri
      polaAtasan1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 22.5 *2.5, 50+ 3.5  *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 25.5 *2.5, 50+ 7    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 32   *2.5, 50+ 7    *2.5)); 
      polaAtasan1.add(new Node(pg[2].width/20+ 32   *2.5, 50+ 56.5 *2.5)); //B
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 56.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 6.5  *2.5, 50+ 45.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 37.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 22.5 *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 20.5 *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 18.5 *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 11.5 *2.5, 50+ 14.5 *2.5)); //I

      //#Kanan
      polaAtasan2.add(new Node(pg[2].width/20- 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20- 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20- 22.5 *2.5 +200, 50+ 3.5  *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20- 25.5 *2.5 +200, 50+ 7    *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20- 32   *2.5 +200, 50+ 7    *2.5)); 
      polaAtasan2.add(new Node(pg[2].width/20- 32   *2.5 +200, 50+ 56.5 *2.5)); //B
      polaAtasan2.add(new Node(pg[2].width/20- 5.5  *2.5 +200, 50+ 56.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20- 6.5  *2.5 +200, 50+ 45.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20- 7.5  *2.5 +200, 50+ 37.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20- 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20- 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20- 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20- 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      
      //(Pola Belakang)
      polaAtasan3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan3.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan3.add(new Node(pg[2].width/20+ 22.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 50+ 2    *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 2    *2.5)); //3
      polaAtasan3.add(new Node(pg[2].width/20+ 31.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaAtasan3.add(new Node(pg[2].width/20+ 33   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan3.add(new Node(pg[2].width/20+ 44   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan3.add(new Node(pg[2].width/20+ 42.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      polaAtasan3.add(new Node(pg[2].width/20+ 44.5 *2.5 +200, 50+ 18.5 *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 20.5 *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 22.5 *2.5)); //E
      polaAtasan3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 37.5 *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 48.5 *2.5 +200, 50+ 45.5 *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 56.5 *2.5)); //N
      polaAtasan3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 56.5 *2.5)); //N
      polaAtasan3.add(new Node(pg[2].width/20+ 6.5  *2.5 +200, 50+ 45.5 *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 37.5 *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaAtasan3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20+ 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I
    }
    if (templateAtasan==3 && size==1) { //POLA BUKAAN BELAKANG UKURAN S
      atasan1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasan1.add(new Node1(pg[3].width/2-20, 230,100,0));
      atasan1.add(new Node1(pg[3].width/2, 240,50,50));
      atasan1.add(new Node1(pg[3].width/2+20, 230,100,100));
      atasan1.add(new Node1(pg[3].width/2+25, 220,0,100)); // leher
      atasan1.add(new Node1(pg[3].width/2+55, 240,0,0)); //ketiak
      atasan1.add(new Node1(pg[3].width/2+45, 285,100,0));
      atasan1.add(new Node1(pg[3].width/2+45, 300,100,100));
      atasan1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
      atasan1.add(new Node1(pg[3].width/2+50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2+53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2+60, 420,100,0));
      atasan1.add(new Node1(pg[3].width/2-60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2-50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      atasan1.add(new Node1(pg[3].width/2-45, 300,0,50));
      atasan1.add(new Node1(pg[3].width/2-45, 285,50,50));
      atasan1.add(new Node1(pg[3].width/2-55, 240,50,50));

       //(Pola Depan)
      polaAtasan1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 22.5 *2.5, 50+ 3.5  *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 25.5 *2.5, 50+ 7    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 28.5 *2.5, 50+ 7    *2.5)); //3
      polaAtasan1.add(new Node(pg[2].width/20+ 31.5 *2.5, 50+ 3.5  *2.5)); //4
      polaAtasan1.add(new Node(pg[2].width/20+ 33   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 44   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 42.5 *2.5, 50+ 14.5 *2.5)); //I
      polaAtasan1.add(new Node(pg[2].width/20+ 44.5 *2.5, 50+ 18.5 *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 47   *2.5, 50+ 20.5 *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 22.5 *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 37.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 48.5 *2.5, 50+ 45.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 56.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 56.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 6.5  *2.5, 50+ 45.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 37.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 22.5 *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 20.5 *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 18.5 *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 11.5 *2.5, 50+ 14.5 *2.5)); //I

      //(Pola Belakang)
      //#Kiri
      polaAtasan2.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20+ 22.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 50+ 2    *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 32   *2.5 +200, 50+ 2    *2.5)); 
      polaAtasan2.add(new Node(pg[2].width/20+ 32   *2.5 +200, 50+ 56.5 *2.5)); //B
      polaAtasan2.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 56.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20+ 6.5  *2.5 +200, 50+ 45.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 37.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I

      //#Kanan
      polaAtasan3.add(new Node(pg[2].width/20- 10   *2.5 +400, 50+ 3.5  *2.5)); //J
      polaAtasan3.add(new Node(pg[2].width/20- 21   *2.5 +400, 50+ 0    *2.5)); //F
      polaAtasan3.add(new Node(pg[2].width/20- 22.5 *2.5 +400, 50+ 1    *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20- 25.5 *2.5 +400, 50+ 2    *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20- 32   *2.5 +400, 50+ 2    *2.5)); 
      polaAtasan3.add(new Node(pg[2].width/20- 32   *2.5 +400, 50+ 56.5 *2.5)); //B
      polaAtasan3.add(new Node(pg[2].width/20- 5.5  *2.5 +400, 50+ 56.5 *2.5)); //N
      polaAtasan3.add(new Node(pg[2].width/20- 6.5  *2.5 +400, 50+ 45.5 *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20- 7.5  *2.5 +400, 50+ 37.5 *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20- 5.5  *2.5 +400, 50+ 22.5 *2.5)); //E
      polaAtasan3.add(new Node(pg[2].width/20- 7    *2.5 +400, 50+ 20.5 *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20- 9.5  *2.5 +400, 50+ 18.5 *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20- 11.5 *2.5 +400, 50+ 14.5 *2.5)); //I 
    }
    if (templateAtasan==1 && size==2) { // POLA TANPA BUKAAN UKURAN M
      atasan1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasan1.add(new Node1(pg[3].width/2-20, 230,0,0));
      atasan1.add(new Node1(pg[3].width/2, 240,0,0));
      atasan1.add(new Node1(pg[3].width/2+20, 230,0,0));
      atasan1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      atasan1.add(new Node1(pg[3].width/2+55, 240,100,0));
      atasan1.add(new Node1(pg[3].width/2+45, 285,100,0));
      atasan1.add(new Node1(pg[3].width/2+45, 300,100,0));
      atasan1.add(new Node1(pg[3].width/2+55, 320,100,100));
      atasan1.add(new Node1(pg[3].width/2+60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-55, 320,100,100));
      atasan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      atasan1.add(new Node1(pg[3].width/2-45, 285,0,100));
      atasan1.add(new Node1(pg[3].width/2-55, 240,0,100));

     //(Pola Depan)
      polaAtasan1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 22   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 23.5 *2.5, 50+ 4    *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 26.5 *2.5, 50+ 8    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 30.5 *2.5, 50+ 8    *2.5)); //3
      polaAtasan1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 4    *2.5)); //4
      polaAtasan1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 47   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 45   *2.5, 50+ 18   *2.5)); //I
      polaAtasan1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 22   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 49   *2.5, 50+ 24   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 26   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 50   *2.5, 50+ 41   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 51   *2.5, 50+ 51.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 66.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 66.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 51.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 41   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 26   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 8    *2.5, 50+ 24   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 22   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 12   *2.5, 50+ 18   *2.5)); //I

      //(Pola Belakang)
      polaAtasan2.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20+ 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20+ 23.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 26.5 *2.5 +200, 50+ 2.5  *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 30.5 *2.5 +200, 50+ 2.5  *2.5)); //3
      polaAtasan2.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaAtasan2.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20+ 45   *2.5 +200, 50+ 18   *2.5)); //I
      polaAtasan2.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 22   *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 49   *2.5 +200, 50+ 24   *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 26   *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 41   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 51   *2.5 +200, 50+ 51.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 66.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 66.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 51.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 41   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20+ 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 50+ 18   *2.5)); //I
    }
    if (templateAtasan==2 && size==2) { //POLA BUKAAN DEPAN UKURAN M
       atasan1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasan1.add(new Node1(pg[3].width/2-20, 230,100,0));
      atasan1.add(new Node1(pg[3].width/2, 240,50,50));
      atasan1.add(new Node1(pg[3].width/2+20, 230,100,100));
      atasan1.add(new Node1(pg[3].width/2+25, 220,0,100)); // leher
      atasan1.add(new Node1(pg[3].width/2+55, 240,0,0)); //ketiak
      atasan1.add(new Node1(pg[3].width/2+45, 285,100,0));
      atasan1.add(new Node1(pg[3].width/2+45, 300,100,100));
      atasan1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
      atasan1.add(new Node1(pg[3].width/2+50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2+53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2+60, 420,100,0));
      atasan1.add(new Node1(pg[3].width/2-60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2-50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      atasan1.add(new Node1(pg[3].width/2-45, 300,0,50));
      atasan1.add(new Node1(pg[3].width/2-45, 285,50,50));
      atasan1.add(new Node1(pg[3].width/2-55, 240,50,50));
      
     //(Pola Depan)
//#Kiri
      polaAtasan1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 22   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 23.5 *2.5, 50+ 4    *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 26.5 *2.5, 50+ 8    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 8    *2.5)); 
      polaAtasan1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 66.5 *2.5)); //B
      polaAtasan1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 66.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 51.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 41   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 26   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 8    *2.5, 50+ 24   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 22   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 12   *2.5, 50+ 18   *2.5)); //I

//#Kanan
      polaAtasan2.add(new Node(pg[2].width/20- 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20- 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 50+ 4    *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20- 26.5 *2.5 +200, 50+ 8    *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20- 33.5 *2.5 +200, 50+ 8    *2.5)); 
      polaAtasan2.add(new Node(pg[2].width/20- 33.5 *2.5 +200, 50+ 66.5 *2.5)); //B
      polaAtasan2.add(new Node(pg[2].width/20- 5    *2.5 +200, 50+ 66.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20- 6    *2.5 +200, 50+ 51.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20- 7    *2.5 +200, 50+ 41   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20- 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20- 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20- 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20- 12   *2.5 +200, 50+ 18   *2.5)); //I
      
      //(Pola Belakang)
      polaAtasan3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan3.add(new Node(pg[2].width/20+ 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan3.add(new Node(pg[2].width/20+ 23.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20+ 26.5 *2.5 +200, 50+ 2.5  *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20+ 30.5 *2.5 +200, 50+ 2.5  *2.5)); //3
      polaAtasan3.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaAtasan3.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan3.add(new Node(pg[2].width/20+ 45   *2.5 +200, 50+ 18   *2.5)); //I
      polaAtasan3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 22   *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20+ 49   *2.5 +200, 50+ 24   *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 26   *2.5)); //E      
      polaAtasan3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 41   *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 51   *2.5 +200, 50+ 51.5 *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 66.5 *2.5)); //N
      polaAtasan3.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 66.5 *2.5)); //N
      polaAtasan3.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 51.5 *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 41   *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaAtasan3.add(new Node(pg[2].width/20+ 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20+ 12   *2.5 +200, 50+ 18   *2.5)); //I
    }
    if (templateAtasan==3 && size==2) { //POLA BUKAAN BELAKANG UKURAN M
        atasan1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasan1.add(new Node1(pg[3].width/2-20, 230,100,0));
      atasan1.add(new Node1(pg[3].width/2, 240,50,50));
      atasan1.add(new Node1(pg[3].width/2+20, 230,100,100));
      atasan1.add(new Node1(pg[3].width/2+25, 220,0,100)); // leher
      atasan1.add(new Node1(pg[3].width/2+55, 240,0,0)); //ketiak
      atasan1.add(new Node1(pg[3].width/2+45, 285,100,0));
      atasan1.add(new Node1(pg[3].width/2+45, 300,100,100));
      atasan1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
      atasan1.add(new Node1(pg[3].width/2+50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2+53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2+60, 420,100,0));
      atasan1.add(new Node1(pg[3].width/2-60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2-50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      atasan1.add(new Node1(pg[3].width/2-45, 300,0,50));
      atasan1.add(new Node1(pg[3].width/2-45, 285,50,50));
      atasan1.add(new Node1(pg[3].width/2-55, 240,50,50));
      
      //(Pola Depan)
      polaAtasan1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 22   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 23.5 *2.5, 50+ 4    *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 26.5 *2.5, 50+ 8    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 30.5 *2.5, 50+ 8    *2.5)); //3
      polaAtasan1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 4    *2.5)); //4
      polaAtasan1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 47   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 45   *2.5, 50+ 18   *2.5)); //I
      polaAtasan1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 22   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 49   *2.5, 50+ 24   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 26   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 50   *2.5, 50+ 41   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 51   *2.5, 50+ 51.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 66.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 66.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 51.5 *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 41   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 26   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 8    *2.5, 50+ 24   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 22   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 12   *2.5, 50+ 18   *2.5)); //I
      
      //(Pola Belakang)
      //#Kiri
      polaAtasan2.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20+ 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20+ 23.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 26.5 *2.5 +200, 50+ 2.5  *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 50+ 2.5  *2.5)); 
      polaAtasan2.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 50+ 66.5 *2.5)); //B
      polaAtasan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 66.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 51.5 *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 41   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20+ 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 50+ 14.5 *2.5)); //I

      //#Kanan
      polaAtasan3.add(new Node(pg[2].width/20- 10   *2.5 +400, 50+ 3.5  *2.5)); //J
      polaAtasan3.add(new Node(pg[2].width/20- 22   *2.5 +400, 50+ 0    *2.5)); //F
      polaAtasan3.add(new Node(pg[2].width/20- 23.5 *2.5 +400, 50+ 1    *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20- 26.5 *2.5 +400, 50+ 2.5  *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20- 33.5 *2.5 +400, 50+ 2.5  *2.5)); 
      polaAtasan3.add(new Node(pg[2].width/20- 33.5 *2.5 +400, 50+ 66.5 *2.5)); //B
      polaAtasan3.add(new Node(pg[2].width/20- 5    *2.5 +400, 50+ 66.5 *2.5)); //N
      polaAtasan3.add(new Node(pg[2].width/20- 6    *2.5 +400, 50+ 51.5 *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20- 7    *2.5 +400, 50+ 41   *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20- 5    *2.5 +400, 50+ 26   *2.5)); //E
      polaAtasan3.add(new Node(pg[2].width/20- 8    *2.5 +400, 50+ 24   *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20- 9.5  *2.5 +400, 50+ 22   *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20- 12   *2.5 +400, 50+ 14.5 *2.5)); //I
    }
    if (templateAtasan==1 && size==3) { //POLA TANPA BUKAAN UKURAN L
       atasan1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasan1.add(new Node1(pg[3].width/2-20, 230,100,0));
      atasan1.add(new Node1(pg[3].width/2, 240,50,50));
      atasan1.add(new Node1(pg[3].width/2+20, 230,100,100));
      atasan1.add(new Node1(pg[3].width/2+25, 220,0,100)); // leher
      atasan1.add(new Node1(pg[3].width/2+55, 240,0,0)); //ketiak
      atasan1.add(new Node1(pg[3].width/2+45, 285,100,0));
      atasan1.add(new Node1(pg[3].width/2+45, 300,100,100));
      atasan1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
      atasan1.add(new Node1(pg[3].width/2+50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2+53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2+60, 420,100,0));
      atasan1.add(new Node1(pg[3].width/2-60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2-50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      atasan1.add(new Node1(pg[3].width/2-45, 300,0,50));
      atasan1.add(new Node1(pg[3].width/2-45, 285,50,50));
      atasan1.add(new Node1(pg[3].width/2-55, 240,50,50));
      
      //(Pola Depan)
      polaAtasan1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 23   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 24.5 *2.5, 50+ 5    *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 27.5 *2.5, 50+ 9    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 32.5 *2.5, 50+ 9    *2.5)); //3
      polaAtasan1.add(new Node(pg[2].width/20+ 35.5 *2.5, 50+ 5    *2.5)); //4
      polaAtasan1.add(new Node(pg[2].width/20+ 37   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 50   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 21   *2.5)); //I
      polaAtasan1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 26   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 28   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 54.5 *2.5, 50+ 30   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 52.5 *2.5, 50+ 48   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 53.5 *2.5, 50+ 66   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 54.5 *2.5, 50+ 76.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 76.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 6.5  *2.5, 50+ 66   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 48   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 30   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 28   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 26   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 50+ 21   *2.5)); //I

      //(Pola Belakang)
      polaAtasan2.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20+ 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20+ 24.5 *2.5 +200, 50+ 2    *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 27.5 *2.5 +200, 50+ 4    *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 32.5 *2.5 +200, 50+ 4    *2.5)); //3
      polaAtasan2.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 50+ 2    *2.5)); //4
      polaAtasan2.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 21   *2.5)); //I
      polaAtasan2.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 26   *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 28   *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 54.5 *2.5 +200, 50+ 30   *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20+ 52.5 *2.5 +200, 50+ 48   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 53.5 *2.5 +200, 50+ 66   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 54.5 *2.5 +200, 50+ 76.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 76.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20+ 6.5  *2.5 +200, 50+ 66   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 48   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 50+ 21   *2.5)); //I
    }
    if (templateAtasan==2 && size==3) {//POLA BUKAAN DEPAN UKURAN L
        atasan1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasan1.add(new Node1(pg[3].width/2-20, 230,100,0));
      atasan1.add(new Node1(pg[3].width/2, 240,50,50));
      atasan1.add(new Node1(pg[3].width/2+20, 230,100,100));
      atasan1.add(new Node1(pg[3].width/2+25, 220,0,100)); // leher
      atasan1.add(new Node1(pg[3].width/2+55, 240,0,0)); //ketiak
      atasan1.add(new Node1(pg[3].width/2+45, 285,100,0));
      atasan1.add(new Node1(pg[3].width/2+45, 300,100,100));
      atasan1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
      atasan1.add(new Node1(pg[3].width/2+50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2+53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2+60, 420,100,0));
      atasan1.add(new Node1(pg[3].width/2-60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2-50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      atasan1.add(new Node1(pg[3].width/2-45, 300,0,50));
      atasan1.add(new Node1(pg[3].width/2-45, 285,50,50));
      atasan1.add(new Node1(pg[3].width/2-55, 240,50,50));
      
     //(Pola Depan)
//#Kiri
      polaAtasan1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 23   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 24.5 *2.5, 50+ 5    *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 27.5 *2.5, 50+ 9    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 9    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 76.5 *2.5)); //B
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 76.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 6.5  *2.5, 50+ 66   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 48   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 30   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 28   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 26   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 50+ 21   *2.5)); //I

//#Kanan
      polaAtasan2.add(new Node(pg[2].width/20- 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20- 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20- 24.5 *2.5 +200, 50+ 5    *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 50+ 9    *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20- 35   *2.5 +200, 50+ 9    *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20- 35   *2.5 +200, 50+ 76.5 *2.5)); //B
      polaAtasan2.add(new Node(pg[2].width/20- 5.5  *2.5 +200, 50+ 76.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20- 6.5  *2.5 +200, 50+ 66   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20- 7.5  *2.5 +200, 50+ 48   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20- 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20- 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20- 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20- 12.5 *2.5 +200, 50+ 21   *2.5)); //I
      
      //(Pola Belakang)
      polaAtasan3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan3.add(new Node(pg[2].width/20+ 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan3.add(new Node(pg[2].width/20+ 24.5 *2.5 +200, 50+ 2    *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20+ 27.5 *2.5 +200, 50+ 4    *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20+ 32.5 *2.5 +200, 50+ 4    *2.5)); //3
      polaAtasan3.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 50+ 2    *2.5)); //4
      polaAtasan3.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 21   *2.5)); //I
      polaAtasan3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 26   *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 28   *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20+ 54.5 *2.5 +200, 50+ 30   *2.5)); //E
      polaAtasan3.add(new Node(pg[2].width/20+ 52.5 *2.5 +200, 50+ 48   *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 53.5 *2.5 +200, 50+ 66   *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 54.5 *2.5 +200, 50+ 76.5 *2.5)); //N
      polaAtasan3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 76.5 *2.5)); //N
      polaAtasan3.add(new Node(pg[2].width/20+ 6.5  *2.5 +200, 50+ 66   *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 48   *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaAtasan3.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 50+ 21   *2.5)); //I
    }
    if (templateAtasan==3 && size==3) {//POLA BUKAAN BELAKANG UKURAN L
       atasan1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasan1.add(new Node1(pg[3].width/2-20, 230,100,0));
      atasan1.add(new Node1(pg[3].width/2, 240,50,50));
      atasan1.add(new Node1(pg[3].width/2+20, 230,100,100));
      atasan1.add(new Node1(pg[3].width/2+25, 220,0,100)); // leher
      atasan1.add(new Node1(pg[3].width/2+55, 240,0,0)); //ketiak
      atasan1.add(new Node1(pg[3].width/2+45, 285,100,0));
      atasan1.add(new Node1(pg[3].width/2+45, 300,100,100));
      atasan1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
      atasan1.add(new Node1(pg[3].width/2+50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2+53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2+60, 420,100,0));
      atasan1.add(new Node1(pg[3].width/2-60, 420,100,100));
      atasan1.add(new Node1(pg[3].width/2-53, 380,100,0));
      atasan1.add(new Node1(pg[3].width/2-50, 350,100,0));
      atasan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      atasan1.add(new Node1(pg[3].width/2-45, 300,0,50));
      atasan1.add(new Node1(pg[3].width/2-45, 285,50,50));
      atasan1.add(new Node1(pg[3].width/2-55, 240,50,50));
      
     //(Pola Depan)
      polaAtasan1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 23   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 24.5 *2.5, 50+ 5    *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 27.5 *2.5, 50+ 9    *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 32.5 *2.5, 50+ 9    *2.5)); //3
      polaAtasan1.add(new Node(pg[2].width/20+ 35.5 *2.5, 50+ 5    *2.5)); //4
      polaAtasan1.add(new Node(pg[2].width/20+ 37   *2.5, 50+ 0    *2.5)); //F
      polaAtasan1.add(new Node(pg[2].width/20+ 50   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasan1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 21   *2.5)); //I
      polaAtasan1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 26   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 28   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 54.5 *2.5, 50+ 30   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 52.5 *2.5, 50+ 48   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 53.5 *2.5, 50+ 66   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 54.5 *2.5, 50+ 76.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 76.5 *2.5)); //N
      polaAtasan1.add(new Node(pg[2].width/20+ 6.5  *2.5, 50+ 66   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 48   *2.5)); //
      polaAtasan1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 30   *2.5)); //E
      polaAtasan1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 28   *2.5)); //2
      polaAtasan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 26   *2.5)); //1
      polaAtasan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 50+ 21   *2.5)); //I

      //(Pola Belakang)
      //#Kiri
      polaAtasan2.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaAtasan2.add(new Node(pg[2].width/20+ 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaAtasan2.add(new Node(pg[2].width/20+ 24.5 *2.5 +200, 50+ 2    *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 27.5 *2.5 +200, 50+ 4    *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 4    *2.5)); 
      polaAtasan2.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 76.5 *2.5)); //B
      polaAtasan2.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 76.5 *2.5)); //N
      polaAtasan2.add(new Node(pg[2].width/20+ 6.5  *2.5 +200, 50+ 66   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 48   *2.5)); //
      polaAtasan2.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaAtasan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaAtasan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaAtasan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 50+ 21   *2.5)); //I

      //#Kanan
      polaAtasan3.add(new Node(pg[2].width/20- 10   *2.5 +400, 50+ 3.5  *2.5)); //J
      polaAtasan3.add(new Node(pg[2].width/20- 23   *2.5 +400, 50+ 0    *2.5)); //F
      polaAtasan3.add(new Node(pg[2].width/20- 24.5 *2.5 +400, 50+ 2    *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20- 27.5 *2.5 +400, 50+ 4    *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20- 35   *2.5 +400, 50+ 4    *2.5)); 
      polaAtasan3.add(new Node(pg[2].width/20- 35   *2.5 +400, 50+ 76.5 *2.5)); //B
      polaAtasan3.add(new Node(pg[2].width/20- 5.5  *2.5 +400, 50+ 76.5 *2.5)); //N
      polaAtasan3.add(new Node(pg[2].width/20- 6.5  *2.5 +400, 50+ 66   *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20- 7.5  *2.5 +400, 50+ 48   *2.5)); //
      polaAtasan3.add(new Node(pg[2].width/20- 5.5  *2.5 +400, 50+ 30   *2.5)); //E
      polaAtasan3.add(new Node(pg[2].width/20- 6    *2.5 +400, 50+ 28   *2.5)); //2
      polaAtasan3.add(new Node(pg[2].width/20- 9.5  *2.5 +400, 50+ 26   *2.5)); //1
      polaAtasan3.add(new Node(pg[2].width/20- 12.5 *2.5 +400, 50+ 21   *2.5)); //I
    }
    newProject = false; 
    base();
    base1();
  }
}

public void selectRok() {
  if (templateRok>0) {
    if (!newProject) {
      for (int i = rok1.size()-1; i >= 0; i--)
        rok1.remove(rok1.get(i));
      for (int i = rok2.size()-1; i >= 0; i--)
        rok2.remove(rok2.get(i));
      for (int i = rok3.size()-1; i >= 0; i--)
        rok3.remove(rok3.get(i));
      for (int i = garisRok.size()-1; i >= 0; i--)
        garisRok.remove(garisRok.get(i));
      for (int i = garisRok2.size()-1; i >= 0; i--)
        garisRok2.remove(garisRok2.get(i));  
      for (int i = polaRok1.size()-1; i >= 0; i--)
        polaRok1.remove(polaRok1.get(i));
      for (int i = polaRok2.size()-1; i >= 0; i--)
        polaRok2.remove(polaRok2.get(i));
      for (int i = polaRok3.size()-1; i >= 0; i--)
        polaRok3.remove(polaRok3.get(i));
      for (int i = polaRok4.size()-1; i >= 0; i--)
        polaRok4.remove(polaRok4.get(i));
      for (int i = polaRok5.size()-1; i >= 0; i--)
        polaRok5.remove(polaRok5.get(i));
    }

    newProject = true;
    if (templateRok==1 && size==1) { //POLA ROK PENDEK S
      rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,100));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,0,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,150,0));
      rok2.add(new Node1(pg[3].width/2+50, 400,150,150));
      rok2.add(new Node1(pg[3].width/2+70, 550,0,150));
      rok2.add(new Node1(pg[3].width/2-70, 550,50,50));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,50));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-20, 450));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+20, 450));

    //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 16   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 33.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 35   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 36.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 46   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 48.5 *2.5, 480+ 17   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 51.5 *2.5, 480+ 53.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 56.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 0.5  *2.5, 480+ 53.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2.5  *2.5, 480+ 17   *2.5)); //F

      //POLA BELAKANG
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 33.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 35   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 36.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 46   *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 48.5 *2.5 +200, 480+ 17   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 51.5 *2.5 +200, 480+ 53.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 56.5 *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 0.5  *2.5 +200, 480+ 53.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F

      //POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 66   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 66   *2.5)); //D
    }
    if (templateRok==2 && size==1) { // POLA ROK PANJANG  S
      rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,100));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,0));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,100,0));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,100));
      rok2.add(new Node1(pg[3].width/2+70, 690,0,100));
      rok2.add(new Node1(pg[3].width/2-70, 690,100,0));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,0));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-20, 450));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+20, 450));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 16   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 33.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 35   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 36.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 46   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 48.5 *2.5, 480+ 17   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 51.5 *2.5, 480+ 88.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 91.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 0.5  *2.5, 480+ 88.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2.5  *2.5, 480+ 17   *2.5)); //F

      //POLA BELAKANG
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 33.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 35   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 36.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 46   *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 48.5 *2.5 +200, 480+ 17   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 51.5 *2.5 +200, 480+ 88.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 91.5 *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 0.5  *2.5 +200, 480+ 88.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F
      
      //POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 66   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 66   *2.5)); //D
      
    }
    if(templateRok==3 && size==1){//Pola Rok bukaan belakang pendek s
      rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,0));
      rok2.add(new Node1(pg[3].width/2+70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,0));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 16   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 33.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 35   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 36.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 46   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 48.5 *2.5, 480+ 17   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 51.5 *2.5, 480+ 53.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 56.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 0.5  *2.5, 480+ 53.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2.5  *2.5, 480+ 17   *2.5)); //F

//POLA BELAKANG
//KIRI
      polaRok3.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok3.add(new Node(pg[2].width/25+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok3.add(new Node(pg[2].width/25+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok3.add(new Node(pg[2].width/25+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok3.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 46.5 *2.5)); //1
      polaRok3.add(new Node(pg[2].width/25+ 30.5 *2.5 +200, 480+ 46.5 *2.5)); //2
      polaRok3.add(new Node(pg[2].width/25+ 30.5 *2.5 +200, 480+ 56.5 *2.5)); //3
      polaRok3.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 56.5 *2.5)); //D
      polaRok3.add(new Node(pg[2].width/25- 0.5  *2.5 +200, 480+ 53.5 *2.5)); //H
      polaRok3.add(new Node(pg[2].width/25+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F

//KANAN
      polaRok4.add(new Node(pg[2].width/25- 5    *2.5 +380, 480+ 0    *2.5)); //E
      polaRok4.add(new Node(pg[2].width/25- 14.5 *2.5 +380, 480+ 0.9  *2.5)); //M
      polaRok4.add(new Node(pg[2].width/25- 16   *2.5 +380, 480+ 13   *2.5)); //K
      polaRok4.add(new Node(pg[2].width/25- 17.5 *2.5 +380, 480+ 1.1  *2.5)); //L
      polaRok4.add(new Node(pg[2].width/25- 25.5 *2.5 +380, 480+ 1.5  *2.5)); //B
      polaRok4.add(new Node(pg[2].width/25- 25.5 *2.5 +380, 480+ 46.5 *2.5)); //1
      polaRok4.add(new Node(pg[2].width/25- 30.5 *2.5 +380, 480+ 46.5 *2.5)); //2
      polaRok4.add(new Node(pg[2].width/25- 30.5 *2.5 +380, 480+ 56.5 *2.5)); //3
      polaRok4.add(new Node(pg[2].width/25- 25.5 *2.5 +380, 480+ 56.5 *2.5)); //D
      polaRok4.add(new Node(pg[2].width/25+ 0.5  *2.5 +380, 480+ 53.5 *2.5)); //H
      polaRok4.add(new Node(pg[2].width/25- 2.5  *2.5 +380, 480+ 17   *2.5)); //F
       
//POLA BAN
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 66   *2.5)); //C
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 66   *2.5)); //D   
    }
    if(templateRok==4 && size==1){//Pola Rok bukaan belakang panjang s
     rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,100));
      rok2.add(new Node1(pg[3].width/2+70, 690,100,0));
      rok2.add(new Node1(pg[3].width/2-70, 690,50,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,100));
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 16   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 33.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 35   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 36.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 46   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 48.5 *2.5, 480+ 17   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 51.5 *2.5, 480+ 88.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 91.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 0.5  *2.5, 480+ 88.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2.5  *2.5, 480+ 17   *2.5)); //F

//POLA BELAKANG
//KIRI
      polaRok3.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok3.add(new Node(pg[2].width/25+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok3.add(new Node(pg[2].width/25+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok3.add(new Node(pg[2].width/25+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok3.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 71.5 *2.5)); //1
      polaRok3.add(new Node(pg[2].width/25+ 30.5 *2.5 +200, 480+ 71.5 *2.5)); //2
      polaRok3.add(new Node(pg[2].width/25+ 30.5 *2.5 +200, 480+ 91.5 *2.5)); //3
      polaRok3.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 91.5 *2.5)); //D
      polaRok3.add(new Node(pg[2].width/25- 0.5  *2.5 +200, 480+ 88.5 *2.5)); //H
      polaRok3.add(new Node(pg[2].width/25+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F
      
//KANAN
      polaRok4.add(new Node(pg[2].width/25- 5    *2.5 +380, 480+ 0    *2.5)); //E
      polaRok4.add(new Node(pg[2].width/25- 14.5 *2.5 +380, 480+ 0.9  *2.5)); //M
      polaRok4.add(new Node(pg[2].width/25- 16   *2.5 +380, 480+ 13   *2.5)); //K
      polaRok4.add(new Node(pg[2].width/25- 17.5 *2.5 +380, 480+ 1.1  *2.5)); //L
      polaRok4.add(new Node(pg[2].width/25- 25.5 *2.5 +380, 480+ 1.5  *2.5)); //B
      polaRok4.add(new Node(pg[2].width/25- 25.5 *2.5 +380, 480+ 71.5 *2.5)); //1
      polaRok4.add(new Node(pg[2].width/25- 30.5 *2.5 +380, 480+ 71.5 *2.5)); //2
      polaRok4.add(new Node(pg[2].width/25- 30.5 *2.5 +380, 480+ 91.5 *2.5)); //3
      polaRok4.add(new Node(pg[2].width/25- 25.5 *2.5 +380, 480+ 91.5 *2.5)); //D
      polaRok4.add(new Node(pg[2].width/25+ 0.5  *2.5 +380, 480+ 88.5 *2.5)); //H
      polaRok4.add(new Node(pg[2].width/25- 2.5  *2.5 +380, 480+ 17   *2.5)); //F
      
//POLA BAN
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 66   *2.5)); //C
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 66   *2.5)); //D 
    }
    if (templateRok==5 && size==1) { // Pola Rok Lipit Hadap I pendek s
      rok1.add(new Node1(pg[3].width/2-40, 360,0,0));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,100));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+50, 400,0,100));
      rok2.add(new Node1(pg[3].width/2+70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2+5, 550,100,0));
      rok2.add(new Node1(pg[3].width/2, 540,0,0));
      rok2.add(new Node1(pg[3].width/2-5, 550,100,0));
      rok2.add(new Node1(pg[3].width/2-70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,100));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-25, 390));
      garisRok.add(new Node(pg[3].width/2, 370));
      garisRok.add(new Node(pg[3].width/2, 540));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+25, 390));
      
       polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 16   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 30.5 *2.5, 480- 0.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 35.5 *2.5, 480+ 1.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 43.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 45   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 46.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 56   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 58.5 *2.5, 480+ 17   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 61.5 *2.5, 480+ 53.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 56.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 0.5  *2.5, 480+ 53.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2.5  *2.5, 480+ 17   *2.5)); //F
      
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 30.5 *2.5 +200, 480- 0.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 35.5 *2.5 +200, 480+ 1.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 43.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 45   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 46.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 56   *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 58.5 *2.5 +200, 480+ 17   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 61.5 *2.5 +200, 480+ 53.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 56.5 *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 0.5  *2.5 +200, 480+ 53.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F

//Pola Ban
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 66   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 66   *2.5)); //D

    
    }
    if(templateRok==6 && size==1){//Rok Lipit hadap 1 panjang s
    rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,0));
      rok2.add(new Node1(pg[3].width/2+70, 690,100,100));
      rok2.add(new Node1(pg[3].width/2+5, 690,0,100));
      rok2.add(new Node1(pg[3].width/2, 680,0,0));
      rok2.add(new Node1(pg[3].width/2-5, 690,0,100));
      rok2.add(new Node1(pg[3].width/2-70, 690,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,100,0));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-25, 390));
      garisRok.add(new Node(pg[3].width/2, 370));
      garisRok.add(new Node(pg[3].width/2, 680));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+25, 390));
      
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 16   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 30.5 *2.5, 480- 0.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 35.5 *2.5, 480+ 1.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 43.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 45   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 46.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 56   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 58.5 *2.5, 480+ 17   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 61.5 *2.5, 480+ 88.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 25.5 *2.5, 480+ 91.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 0.5  *2.5, 480+ 88.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2.5  *2.5, 480+ 17   *2.5)); //F 
      
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 30.5 *2.5 +200, 480- 0.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 35.5 *2.5 +200, 480+ 1.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 43.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 45   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 46.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 56   *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 58.5 *2.5 +200, 480+ 17   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 61.5 *2.5 +200, 480+ 88.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 25.5 *2.5 +200, 480+ 91.5 *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 0.5  *2.5 +200, 480+ 88.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F
      
//Pola Ban
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 66   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 66   *2.5)); //D
    }
    if (templateRok==1 && size==2) { //Rok standar pendek M
    rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,0));
      rok2.add(new Node1(pg[3].width/2+70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,0));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-20, 450));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+20, 450));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 17   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 35.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 37   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 38.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 49   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 18   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 55   *2.5, 480+ 63.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 66.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 1    *2.5, 480+ 63.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2    *2.5, 480+ 17   *2.5)); //F

//POLA BELAKANG
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 35.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 37   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 38.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 49   *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 52   *2.5 +200, 480+ 18   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 55   *2.5 +200, 480+ 63.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 66.5 *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 1    *2.5 +200, 480+ 63.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 2    *2.5 +200, 480+ 17   *2.5)); //F   
      
//POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 72   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 72   *2.5)); //D
    }
    if (templateRok==2 && size==2) { //Rok standar panjang m
      rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,100));
      rok2.add(new Node1(pg[3].width/2+70, 690,100,100));
      rok2.add(new Node1(pg[3].width/2-70, 690,100,0));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,0));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-20, 450));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+20, 450));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 17   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 35.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 37   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 38.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 49   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 18   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 55   *2.5, 480+ 94.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 96   *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 1    *2.5, 480+ 94.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2    *2.5, 480+ 17   *2.5)); //F 

//POLA BELAKANG
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 35.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 37   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 38.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 49   *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 52   *2.5 +200, 480+ 18   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 55   *2.5 +200, 480+ 94.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 96   *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 1    *2.5 +200, 480+ 94.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 2    *2.5 +200, 480+ 17   *2.5)); //F
       
//POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 72   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 72   *2.5)); //D
    }
    if (templateRok==3 && size==2) { //Rok bukaan belakang pendek M
      rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,0));
      rok2.add(new Node1(pg[3].width/2+70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,0));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 17   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 35.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 37   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 38.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 49   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 18   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 55   *2.5, 480+ 63.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 66.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 1    *2.5, 480+ 63.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2    *2.5, 480+ 17   *2.5)); //F

//POLA BELAKANG
//KIRI
      polaRok3.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok3.add(new Node(pg[2].width/25+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok3.add(new Node(pg[2].width/25+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok3.add(new Node(pg[2].width/25+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok3.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 56.5 *2.5)); //1
      polaRok3.add(new Node(pg[2].width/25+ 32   *2.5 +200, 480+ 56.5 *2.5)); //2
      polaRok3.add(new Node(pg[2].width/25+ 32   *2.5 +200, 480+ 66.5 *2.5)); //3
      polaRok3.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 66.5 *2.5)); //D
      polaRok3.add(new Node(pg[2].width/25- 1    *2.5 +200, 480+ 63.5 *2.5)); //H
      polaRok3.add(new Node(pg[2].width/25+ 2    *2.5 +200, 480+ 17   *2.5)); //F

//KANAN      
      polaRok4.add(new Node(pg[2].width/25- 5    *2.5 +380, 480+ 0    *2.5)); //E
      polaRok4.add(new Node(pg[2].width/25- 15.5 *2.5 +380, 480+ 0.9  *2.5)); //M
      polaRok4.add(new Node(pg[2].width/25- 17   *2.5 +380, 480+ 13   *2.5)); //K
      polaRok4.add(new Node(pg[2].width/25- 18.5 *2.5 +380, 480+ 1.1  *2.5)); //L
      polaRok4.add(new Node(pg[2].width/25- 27   *2.5 +380, 480+ 1.5  *2.5)); //B
      polaRok4.add(new Node(pg[2].width/25- 27   *2.5 +380, 480+ 56.5 *2.5)); //1
      polaRok4.add(new Node(pg[2].width/25- 32   *2.5 +380, 480+ 56.5 *2.5)); //2
      polaRok4.add(new Node(pg[2].width/25- 32   *2.5 +380, 480+ 66.5 *2.5)); //3
      polaRok4.add(new Node(pg[2].width/25- 27   *2.5 +380, 480+ 66.5 *2.5)); //D
      polaRok4.add(new Node(pg[2].width/25+ 1    *2.5 +380, 480+ 63.5 *2.5)); //H
      polaRok4.add(new Node(pg[2].width/25- 2    *2.5 +380, 480+ 17   *2.5)); //F 
   
//POLA BAN
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 72   *2.5)); //C
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 72   *2.5)); //D 
    }
    if (templateRok==4 && size==2) { //Rok bukaan belakang panjang M
    rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,100));
      rok2.add(new Node1(pg[3].width/2+70, 690,100,0));
      rok2.add(new Node1(pg[3].width/2-70, 690,50,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,100));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 17   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 35.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 37   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 38.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 49   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 18   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 55   *2.5, 480+ 94.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 96   *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 1    *2.5, 480+ 94.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2    *2.5, 480+ 17   *2.5)); //F 

//POLA BELAKANG
//KANAN
      polaRok3.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok3.add(new Node(pg[2].width/25+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok3.add(new Node(pg[2].width/25+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok3.add(new Node(pg[2].width/25+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok3.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 76   *2.5)); //1
      polaRok3.add(new Node(pg[2].width/25+ 32   *2.5 +200, 480+ 76   *2.5)); //2
      polaRok3.add(new Node(pg[2].width/25+ 32   *2.5 +200, 480+ 96   *2.5)); //3
      polaRok3.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 96   *2.5)); //D
      polaRok3.add(new Node(pg[2].width/25- 1    *2.5 +200, 480+ 94.5 *2.5)); //H
      polaRok3.add(new Node(pg[2].width/25+ 2    *2.5 +200, 480+ 17   *2.5)); //F

//KIRI
      polaRok4.add(new Node(pg[2].width/25- 5    *2.5 +380, 480+ 0    *2.5)); //E
      polaRok4.add(new Node(pg[2].width/25- 15.5 *2.5 +380, 480+ 0.9  *2.5)); //M
      polaRok4.add(new Node(pg[2].width/25- 17   *2.5 +380, 480+ 13   *2.5)); //K
      polaRok4.add(new Node(pg[2].width/25- 18.5 *2.5 +380, 480+ 1.1  *2.5)); //L
      polaRok4.add(new Node(pg[2].width/25- 27   *2.5 +380, 480+ 1.5  *2.5)); //B
      polaRok4.add(new Node(pg[2].width/25- 27   *2.5 +380, 480+ 76   *2.5)); //1
      polaRok4.add(new Node(pg[2].width/25- 32   *2.5 +380, 480+ 76   *2.5)); //2
      polaRok4.add(new Node(pg[2].width/25- 32   *2.5 +380, 480+ 96   *2.5)); //3
      polaRok4.add(new Node(pg[2].width/25- 27   *2.5 +380, 480+ 96   *2.5)); //D
      polaRok4.add(new Node(pg[2].width/25+ 1    *2.5 +380, 480+ 94.5 *2.5)); //H
      polaRok4.add(new Node(pg[2].width/25- 2    *2.5 +380, 480+ 17   *2.5)); //F
 
//POLA BAN
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 72   *2.5)); //C
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 72   *2.5)); //D
    }
    if (templateRok==5 && size==2) { //Rok Lipit hadap 1 pendek M
     rok1.add(new Node1(pg[3].width/2-40, 360,0,0));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,100));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+50, 400,0,100));
      rok2.add(new Node1(pg[3].width/2+70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2+5, 550,100,0));
      rok2.add(new Node1(pg[3].width/2, 540,0,0));
      rok2.add(new Node1(pg[3].width/2-5, 550,100,0));
      rok2.add(new Node1(pg[3].width/2-70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,100));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-25, 390));
      garisRok.add(new Node(pg[3].width/2, 370));
      garisRok.add(new Node(pg[3].width/2, 540));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+25, 390));
      
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 17   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 32   *2.5, 480- 0.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 37   *2.5, 480+ 1.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 45.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 47   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 48.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 59   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 62   *2.5, 480+ 18   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 65   *2.5, 480+ 63.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 66.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 1    *2.5, 480+ 63.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2    *2.5, 480+ 17   *2.5)); //F
      
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 32   *2.5 +200, 480- 0.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 37   *2.5 +200, 480+ 1.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 45.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 47   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 48.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 59   *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 62   *2.5 +200, 480+ 18   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 65   *2.5 +200, 480+ 63.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 66.5 *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 1    *2.5 +200, 480+ 63.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 2    *2.5 +200, 480+ 17   *2.5)); //F
      
//POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 72   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 72   *2.5)); //D
    }
    if (templateRok==6 && size==2) { //Rok Lipit hadap 1 panjang M
    rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,0));
      rok2.add(new Node1(pg[3].width/2+70, 690,100,100));
      rok2.add(new Node1(pg[3].width/2+5, 690,0,100));
      rok2.add(new Node1(pg[3].width/2, 680,0,0));
      rok2.add(new Node1(pg[3].width/2-5, 690,0,100));
      rok2.add(new Node1(pg[3].width/2-70, 690,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,100,0));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-25, 390));
      garisRok.add(new Node(pg[3].width/2, 370));
      garisRok.add(new Node(pg[3].width/2, 680));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+25, 390));
      
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 17   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 32   *2.5, 480- 0.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 37   *2.5, 480+ 1.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 45.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 47   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 48.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 59   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 62   *2.5, 480+ 18   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 65   *2.5, 480+ 94.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 96.5 *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 1    *2.5, 480+ 94.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 2    *2.5, 480+ 17   *2.5)); //F
      
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 32   *2.5 +200, 480- 0.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 37   *2.5 +200, 480+ 1.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 45.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 47   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 48.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 59   *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 62   *2.5 +200, 480+ 18   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 65   *2.5 +200, 480+ 94.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 96.5 *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 1    *2.5 +200, 480+ 94.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 2    *2.5 +200, 480+ 17   *2.5)); //F
      
//POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 72   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 72   *2.5)); //D
    }
    if (templateRok==1 && size==3) { //Rok standar pendek L
   rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,0));
      rok2.add(new Node1(pg[3].width/2+70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,0));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-20, 450));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+20, 450));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 16.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 18   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 19.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 28.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 37.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 39   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 40.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 56.5 *2.5, 480+ 20   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 59.5 *2.5, 480+ 68.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 70   *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 2.5  *2.5, 480+ 68.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 0.5  *2.5, 480+ 20   *2.5)); //F

//POLA BELAKANG
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 16.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 18   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 19.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 37.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 39   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 40.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 52   *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 56.5 *2.5 +200, 480+ 20   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 59.5 *2.5 +200, 480+ 68.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 70   *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 480+ 68.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 0.5  *2.5 +200, 480+ 20   *2.5)); //F     
      

//POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 78   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 78   *2.5)); //D
    }
     if (templateRok==2 && size==3) { //Rok standar panjang l
      rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,100));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,0));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,100,0));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,100));
      rok2.add(new Node1(pg[3].width/2+70, 690,0,100));
      rok2.add(new Node1(pg[3].width/2-70, 690,100,0));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,0));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-20, 450));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+20, 450));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0     *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 16.5 *2.5, 480+ 0.9   *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 18   *2.5, 480+ 13    *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 19.5 *2.5, 480+ 1.1   *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 28.5 *2.5, 480+ 1.5   *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 37.5 *2.5, 480+ 1.1   *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 39   *2.5, 480+ 13    *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 40.5 *2.5, 480+ 0.9   *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 0     *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 56.5 *2.5, 480+ 20    *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 59.5 *2.5, 480+ 100.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 102   *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 2.5  *2.5, 480+ 100.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 0.5  *2.5, 480+ 20    *2.5)); //F

//POLA BELAKANG
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0     *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 16.5 *2.5 +200, 480+ 0.9   *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 18   *2.5 +200, 480+ 13    *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 19.5 *2.5 +200, 480+ 1.1   *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 1.5   *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 37.5 *2.5 +200, 480+ 1.1   *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 39   *2.5 +200, 480+ 13    *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 40.5 *2.5 +200, 480+ 0.9   *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 52   *2.5 +200, 480+ 0     *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 56.5 *2.5 +200, 480+ 20    *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 59.5 *2.5 +200, 480+ 100.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 102   *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 480+ 100.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 0.5  *2.5 +200, 480+ 20    *2.5)); //F   
      
//POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 78   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 78   *2.5)); //D
    }
    if (templateRok==3 && size==3) { //Rok bukaan belakang pendek l
     rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,150));
      rok2.add(new Node1(pg[3].width/2+50, 400,150,150));
      rok2.add(new Node1(pg[3].width/2+70, 550,150,100));
      rok2.add(new Node1(pg[3].width/2-70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 16.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 18   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 19.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 28.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 37.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 39   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 40.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 56.5 *2.5, 480+ 20   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 59.5 *2.5, 480+ 68.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 28.5 *2.5, 480+ 70   *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 2.5  *2.5, 480+ 68.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 0.5  *2.5, 480+ 20   *2.5)); //F

//POLA BELAKANG
//KIRI
      polaRok3.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok3.add(new Node(pg[2].width/25+ 16.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok3.add(new Node(pg[2].width/25+ 18   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok3.add(new Node(pg[2].width/25+ 19.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok3.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 60   *2.5)); //1
      polaRok3.add(new Node(pg[2].width/25+ 33.5 *2.5 +200, 480+ 60   *2.5)); //2
      polaRok3.add(new Node(pg[2].width/25+ 33.5 *2.5 +200, 480+ 70   *2.5)); //3
      polaRok3.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 70   *2.5)); //D
      polaRok3.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 480+ 68.5 *2.5)); //H
      polaRok3.add(new Node(pg[2].width/25+ 0.5  *2.5 +200, 480+ 20   *2.5)); //F

//KANAN     
      polaRok4.add(new Node(pg[2].width/25- 5    *2.5 +380, 480+ 0    *2.5)); //E
      polaRok4.add(new Node(pg[2].width/25- 16.5 *2.5 +380, 480+ 0.9  *2.5)); //M
      polaRok4.add(new Node(pg[2].width/25- 18   *2.5 +380, 480+ 13   *2.5)); //K
      polaRok4.add(new Node(pg[2].width/25- 19.5 *2.5 +380, 480+ 1.1  *2.5)); //L
      polaRok4.add(new Node(pg[2].width/25- 28.5 *2.5 +380, 480+ 1.5  *2.5)); //B
      polaRok4.add(new Node(pg[2].width/25- 28.5 *2.5 +380, 480+ 60   *2.5)); //1
      polaRok4.add(new Node(pg[2].width/25- 33.5 *2.5 +380, 480+ 60   *2.5)); //2
      polaRok4.add(new Node(pg[2].width/25- 33.5 *2.5 +380, 480+ 70   *2.5)); //3
      polaRok4.add(new Node(pg[2].width/25- 28.5 *2.5 +380, 480+ 70   *2.5)); //D
      polaRok4.add(new Node(pg[2].width/25+ 2.5  *2.5 +380, 480+ 68.5 *2.5)); //H
      polaRok4.add(new Node(pg[2].width/25- 0.5  *2.5 +380, 480+ 20   *2.5)); //F     
      
//POLA BAN
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 78   *2.5)); //C
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 78   *2.5)); //D 
    }
    if (templateRok==4 && size==3) { //Rok bukaan belakang panjang l
    rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,100));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,100));
      rok2.add(new Node1(pg[3].width/2+70, 690,100,0));
      rok2.add(new Node1(pg[3].width/2-70, 690,50,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,100));
      
      //POLA DEPAN
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0     *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 16.5 *2.5, 480+ 0.9   *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 18   *2.5, 480+ 13    *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 19.5 *2.5, 480+ 1.1   *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 28.5 *2.5, 480+ 1.5   *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 37.5 *2.5, 480+ 1.1   *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 39   *2.5, 480+ 13    *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 40.5 *2.5, 480+ 0.9   *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 0     *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 56.5 *2.5, 480+ 20    *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 59.5 *2.5, 480+ 100.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 102   *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 2.5  *2.5, 480+ 100.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 0.5  *2.5, 480+ 20    *2.5)); //F

//POLA BELAKANG
//KIRI
      polaRok3.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0     *2.5)); //E
      polaRok3.add(new Node(pg[2].width/25+ 16.5 *2.5 +200, 480+ 0.9   *2.5)); //M
      polaRok3.add(new Node(pg[2].width/25+ 18   *2.5 +200, 480+ 13    *2.5)); //K
      polaRok3.add(new Node(pg[2].width/25+ 19.5 *2.5 +200, 480+ 1.1   *2.5)); //L
      polaRok3.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 1.5   *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 82    *2.5)); //1
      polaRok3.add(new Node(pg[2].width/25+ 33.5 *2.5 +200, 480+ 82    *2.5)); //2
      polaRok3.add(new Node(pg[2].width/25+ 33.5 *2.5 +200, 480+ 102   *2.5)); //3
      polaRok3.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 102   *2.5)); //D
      polaRok3.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 480+ 100.5 *2.5)); //H
      polaRok3.add(new Node(pg[2].width/25+ 0.5  *2.5 +200, 480+ 20    *2.5)); //F
      
//KANAN
      polaRok4.add(new Node(pg[2].width/25- 5    *2.5 +380, 480+ 0     *2.5)); //E
      polaRok4.add(new Node(pg[2].width/25- 16.5 *2.5 +380, 480+ 0.9   *2.5)); //M
      polaRok4.add(new Node(pg[2].width/25- 18   *2.5 +380, 480+ 13    *2.5)); //K
      polaRok4.add(new Node(pg[2].width/25- 19.5 *2.5 +380, 480+ 1.1   *2.5)); //L
      polaRok4.add(new Node(pg[2].width/25- 28.5 *2.5 +380, 480+ 1.5   *2.5)); //B
      polaRok4.add(new Node(pg[2].width/25- 28.5 *2.5 +380, 480+ 82    *2.5)); //1
      polaRok4.add(new Node(pg[2].width/25- 33.5 *2.5 +380, 480+ 82    *2.5)); //2
      polaRok4.add(new Node(pg[2].width/25- 33.5 *2.5 +380, 480+ 102   *2.5)); //3
      polaRok4.add(new Node(pg[2].width/25- 27   *2.5 +380, 480+ 102   *2.5)); //D
      polaRok4.add(new Node(pg[2].width/25+ 2.5  *2.5 +380, 480+ 100.5 *2.5)); //H
      polaRok4.add(new Node(pg[2].width/25- 0.5  *2.5 +380, 480+ 20    *2.5)); //F   
       
//POLA BAN
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 78   *2.5)); //C
      polaRok2.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 78   *2.5)); //D
    }
    if (templateRok==5 && size==3) { //Rok Lipit hadap 1 pendek l
     rok1.add(new Node1(pg[3].width/2-40, 360,0,0));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,100));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+50, 400,0,100));
      rok2.add(new Node1(pg[3].width/2+70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2+5, 550,100,0));
      rok2.add(new Node1(pg[3].width/2, 540,0,0));
      rok2.add(new Node1(pg[3].width/2-5, 550,100,0));
      rok2.add(new Node1(pg[3].width/2-70, 550,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,0,100));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-25, 390));
      garisRok.add(new Node(pg[3].width/2, 370));
      garisRok.add(new Node(pg[3].width/2, 540));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+25, 390));
      
       polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 16.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 18   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 19.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 28.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 33.5 *2.5, 480- 0.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 38.5 *2.5, 480+ 1.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 47.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 49   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 50.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 60.5 *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 64.5 *2.5, 480+ 20   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 67.5 *2.5, 480+ 68.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 70   *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 2.5  *2.5, 480+ 68.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 0.5  *2.5, 480+ 20   *2.5)); //F
      
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 16.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 18   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 19.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 33.5 *2.5 +200, 480- 0.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 38.5 *2.5 +200, 480+ 1.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 47.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 49   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 50.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 60.5 *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 64.5 *2.5 +200, 480+ 20   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 67.5 *2.5 +200, 480+ 68.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 70   *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 480+ 68.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 0.5  *2.5 +200, 480+ 20   *2.5)); //F
      
//POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 78   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 78   *2.5)); //D
    }
    if (templateRok==6 && size==3) { //Rok Lipit hadap 1 panjang l
     rok1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      rok1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      rok1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      rok1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0

      rok2.add(new Node1(pg[3].width/2-40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+40, 370,0,0));
      rok2.add(new Node1(pg[3].width/2+50, 400,100,0));
      rok2.add(new Node1(pg[3].width/2+70, 690,100,100));
      rok2.add(new Node1(pg[3].width/2+5, 690,0,100));
      rok2.add(new Node1(pg[3].width/2, 680,0,0));
      rok2.add(new Node1(pg[3].width/2-5, 690,0,100));
      rok2.add(new Node1(pg[3].width/2-70, 690,100,100));
      rok2.add(new Node1(pg[3].width/2-50, 400,100,0));

      garisRok.add(new Node(pg[3].width/2-20, 370));
      garisRok.add(new Node(pg[3].width/2-25, 390));
      garisRok.add(new Node(pg[3].width/2, 370));
      garisRok.add(new Node(pg[3].width/2, 680));
      garisRok.add(new Node(pg[3].width/2+20, 370));
      garisRok.add(new Node(pg[3].width/2+25, 390));
      
      polaRok1.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 16.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 18   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 19.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 28.5 *2.5, 480+ 1.5  *2.5)); //B
      polaRok1.add(new Node(pg[2].width/25+ 33.5 *2.5, 480- 0.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 38.5 *2.5, 480+ 1.5  *2.5)); //
      polaRok1.add(new Node(pg[2].width/25+ 47.5 *2.5, 480+ 1.1  *2.5)); //L
      polaRok1.add(new Node(pg[2].width/25+ 49   *2.5, 480+ 13   *2.5)); //K
      polaRok1.add(new Node(pg[2].width/25+ 50.5 *2.5, 480+ 0.9  *2.5)); //M
      polaRok1.add(new Node(pg[2].width/25+ 60.5 *2.5, 480+ 0    *2.5)); //E
      polaRok1.add(new Node(pg[2].width/25+ 64.5 *2.5, 480+ 20   *2.5)); //F
      polaRok1.add(new Node(pg[2].width/25+ 67.5 *2.5, 480+ 100.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 102   *2.5)); //D
      polaRok1.add(new Node(pg[2].width/25- 2.5  *2.5, 480+ 100.5 *2.5)); //H
      polaRok1.add(new Node(pg[2].width/25+ 0.5  *2.5, 480+ 20   *2.5)); //F
      
      polaRok2.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 16.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 18   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 19.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaRok2.add(new Node(pg[2].width/25+ 33.5 *2.5 +200, 480- 0.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 38.5 *2.5 +200, 480+ 1.5  *2.5)); //
      polaRok2.add(new Node(pg[2].width/25+ 47.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaRok2.add(new Node(pg[2].width/25+ 49   *2.5 +200, 480+ 13   *2.5)); //K
      polaRok2.add(new Node(pg[2].width/25+ 50.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaRok2.add(new Node(pg[2].width/25+ 60.5 *2.5 +200, 480+ 0    *2.5)); //E
      polaRok2.add(new Node(pg[2].width/25+ 64.5 *2.5 +200, 480+ 20   *2.5)); //F
      polaRok2.add(new Node(pg[2].width/25+ 67.5 *2.5 +200, 480+ 100.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 102   *2.5)); //D
      polaRok2.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 480+ 100.5 *2.5)); //H
      polaRok2.add(new Node(pg[2].width/25+ 0.5  *2.5 +200, 480+ 20   *2.5)); //F
      
//POLA BAN
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 0    *2.5)); //A
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 0    *2.5)); //B
      polaRok3.add(new Node(pg[2].width/25+ 10   *2.5 +400, 480+ 78   *2.5)); //C
      polaRok3.add(new Node(pg[2].width/25+ 0    *2.5 +400, 480+ 78   *2.5)); //D
    }
    newProject = false; 
    base();
    base1();
  }
}

public void selectCelana() {
  if (templateCelana>0) {
    if (!newProject) {
      for (int i = celana1.size()-1; i >= 0; i--)
        celana1.remove(celana1.get(i));
      for (int i = celana2.size()-1; i >= 0; i--)
        celana2.remove(celana2.get(i));
      for (int i = celana3.size()-1; i >= 0; i--)
        celana3.remove(celana3.get(i));  
      for (int i = garisCelana.size()-1; i >= 0; i--)
        garisCelana.remove(garisCelana.get(i));
      for (int i = garisCelana2.size()-1; i >= 0; i--)
        garisCelana2.remove(garisCelana2.get(i));
      for (int i = polaCelana1.size()-1; i >= 0; i--)
        polaCelana1.remove(polaCelana1.get(i));
      for (int i = polaCelana2.size()-1; i >= 0; i--)
        polaCelana2.remove(polaCelana2.get(i));
      for (int i = polaCelana3.size()-1; i >= 0; i--)
        polaCelana3.remove(polaCelana3.get(i));
      for (int i = polaCelana4.size()-1; i >= 0; i--)
        polaCelana4.remove(polaCelana4.get(i));
      for (int i = polaCelana5.size()-1; i >= 0; i--)
        polaCelana5.remove(polaCelana5.get(i));
      for (int i = polaCelana6.size()-1; i >= 0; i--)
        polaCelana6.remove(polaCelana6.get(i));
      for (int i = polaCelana7.size()-1; i >= 0; i--)
        polaCelana7.remove(polaCelana7.get(i));
      for (int i = polaCelana8.size()-1; i >= 0; i--)
        polaCelana8.remove(polaCelana8.get(i));  
    }

    newProject = true;
    if (templateCelana==1 && size==1) { //celana pendek s
      celana1.add(new Node1(pg[3].width/2-40, 360, 0,0));//0,100
      celana1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      celana1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      celana1.add(new Node1(pg[3].width/2-40, 370,0,100));//0,0
      
      celana2.add(new Node1(pg[3].width/2-40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+40, 370,100,0));
      celana2.add(new Node1(pg[3].width/2+50, 400,100,100));
      celana2.add(new Node1(pg[3].width/2+60, 550,0,0));
      celana2.add(new Node1(pg[3].width/2+5, 550,100,0));
      celana2.add(new Node1(pg[3].width/2, 450,50,50));
      celana2.add(new Node1(pg[3].width/2-5, 550,100,100));
      celana2.add(new Node1(pg[3].width/2-60, 550,0,100));
      celana2.add(new Node1(pg[3].width/2-50, 400,0,0));
      
      garisCelana.add(new Node(pg[3].width/2-4,370));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,370));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      
      //POLA DEPAN
      //kiri
      polaCelana1.add(new Node(pg[2].width/20+ 23.5 *2.5, 470+ 6    *2.5)); //K
      polaCelana1.add(new Node(pg[2].width/20+ 23.5 *2.5, 470+ 19   *2.5)); //N
      polaCelana1.add(new Node(pg[2].width/20+ 24.5 *2.5, 470+ 24   *2.5)); //
      polaCelana1.add(new Node(pg[2].width/20+ 27.5 *2.5, 470+ 26   *2.5)); //F
      polaCelana1.add(new Node(pg[2].width/20+ 26   *2.5, 470+ 60   *2.5)); //U
      polaCelana1.add(new Node(pg[2].width/20+ 4    *2.5, 470+ 60   *2.5)); //T
      polaCelana1.add(new Node(pg[2].width/20+ 2    *2.5, 470+ 26   *2.5)); //B
      polaCelana1.add(new Node(pg[2].width/20+ 4    *2.5, 470+ 16   *2.5)); //O
      polaCelana1.add(new Node(pg[2].width/20+ 6.5  *2.5, 470+ 5    *2.5)); //J
      polaCelana1.add(new Node(pg[2].width/20+ 10   *2.5, 470+ 5    *2.5)); //1
      polaCelana1.add(new Node(pg[2].width/20+ 11.5 *2.5, 470+ 16   *2.5)); //2
      polaCelana1.add(new Node(pg[2].width/20+ 13   *2.5, 470+ 5    *2.5)); //3
      polaCelana1.add(new Node(pg[2].width/20+ 15   *2.5, 470+ 5.5  *2.5)); //I
      polaCelana1.add(new Node(pg[2].width/20+ 17   *2.5, 470+ 6    *2.5)); //4
      polaCelana1.add(new Node(pg[2].width/20+ 18.5 *2.5, 470+ 16   *2.5)); //5
      polaCelana1.add(new Node(pg[2].width/20+ 20   *2.5, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana2.add(new Node(pg[2].width/20+ 23.5 *2.5, 470+ 6    *2.5)); //K
      polaCelana2.add(new Node(pg[2].width/20+ 26.5 *2.5, 470+ 6    *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 26.5 *2.5, 470+ 15   *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 25.5 *2.5, 470+ 19   *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 23.5 *2.5, 470+ 20   *2.5)); //N

      //kanan
      polaCelana3.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana3.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 470+ 19   *2.5)); //N
      polaCelana3.add(new Node(pg[2].width/20- 24.5 *2.5 +200, 470+ 24   *2.5)); //
      polaCelana3.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 470+ 26   *2.5)); //F
      polaCelana3.add(new Node(pg[2].width/20- 26   *2.5 +200, 470+ 60   *2.5)); //U
      polaCelana3.add(new Node(pg[2].width/20- 4    *2.5 +200, 470+ 60   *2.5)); //T
      polaCelana3.add(new Node(pg[2].width/20- 2    *2.5 +200, 470+ 26   *2.5)); //B
      polaCelana3.add(new Node(pg[2].width/20- 4    *2.5 +200, 470+ 16   *2.5)); //O
      polaCelana3.add(new Node(pg[2].width/20- 6.5  *2.5 +200, 470+ 5    *2.5)); //J
      polaCelana3.add(new Node(pg[2].width/20- 10   *2.5 +200, 470+ 5    *2.5)); //1
      polaCelana3.add(new Node(pg[2].width/20- 11.5 *2.5 +200, 470+ 16   *2.5)); //2
      polaCelana3.add(new Node(pg[2].width/20- 13   *2.5 +200, 470+ 5    *2.5)); //3
      polaCelana3.add(new Node(pg[2].width/20- 15   *2.5 +200, 470+ 5.5  *2.5)); //I
      polaCelana3.add(new Node(pg[2].width/20- 17   *2.5 +200, 470+ 6    *2.5)); //4
      polaCelana3.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 470+ 16   *2.5)); //5
      polaCelana3.add(new Node(pg[2].width/20- 20   *2.5 +200, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana4.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana4.add(new Node(pg[2].width/20- 26.5 *2.5 +200, 470+ 6    *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 26.5 *2.5 +200, 470+ 15   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 25.5 *2.5 +200, 470+ 19   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 470+ 20   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelana5.add(new Node(pg[2].width/20+ 24.5 *2.5 +210, 470+ 3    *2.5)); //K
      polaCelana5.add(new Node(pg[2].width/20+ 28.5 *2.5 +210, 470+ 23   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 32.5 *2.5 +210, 470+ 26   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 35.5 *2.5 +210, 470+ 26   *2.5)); //F
      polaCelana5.add(new Node(pg[2].width/20+ 30   *2.5 +210, 470+ 60   *2.5)); //U
      polaCelana5.add(new Node(pg[2].width/20+ 4    *2.5 +210, 470+ 60   *2.5)); //T
      polaCelana5.add(new Node(pg[2].width/20+ 2    *2.5 +200, 470+ 26   *2.5)); //B
      polaCelana5.add(new Node(pg[2].width/20+ 2    *2.5 +210, 470+ 5    *2.5)); //J
      polaCelana5.add(new Node(pg[2].width/20+ 13.5 *2.5 +210, 470+ 5    *2.5)); //1
      polaCelana5.add(new Node(pg[2].width/20+ 15   *2.5 +210, 470+ 16   *2.5)); //I
      polaCelana5.add(new Node(pg[2].width/20+ 16.5 *2.5 +210, 470+ 5    *2.5)); //2

      //kanan
      polaCelana6.add(new Node(pg[2].width/20- 24.5 *2.5 +400, 470+ 3    *2.5)); //K
      polaCelana6.add(new Node(pg[2].width/20- 28.5 *2.5 +400, 470+ 23   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 32.5 *2.5 +400, 470+ 26   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 35.5 *2.5 +400, 470+ 26   *2.5)); //F
      polaCelana6.add(new Node(pg[2].width/20- 30   *2.5 +400, 470+ 60   *2.5)); //U
      polaCelana6.add(new Node(pg[2].width/20- 4    *2.5 +400, 470+ 60   *2.5)); //T
      polaCelana6.add(new Node(pg[2].width/20- 2    *2.5 +400, 470+ 26   *2.5)); //B
      polaCelana6.add(new Node(pg[2].width/20- 2    *2.5 +400, 470+ 5    *2.5)); //J
      polaCelana6.add(new Node(pg[2].width/20- 13.5 *2.5 +400, 470+ 5    *2.5)); //1
      polaCelana6.add(new Node(pg[2].width/20- 15   *2.5 +400, 470+ 16   *2.5)); //I
      polaCelana6.add(new Node(pg[2].width/20- 16.5 *2.5 +400, 470+ 5    *2.5)); //2
    }
    if (templateCelana==2 && size==1) {//celana panjang s
      celana1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      celana1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      celana1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      celana1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      celana2.add(new Node1(pg[3].width/2-40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+50, 400,100,0));
      celana2.add(new Node1(pg[3].width/2+60, 700,100,100));
      celana2.add(new Node1(pg[3].width/2+10, 700,0,100));
      celana2.add(new Node1(pg[3].width/2, 450,0,0));
      celana2.add(new Node1(pg[3].width/2-10, 700,0,100));
      celana2.add(new Node1(pg[3].width/2-60, 700,100,100));
      celana2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
      garisCelana.add(new Node(pg[3].width/2-4,370));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,370));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      
       //POLA DEPAN
      //kiri
      polaCelana1.add(new Node(pg[2].width/20+ 23.5 *2.5, 470+ 6    *2.5)); //K
      polaCelana1.add(new Node(pg[2].width/20+ 23.5 *2.5, 470+ 19   *2.5)); //N
      polaCelana1.add(new Node(pg[2].width/20+ 24.5 *2.5, 470+ 24   *2.5)); //
      polaCelana1.add(new Node(pg[2].width/20+ 27.5 *2.5, 470+ 26   *2.5)); //F
      polaCelana1.add(new Node(pg[2].width/20+ 26   *2.5, 470+ 60   *2.5)); //U
      polaCelana1.add(new Node(pg[2].width/20+ 24   *2.5, 470+ 95   *2.5)); //R
      polaCelana1.add(new Node(pg[2].width/20+ 6    *2.5, 470+ 95   *2.5)); //Q
      polaCelana1.add(new Node(pg[2].width/20+ 4    *2.5, 470+ 60   *2.5)); //T
      polaCelana1.add(new Node(pg[2].width/20+ 2    *2.5, 470+ 26   *2.5)); //B
      polaCelana1.add(new Node(pg[2].width/20+ 4    *2.5, 470+ 16   *2.5)); //O
      polaCelana1.add(new Node(pg[2].width/20+ 6.5  *2.5, 470+ 5    *2.5)); //J
      polaCelana1.add(new Node(pg[2].width/20+ 10   *2.5, 470+ 5    *2.5)); //1
      polaCelana1.add(new Node(pg[2].width/20+ 11.5 *2.5, 470+ 16   *2.5)); //2
      polaCelana1.add(new Node(pg[2].width/20+ 13   *2.5, 470+ 5    *2.5)); //3
      polaCelana1.add(new Node(pg[2].width/20+ 15   *2.5, 470+ 5.5  *2.5)); //I
      polaCelana1.add(new Node(pg[2].width/20+ 17   *2.5, 470+ 6    *2.5)); //4
      polaCelana1.add(new Node(pg[2].width/20+ 18.5 *2.5, 470+ 16   *2.5)); //5
      polaCelana1.add(new Node(pg[2].width/20+ 20   *2.5, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana2.add(new Node(pg[2].width/20+ 23.5 *2.5, 470+ 6    *2.5)); //K
      polaCelana2.add(new Node(pg[2].width/20+ 26.5 *2.5, 470+ 6    *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 26.5 *2.5, 470+ 15   *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 25.5 *2.5, 470+ 19   *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 23.5 *2.5, 470+ 20   *2.5)); //N

      //kanan
      polaCelana3.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana3.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 470+ 19   *2.5)); //N
      polaCelana3.add(new Node(pg[2].width/20- 24.5 *2.5 +200, 470+ 24   *2.5)); //
      polaCelana3.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 470+ 26   *2.5)); //F
      polaCelana3.add(new Node(pg[2].width/20- 26   *2.5 +200, 470+ 60   *2.5)); //U
      polaCelana3.add(new Node(pg[2].width/20- 24   *2.5 +200, 470+ 95   *2.5)); //R
      polaCelana3.add(new Node(pg[2].width/20- 6    *2.5 +200, 470+ 95   *2.5)); //Q
      polaCelana3.add(new Node(pg[2].width/20- 4    *2.5 +200, 470+ 60   *2.5)); //T
      polaCelana3.add(new Node(pg[2].width/20- 2    *2.5 +200, 470+ 26   *2.5)); //B
      polaCelana3.add(new Node(pg[2].width/20- 4    *2.5 +200, 470+ 16   *2.5)); //O
      polaCelana3.add(new Node(pg[2].width/20- 6.5  *2.5 +200, 470+ 5    *2.5)); //J
      polaCelana3.add(new Node(pg[2].width/20- 10   *2.5 +200, 470+ 5    *2.5)); //1
      polaCelana3.add(new Node(pg[2].width/20- 11.5 *2.5 +200, 470+ 16   *2.5)); //2
      polaCelana3.add(new Node(pg[2].width/20- 13   *2.5 +200, 470+ 5    *2.5)); //3
      polaCelana3.add(new Node(pg[2].width/20- 15   *2.5 +200, 470+ 5.5  *2.5)); //I
      polaCelana3.add(new Node(pg[2].width/20- 17   *2.5 +200, 470+ 6    *2.5)); //4
      polaCelana3.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 470+ 16   *2.5)); //5
      polaCelana3.add(new Node(pg[2].width/20- 20   *2.5 +200, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana4.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana4.add(new Node(pg[2].width/20- 26.5 *2.5 +200, 470+ 6    *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 26.5 *2.5 +200, 470+ 15   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 25.5 *2.5 +200, 470+ 19   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 470+ 20   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelana5.add(new Node(pg[2].width/20+ 24.5 *2.5 +210, 470+ 3    *2.5)); //K
      polaCelana5.add(new Node(pg[2].width/20+ 28.5 *2.5 +210, 470+ 23   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 32.5 *2.5 +210, 470+ 26   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 35.5 *2.5 +210, 470+ 26   *2.5)); //F
      polaCelana5.add(new Node(pg[2].width/20+ 30   *2.5 +210, 470+ 60   *2.5)); //U
      polaCelana5.add(new Node(pg[2].width/20+ 24   *2.5 +210, 470+ 95   *2.5)); //R
      polaCelana5.add(new Node(pg[2].width/20+ 6    *2.5 +210, 470+ 95   *2.5)); //Q
      polaCelana5.add(new Node(pg[2].width/20+ 4    *2.5 +210, 470+ 65   *2.5)); //T
      polaCelana5.add(new Node(pg[2].width/20+ 2    *2.5 +200, 470+ 26   *2.5)); //B
      polaCelana5.add(new Node(pg[2].width/20+ 2    *2.5 +210, 470+ 5    *2.5)); //J
      polaCelana5.add(new Node(pg[2].width/20+ 13.5 *2.5 +210, 470+ 5    *2.5)); //1
      polaCelana5.add(new Node(pg[2].width/20+ 15   *2.5 +210, 470+ 16   *2.5)); //I
      polaCelana5.add(new Node(pg[2].width/20+ 16.5 *2.5 +210, 470+ 5    *2.5)); //2

      //kanan
      polaCelana6.add(new Node(pg[2].width/20- 24.5 *2.5 +400, 470+ 3    *2.5)); //K
      polaCelana6.add(new Node(pg[2].width/20- 28.5 *2.5 +400, 470+ 23   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 32.5 *2.5 +400, 470+ 26   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 35.5 *2.5 +400, 470+ 26   *2.5)); //F
      polaCelana6.add(new Node(pg[2].width/20- 30   *2.5 +400, 470+ 60   *2.5)); //U
      polaCelana6.add(new Node(pg[2].width/20- 24   *2.5 +400, 470+ 95   *2.5)); //R
      polaCelana6.add(new Node(pg[2].width/20- 6    *2.5 +400, 470+ 95   *2.5)); //Q
      polaCelana6.add(new Node(pg[2].width/20- 4    *2.5 +400, 470+ 65   *2.5)); //T
      polaCelana6.add(new Node(pg[2].width/20- 2    *2.5 +400, 470+ 26   *2.5)); //B
      polaCelana6.add(new Node(pg[2].width/20- 2    *2.5 +400, 470+ 5    *2.5)); //J
      polaCelana6.add(new Node(pg[2].width/20- 13.5 *2.5 +400, 470+ 5    *2.5)); //1
      polaCelana6.add(new Node(pg[2].width/20- 15   *2.5 +400, 470+ 16   *2.5)); //I
      polaCelana6.add(new Node(pg[2].width/20- 16.5 *2.5 +400, 470+ 5    *2.5)); //2
    }
    if (templateCelana==1 && size==2) { // celana pendek m
       celana1.add(new Node1(pg[3].width/2-40, 360, 0,100));//0,100
      celana1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      celana1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      celana1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      celana2.add(new Node1(pg[3].width/2-40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+50, 400,100,0));
      celana2.add(new Node1(pg[3].width/2+60, 550,100,100));
      celana2.add(new Node1(pg[3].width/2+5, 550,0,100));
      celana2.add(new Node1(pg[3].width/2, 450,0,0));
      celana2.add(new Node1(pg[3].width/2-5, 550,0,100));
      celana2.add(new Node1(pg[3].width/2-60, 550,100,100));
      celana2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
      garisCelana.add(new Node(pg[3].width/2-4,370));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,370));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      
        //POLA DEPAN
      //kiri
      polaCelana1.add(new Node(pg[2].width/20+ 24   *2.5, 470+ 6    *2.5)); //K
      polaCelana1.add(new Node(pg[2].width/20+ 24   *2.5, 470+ 25   *2.5)); //N
      polaCelana1.add(new Node(pg[2].width/20+ 25.5 *2.5, 470+ 29   *2.5)); //
      polaCelana1.add(new Node(pg[2].width/20+ 29   *2.5, 470+ 32   *2.5)); //F
      polaCelana1.add(new Node(pg[2].width/20+ 27   *2.5, 470+ 70   *2.5)); //U
      polaCelana1.add(new Node(pg[2].width/20+ 3    *2.5, 470+ 70   *2.5)); //T
      polaCelana1.add(new Node(pg[2].width/20+ 1    *2.5, 470+ 32   *2.5)); //B
      polaCelana1.add(new Node(pg[2].width/20+ 2    *2.5, 470+ 25   *2.5)); //O
      polaCelana1.add(new Node(pg[2].width/20+ 6    *2.5, 470+ 5    *2.5)); //J
      polaCelana1.add(new Node(pg[2].width/20+ 10   *2.5, 470+ 5    *2.5)); //1
      polaCelana1.add(new Node(pg[2].width/20+ 11.5 *2.5, 470+ 16   *2.5)); //2
      polaCelana1.add(new Node(pg[2].width/20+ 13   *2.5, 470+ 5    *2.5)); //3
      polaCelana1.add(new Node(pg[2].width/20+ 15   *2.5, 470+ 5.5  *2.5)); //I
      polaCelana1.add(new Node(pg[2].width/20+ 17   *2.5, 470+ 6    *2.5)); //4
      polaCelana1.add(new Node(pg[2].width/20+ 18.5 *2.5, 470+ 16   *2.5)); //5
      polaCelana1.add(new Node(pg[2].width/20+ 20   *2.5, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana2.add(new Node(pg[2].width/20+ 24   *2.5, 470+ 6    *2.5)); //K
      polaCelana2.add(new Node(pg[2].width/20+ 27.5 *2.5, 470+ 6    *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 27.5 *2.5, 470+ 17   *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 26.5 *2.5, 470+ 23   *2.5)); //

      //kanan
      polaCelana3.add(new Node(pg[2].width/20- 24   *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana3.add(new Node(pg[2].width/20- 24   *2.5 +200, 470+ 25   *2.5)); //N
      polaCelana3.add(new Node(pg[2].width/20- 25.5 *2.5 +200, 470+ 29   *2.5)); //
      polaCelana3.add(new Node(pg[2].width/20- 29   *2.5 +200, 470+ 32   *2.5)); //F
      polaCelana3.add(new Node(pg[2].width/20- 27   *2.5 +200, 470+ 70   *2.5)); //U
      polaCelana3.add(new Node(pg[2].width/20- 3    *2.5 +200, 470+ 70   *2.5)); //T
      polaCelana3.add(new Node(pg[2].width/20- 1    *2.5 +200, 470+ 32   *2.5)); //B
      polaCelana3.add(new Node(pg[2].width/20- 2    *2.5 +200, 470+ 25   *2.5)); //O
      polaCelana3.add(new Node(pg[2].width/20- 6    *2.5 +200, 470+ 5    *2.5)); //J
      polaCelana3.add(new Node(pg[2].width/20- 10   *2.5 +200, 470+ 5    *2.5)); //1
      polaCelana3.add(new Node(pg[2].width/20- 11.5 *2.5 +200, 470+ 16   *2.5)); //2
      polaCelana3.add(new Node(pg[2].width/20- 13   *2.5 +200, 470+ 5    *2.5)); //3
      polaCelana3.add(new Node(pg[2].width/20- 15   *2.5 +200, 470+ 5.5  *2.5)); //I
      polaCelana3.add(new Node(pg[2].width/20- 17   *2.5 +200, 470+ 6    *2.5)); //4
      polaCelana3.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 470+ 16   *2.5)); //5
      polaCelana3.add(new Node(pg[2].width/20- 20   *2.5 +200, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana4.add(new Node(pg[2].width/20- 24   *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana4.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 470+ 6    *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 470+ 17   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 26.5 *2.5 +200, 470+ 23   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 24   *2.5 +200, 470+ 25   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelana5.add(new Node(pg[2].width/20+ 25   *2.5 +210, 470+ 3    *2.5)); //K
      polaCelana5.add(new Node(pg[2].width/20+ 28.5 *2.5 +210, 470+ 26   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 31.5 *2.5 +210, 470+ 31   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 37   *2.5 +210, 470+ 32   *2.5)); //F
      polaCelana5.add(new Node(pg[2].width/20+ 31   *2.5 +210, 470+ 70   *2.5)); //U
      polaCelana5.add(new Node(pg[2].width/20+ 3    *2.5 +210, 470+ 70   *2.5)); //T
      polaCelana5.add(new Node(pg[2].width/20+ 1    *2.5 +210, 470+ 32   *2.5)); //B
      polaCelana5.add(new Node(pg[2].width/20+ 1    *2.5 +210, 470+ 5    *2.5)); //J
      polaCelana5.add(new Node(pg[2].width/20+ 13.5 *2.5 +210, 470+ 5    *2.5)); //1
      polaCelana5.add(new Node(pg[2].width/20+ 15   *2.5 +210, 470+ 16   *2.5)); //I
      polaCelana5.add(new Node(pg[2].width/20+ 16.5 *2.5 +210, 470+ 5    *2.5)); //2

      //kanan
      polaCelana6.add(new Node(pg[2].width/20- 25   *2.5 +430, 470+ 3    *2.5)); //K
      polaCelana6.add(new Node(pg[2].width/20- 28.5 *2.5 +430, 470+ 26   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 31.5 *2.5 +430, 470+ 31   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 37   *2.5 +430, 470+ 32   *2.5)); //F
      polaCelana6.add(new Node(pg[2].width/20- 31   *2.5 +430, 470+ 70   *2.5)); //U
      polaCelana6.add(new Node(pg[2].width/20- 3    *2.5 +430, 470+ 70   *2.5)); //T
      polaCelana6.add(new Node(pg[2].width/20- 1    *2.5 +430, 470+ 32   *2.5)); //B
      polaCelana6.add(new Node(pg[2].width/20- 1    *2.5 +430, 470+ 5    *2.5)); //J
      polaCelana6.add(new Node(pg[2].width/20- 13.5 *2.5 +430, 470+ 5    *2.5)); //1
      polaCelana6.add(new Node(pg[2].width/20- 15   *2.5 +430, 470+ 16   *2.5)); //I
      polaCelana6.add(new Node(pg[2].width/20- 16.5 *2.5 +430, 470+ 5    *2.5)); //2
    }
    if (templateCelana==2 && size==2) { // celana panjang m
      celana1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      celana1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      celana1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      celana1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      celana2.add(new Node1(pg[3].width/2-40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+50, 400,100,0));
      celana2.add(new Node1(pg[3].width/2+60, 700,100,100));
      celana2.add(new Node1(pg[3].width/2+10, 700,0,100));
      celana2.add(new Node1(pg[3].width/2, 450,0,0));
      celana2.add(new Node1(pg[3].width/2-10, 700,0,100));
      celana2.add(new Node1(pg[3].width/2-60, 700,100,100));
      celana2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
      garisCelana.add(new Node(pg[3].width/2-4,370));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,370));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      
       //POLA DEPAN
      //kiri
      polaCelana1.add(new Node(pg[2].width/20+ 24   *2.5, 470+ 6    *2.5)); //K
      polaCelana1.add(new Node(pg[2].width/20+ 24   *2.5, 470+ 25   *2.5)); //N
      polaCelana1.add(new Node(pg[2].width/20+ 25.5 *2.5, 470+ 29   *2.5)); //
      polaCelana1.add(new Node(pg[2].width/20+ 29   *2.5, 470+ 32   *2.5)); //F
      polaCelana1.add(new Node(pg[2].width/20+ 27   *2.5, 470+ 70   *2.5)); //U
      polaCelana1.add(new Node(pg[2].width/20+ 25   *2.5, 470+ 101  *2.5)); //R
      polaCelana1.add(new Node(pg[2].width/20+ 5    *2.5, 470+ 101  *2.5)); //Q
      polaCelana1.add(new Node(pg[2].width/20+ 3    *2.5, 470+ 70   *2.5)); //T
      polaCelana1.add(new Node(pg[2].width/20+ 1    *2.5, 470+ 32   *2.5)); //B
      polaCelana1.add(new Node(pg[2].width/20+ 2    *2.5, 470+ 25   *2.5)); //O
      polaCelana1.add(new Node(pg[2].width/20+ 6    *2.5, 470+ 5    *2.5)); //J
      polaCelana1.add(new Node(pg[2].width/20+ 10   *2.5, 470+ 5    *2.5)); //1
      polaCelana1.add(new Node(pg[2].width/20+ 11.5 *2.5, 470+ 16   *2.5)); //2
      polaCelana1.add(new Node(pg[2].width/20+ 13   *2.5, 470+ 5    *2.5)); //3
      polaCelana1.add(new Node(pg[2].width/20+ 15   *2.5, 470+ 5.5  *2.5)); //I
      polaCelana1.add(new Node(pg[2].width/20+ 17   *2.5, 470+ 6    *2.5)); //4
      polaCelana1.add(new Node(pg[2].width/20+ 18.5 *2.5, 470+ 16   *2.5)); //5
      polaCelana1.add(new Node(pg[2].width/20+ 20   *2.5, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana2.add(new Node(pg[2].width/20+ 24   *2.5, 470+ 6    *2.5)); //K
      polaCelana2.add(new Node(pg[2].width/20+ 27.5 *2.5, 470+ 6    *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 27.5 *2.5, 470+ 17   *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 26.5 *2.5, 470+ 23   *2.5)); //

      //kanan
      polaCelana3.add(new Node(pg[2].width/20- 24   *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana3.add(new Node(pg[2].width/20- 24   *2.5 +200, 470+ 25   *2.5)); //N
      polaCelana3.add(new Node(pg[2].width/20- 25.5 *2.5 +200, 470+ 29   *2.5)); //
      polaCelana3.add(new Node(pg[2].width/20- 29   *2.5 +200, 470+ 32   *2.5)); //F
      polaCelana3.add(new Node(pg[2].width/20- 27   *2.5 +200, 470+ 70   *2.5)); //U
      polaCelana3.add(new Node(pg[2].width/20- 25   *2.5 +200, 470+ 101  *2.5)); //R
      polaCelana3.add(new Node(pg[2].width/20- 5    *2.5 +200, 470+ 101  *2.5)); //Q
      polaCelana3.add(new Node(pg[2].width/20- 3    *2.5 +200, 470+ 70   *2.5)); //T
      polaCelana3.add(new Node(pg[2].width/20- 1    *2.5 +200, 470+ 32   *2.5)); //B
      polaCelana3.add(new Node(pg[2].width/20- 2    *2.5 +200, 470+ 25   *2.5)); //O
      polaCelana3.add(new Node(pg[2].width/20- 6    *2.5 +200, 470+ 5    *2.5)); //J
      polaCelana3.add(new Node(pg[2].width/20- 10   *2.5 +200, 470+ 5    *2.5)); //1
      polaCelana3.add(new Node(pg[2].width/20- 11.5 *2.5 +200, 470+ 16   *2.5)); //2
      polaCelana3.add(new Node(pg[2].width/20- 13   *2.5 +200, 470+ 5    *2.5)); //3
      polaCelana3.add(new Node(pg[2].width/20- 15   *2.5 +200, 470+ 5.5  *2.5)); //I
      polaCelana3.add(new Node(pg[2].width/20- 17   *2.5 +200, 470+ 6    *2.5)); //4
      polaCelana3.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 470+ 16   *2.5)); //5
      polaCelana3.add(new Node(pg[2].width/20- 20   *2.5 +200, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana4.add(new Node(pg[2].width/20- 24   *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana4.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 470+ 6    *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 470+ 17   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 26.5 *2.5 +200, 470+ 23   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 24   *2.5 +200, 470+ 25   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelana5.add(new Node(pg[2].width/20+ 25   *2.5 +210, 470+ 3    *2.5)); //K
      polaCelana5.add(new Node(pg[2].width/20+ 28.5 *2.5 +210, 470+ 26   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 31.5 *2.5 +210, 470+ 31   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 37   *2.5 +210, 470+ 32   *2.5)); //F
      polaCelana5.add(new Node(pg[2].width/20+ 31   *2.5 +210, 470+ 70   *2.5)); //U
      polaCelana5.add(new Node(pg[2].width/20+ 29   *2.5 +210, 470+ 101  *2.5)); //R
      polaCelana5.add(new Node(pg[2].width/20+ 5    *2.5 +210, 470+ 101  *2.5)); //Q
      polaCelana5.add(new Node(pg[2].width/20+ 3    *2.5 +210, 470+ 70   *2.5)); //T
      polaCelana5.add(new Node(pg[2].width/20+ 1    *2.5 +210, 470+ 32   *2.5)); //B
      polaCelana5.add(new Node(pg[2].width/20+ 1    *2.5 +210, 470+ 5    *2.5)); //J
      polaCelana5.add(new Node(pg[2].width/20+ 13.5 *2.5 +210, 470+ 5    *2.5)); //1
      polaCelana5.add(new Node(pg[2].width/20+ 15   *2.5 +210, 470+ 16   *2.5)); //I
      polaCelana5.add(new Node(pg[2].width/20+ 16.5 *2.5 +210, 470+ 5    *2.5)); //2

      //kanan
      polaCelana6.add(new Node(pg[2].width/20- 25   *2.5 +430, 470+ 3    *2.5)); //K
      polaCelana6.add(new Node(pg[2].width/20- 28.5 *2.5 +430, 470+ 26   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 31.5 *2.5 +430, 470+ 31   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 37   *2.5 +430, 470+ 32   *2.5)); //F
      polaCelana6.add(new Node(pg[2].width/20- 31   *2.5 +430, 470+ 70   *2.5)); //U
      polaCelana6.add(new Node(pg[2].width/20- 29   *2.5 +430, 470+ 101  *2.5)); //R
      polaCelana6.add(new Node(pg[2].width/20- 5    *2.5 +430, 470+ 101  *2.5)); //Q
      polaCelana6.add(new Node(pg[2].width/20- 3    *2.5 +430, 470+ 70   *2.5)); //T
      polaCelana6.add(new Node(pg[2].width/20- 1    *2.5 +430, 470+ 32   *2.5)); //B
      polaCelana6.add(new Node(pg[2].width/20- 1    *2.5 +430, 470+ 5    *2.5)); //J
      polaCelana6.add(new Node(pg[2].width/20- 13.5 *2.5 +430, 470+ 5    *2.5)); //1
      polaCelana6.add(new Node(pg[2].width/20- 15   *2.5 +430, 470+ 16   *2.5)); //I
      polaCelana6.add(new Node(pg[2].width/20- 16.5 *2.5 +430, 470+ 5    *2.5)); //2
    }
    if (templateCelana==1 && size==3) { // celana pendek l
      celana1.add(new Node1(pg[3].width/2-40, 360, 0,100));//0,100
      celana1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      celana1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      celana1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      celana2.add(new Node1(pg[3].width/2-40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+50, 400,100,0));
      celana2.add(new Node1(pg[3].width/2+60, 550,100,100));
      celana2.add(new Node1(pg[3].width/2+5, 550,0,100));
      celana2.add(new Node1(pg[3].width/2, 450,0,0));
      celana2.add(new Node1(pg[3].width/2-5, 550,0,100));
      celana2.add(new Node1(pg[3].width/2-60, 550,100,100));
      
      garisCelana.add(new Node(pg[3].width/2-4,370));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,370));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      
       //POLA DEPAN
      //kiri
      polaCelana1.add(new Node(pg[2].width/20+ 25   *2.5, 470+ 6    *2.5)); //K
      polaCelana1.add(new Node(pg[2].width/20+ 25   *2.5, 470+ 31   *2.5)); //N
      polaCelana1.add(new Node(pg[2].width/20+ 28.5 *2.5, 470+ 37   *2.5)); //
      polaCelana1.add(new Node(pg[2].width/20+ 31   *2.5, 470+ 38   *2.5)); //F
      polaCelana1.add(new Node(pg[2].width/20+ 28   *2.5, 470+ 75   *2.5)); //U
      polaCelana1.add(new Node(pg[2].width/20+ 2    *2.5, 470+ 75   *2.5)); //T
      polaCelana1.add(new Node(pg[2].width/20+ 0    *2.5, 470+ 32   *2.5)); //B
      polaCelana1.add(new Node(pg[2].width/20+ 1    *2.5, 470+ 25   *2.5)); //O
      polaCelana1.add(new Node(pg[2].width/20+ 6    *2.5, 470+ 5    *2.5)); //J
      polaCelana1.add(new Node(pg[2].width/20+ 10   *2.5, 470+ 5    *2.5)); //1
      polaCelana1.add(new Node(pg[2].width/20+ 11.5 *2.5, 470+ 16   *2.5)); //2
      polaCelana1.add(new Node(pg[2].width/20+ 13   *2.5, 470+ 5    *2.5)); //3
      polaCelana1.add(new Node(pg[2].width/20+ 15   *2.5, 470+ 5.5  *2.5)); //I
      polaCelana1.add(new Node(pg[2].width/20+ 17   *2.5, 470+ 6    *2.5)); //4
      polaCelana1.add(new Node(pg[2].width/20+ 18.5 *2.5, 470+ 16   *2.5)); //5
      polaCelana1.add(new Node(pg[2].width/20+ 20   *2.5, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana2.add(new Node(pg[2].width/20+ 25   *2.5, 470+ 6    *2.5)); //K
      polaCelana2.add(new Node(pg[2].width/20+ 28.5 *2.5, 470+ 6    *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 28.5 *2.5, 470+ 23   *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 27.5 *2.5, 470+ 28   *2.5)); //

      //kanan
      polaCelana3.add(new Node(pg[2].width/20- 25   *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana3.add(new Node(pg[2].width/20- 25   *2.5 +200, 470+ 31   *2.5)); //N
      polaCelana3.add(new Node(pg[2].width/20- 28.5 *2.5 +200, 470+ 37   *2.5)); //
      polaCelana3.add(new Node(pg[2].width/20- 31   *2.5 +200, 470+ 38   *2.5)); //F
      polaCelana3.add(new Node(pg[2].width/20- 28   *2.5 +200, 470+ 75   *2.5)); //U
      polaCelana3.add(new Node(pg[2].width/20- 2    *2.5 +200, 470+ 75   *2.5)); //T
      polaCelana3.add(new Node(pg[2].width/20- 0    *2.5 +200, 470+ 32   *2.5)); //B
      polaCelana3.add(new Node(pg[2].width/20- 1    *2.5 +200, 470+ 25   *2.5)); //O
      polaCelana3.add(new Node(pg[2].width/20- 6    *2.5 +200, 470+ 5    *2.5)); //J
      polaCelana3.add(new Node(pg[2].width/20- 10   *2.5 +200, 470+ 5    *2.5)); //1
      polaCelana3.add(new Node(pg[2].width/20- 11.5 *2.5 +200, 470+ 16   *2.5)); //2
      polaCelana3.add(new Node(pg[2].width/20- 13   *2.5 +200, 470+ 5    *2.5)); //3
      polaCelana3.add(new Node(pg[2].width/20- 15   *2.5 +200, 470+ 5.5  *2.5)); //I
      polaCelana3.add(new Node(pg[2].width/20- 17   *2.5 +200, 470+ 6    *2.5)); //4
      polaCelana3.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 470+ 16   *2.5)); //5
      polaCelana3.add(new Node(pg[2].width/20- 20   *2.5 +200, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana4.add(new Node(pg[2].width/20- 25   *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana4.add(new Node(pg[2].width/20- 28.5 *2.5 +200, 470+ 6    *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 28.5 *2.5 +200, 470+ 23   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 470+ 28   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 25   *2.5 +200, 470+ 31   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelana5.add(new Node(pg[2].width/20+ 25.5 *2.5 +210, 470+ 3    *2.5)); //K
      polaCelana5.add(new Node(pg[2].width/20+ 28.5 *2.5 +210, 470+ 26   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 32.5 *2.5 +210, 470+ 34   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 39   *2.5 +210, 470+ 38   *2.5)); //F
      polaCelana5.add(new Node(pg[2].width/20+ 32   *2.5 +210, 470+ 75   *2.5)); //U
      polaCelana5.add(new Node(pg[2].width/20+ 2    *2.5 +210, 470+ 75   *2.5)); //T
      polaCelana5.add(new Node(pg[2].width/20+ 0    *2.5 +210, 470+ 32   *2.5)); //B
      polaCelana5.add(new Node(pg[2].width/20+ 0    *2.5 +210, 470+ 5    *2.5)); //J
      polaCelana5.add(new Node(pg[2].width/20+ 13.5 *2.5 +210, 470+ 5    *2.5)); //1
      polaCelana5.add(new Node(pg[2].width/20+ 15   *2.5 +210, 470+ 16   *2.5)); //I
      polaCelana5.add(new Node(pg[2].width/20+ 16.5 *2.5 +210, 470+ 5    *2.5)); //2

      //kanan
      polaCelana6.add(new Node(pg[2].width/20- 25.5 *2.5 +430, 470+ 3    *2.5)); //K
      polaCelana6.add(new Node(pg[2].width/20- 28.5 *2.5 +430, 470+ 26   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 32.5 *2.5 +430, 470+ 34   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 39   *2.5 +430, 470+ 38   *2.5)); //F
      polaCelana6.add(new Node(pg[2].width/20- 32   *2.5 +430, 470+ 75   *2.5)); //U
      polaCelana6.add(new Node(pg[2].width/20- 2    *2.5 +430, 470+ 75   *2.5)); //T
      polaCelana6.add(new Node(pg[2].width/20- 0    *2.5 +430, 470+ 32   *2.5)); //B
      polaCelana6.add(new Node(pg[2].width/20- 0    *2.5 +430, 470+ 5    *2.5)); //J
      polaCelana6.add(new Node(pg[2].width/20- 13.5 *2.5 +430, 470+ 5    *2.5)); //1
      polaCelana6.add(new Node(pg[2].width/20- 15   *2.5 +430, 470+ 16   *2.5)); //I
      polaCelana6.add(new Node(pg[2].width/20- 16.5 *2.5 +430, 470+ 5    *2.5)); //2
    }
    if (templateCelana==2 && size==3) { // celana panjang l
      celana1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      celana1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      celana1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      celana1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      celana2.add(new Node1(pg[3].width/2-40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+40, 370,0,0));
      celana2.add(new Node1(pg[3].width/2+50, 400,100,0));
      celana2.add(new Node1(pg[3].width/2+60, 700,100,100));
      celana2.add(new Node1(pg[3].width/2+10, 700,0,100));
      celana2.add(new Node1(pg[3].width/2, 450,0,0));
      celana2.add(new Node1(pg[3].width/2-10, 700,0,100));
      celana2.add(new Node1(pg[3].width/2-60, 700,100,100));
      celana2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
      garisCelana.add(new Node(pg[3].width/2-4,370));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,370));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      garisCelana.add(new Node(pg[3].width/2-4,420));
      garisCelana.add(new Node(pg[3].width/2+4,420));
      
       //POLA DEPAN
      //kiri
      polaCelana1.add(new Node(pg[2].width/20+ 25   *2.5, 470+ 6    *2.5)); //K
      polaCelana1.add(new Node(pg[2].width/20+ 25   *2.5, 470+ 31   *2.5)); //N
      polaCelana1.add(new Node(pg[2].width/20+ 28.5 *2.5, 470+ 37   *2.5)); //
      polaCelana1.add(new Node(pg[2].width/20+ 31   *2.5, 470+ 38   *2.5)); //F
      polaCelana1.add(new Node(pg[2].width/20+ 28   *2.5, 470+ 75   *2.5)); //U
      polaCelana1.add(new Node(pg[2].width/20+ 26   *2.5, 470+ 107  *2.5)); //R
      polaCelana1.add(new Node(pg[2].width/20+ 4    *2.5, 470+ 107  *2.5)); //Q
      polaCelana1.add(new Node(pg[2].width/20+ 2    *2.5, 470+ 75   *2.5)); //T
      polaCelana1.add(new Node(pg[2].width/20+ 0    *2.5, 470+ 32   *2.5)); //B
      polaCelana1.add(new Node(pg[2].width/20+ 1    *2.5, 470+ 25   *2.5)); //O
      polaCelana1.add(new Node(pg[2].width/20+ 6    *2.5, 470+ 5    *2.5)); //J
      polaCelana1.add(new Node(pg[2].width/20+ 10   *2.5, 470+ 5    *2.5)); //1
      polaCelana1.add(new Node(pg[2].width/20+ 11.5 *2.5, 470+ 16   *2.5)); //2
      polaCelana1.add(new Node(pg[2].width/20+ 13   *2.5, 470+ 5    *2.5)); //3
      polaCelana1.add(new Node(pg[2].width/20+ 15   *2.5, 470+ 5.5  *2.5)); //I
      polaCelana1.add(new Node(pg[2].width/20+ 17   *2.5, 470+ 6    *2.5)); //4
      polaCelana1.add(new Node(pg[2].width/20+ 18.5 *2.5, 470+ 16   *2.5)); //5
      polaCelana1.add(new Node(pg[2].width/20+ 20   *2.5, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana2.add(new Node(pg[2].width/20+ 25   *2.5, 470+ 6    *2.5)); //K
      polaCelana2.add(new Node(pg[2].width/20+ 28.5 *2.5, 470+ 6    *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 28.5 *2.5, 470+ 23   *2.5)); //
      polaCelana2.add(new Node(pg[2].width/20+ 27.5 *2.5, 470+ 28   *2.5)); //

      //kanan
      polaCelana3.add(new Node(pg[2].width/20- 25   *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana3.add(new Node(pg[2].width/20- 25   *2.5 +200, 470+ 31   *2.5)); //N
      polaCelana3.add(new Node(pg[2].width/20- 28.5 *2.5 +200, 470+ 37   *2.5)); //
      polaCelana3.add(new Node(pg[2].width/20- 31   *2.5 +200, 470+ 38   *2.5)); //F
      polaCelana3.add(new Node(pg[2].width/20- 28   *2.5 +200, 470+ 75   *2.5)); //U
      polaCelana3.add(new Node(pg[2].width/20- 26   *2.5 +200, 470+ 107  *2.5)); //R
      polaCelana3.add(new Node(pg[2].width/20- 4    *2.5 +200, 470+ 107  *2.5)); //Q
      polaCelana3.add(new Node(pg[2].width/20- 2    *2.5 +200, 470+ 75   *2.5)); //T
      polaCelana3.add(new Node(pg[2].width/20- 0    *2.5 +200, 470+ 32   *2.5)); //B
      polaCelana3.add(new Node(pg[2].width/20- 1    *2.5 +200, 470+ 25   *2.5)); //O
      polaCelana3.add(new Node(pg[2].width/20- 6    *2.5 +200, 470+ 5    *2.5)); //J
      polaCelana3.add(new Node(pg[2].width/20- 10   *2.5 +200, 470+ 5    *2.5)); //1
      polaCelana3.add(new Node(pg[2].width/20- 11.5 *2.5 +200, 470+ 16   *2.5)); //2
      polaCelana3.add(new Node(pg[2].width/20- 13   *2.5 +200, 470+ 5    *2.5)); //3
      polaCelana3.add(new Node(pg[2].width/20- 15   *2.5 +200, 470+ 5.5  *2.5)); //I
      polaCelana3.add(new Node(pg[2].width/20- 17   *2.5 +200, 470+ 6    *2.5)); //4
      polaCelana3.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 470+ 16   *2.5)); //5
      polaCelana3.add(new Node(pg[2].width/20- 20   *2.5 +200, 470+ 6    *2.5)); //6

      //POLA 
      polaCelana4.add(new Node(pg[2].width/20- 25   *2.5 +200, 470+ 6    *2.5)); //K
      polaCelana4.add(new Node(pg[2].width/20- 28.5 *2.5 +200, 470+ 6    *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 28.5 *2.5 +200, 470+ 23   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 470+ 28   *2.5)); //
      polaCelana4.add(new Node(pg[2].width/20- 25   *2.5 +200, 470+ 31   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelana5.add(new Node(pg[2].width/20+ 25.5 *2.5 +210, 470+ 3    *2.5)); //K
      polaCelana5.add(new Node(pg[2].width/20+ 28.5 *2.5 +210, 470+ 26   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 32.5 *2.5 +210, 470+ 34   *2.5)); //
      polaCelana5.add(new Node(pg[2].width/20+ 39   *2.5 +210, 470+ 38   *2.5)); //F
      polaCelana5.add(new Node(pg[2].width/20+ 32   *2.5 +210, 470+ 75   *2.5)); //U
      polaCelana5.add(new Node(pg[2].width/20+ 30   *2.5 +210, 470+ 107  *2.5)); //R
      polaCelana5.add(new Node(pg[2].width/20+ 4    *2.5 +210, 470+ 107  *2.5)); //Q
      polaCelana5.add(new Node(pg[2].width/20+ 2    *2.5 +210, 470+ 75   *2.5)); //T
      polaCelana5.add(new Node(pg[2].width/20+ 0    *2.5 +210, 470+ 32   *2.5)); //B
      polaCelana5.add(new Node(pg[2].width/20+ 0    *2.5 +210, 470+ 5    *2.5)); //J
      polaCelana5.add(new Node(pg[2].width/20+ 13.5 *2.5 +210, 470+ 5    *2.5)); //1
      polaCelana5.add(new Node(pg[2].width/20+ 15   *2.5 +210, 470+ 16   *2.5)); //I
      polaCelana5.add(new Node(pg[2].width/20+ 16.5 *2.5 +210, 470+ 5    *2.5)); //2

      //kanan
      polaCelana6.add(new Node(pg[2].width/20- 25.5 *2.5 +430, 470+ 3    *2.5)); //K
      polaCelana6.add(new Node(pg[2].width/20- 28.5 *2.5 +430, 470+ 26   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 32.5 *2.5 +430, 470+ 34   *2.5)); //
      polaCelana6.add(new Node(pg[2].width/20- 39   *2.5 +430, 470+ 38   *2.5)); //F
      polaCelana6.add(new Node(pg[2].width/20- 32   *2.5 +430, 470+ 75   *2.5)); //U
      polaCelana6.add(new Node(pg[2].width/20- 30   *2.5 +430, 470+ 107  *2.5)); //R
      polaCelana6.add(new Node(pg[2].width/20- 4    *2.5 +430, 470+ 107  *2.5)); //Q
      polaCelana6.add(new Node(pg[2].width/20- 2    *2.5 +430, 470+ 75   *2.5)); //T
      polaCelana6.add(new Node(pg[2].width/20- 0    *2.5 +430, 470+ 32   *2.5)); //B
      polaCelana6.add(new Node(pg[2].width/20- 0    *2.5 +430, 470+ 5    *2.5)); //J
      polaCelana6.add(new Node(pg[2].width/20- 13.5 *2.5 +430, 470+ 5    *2.5)); //1
      polaCelana6.add(new Node(pg[2].width/20- 15   *2.5 +430, 470+ 16   *2.5)); //I
      polaCelana6.add(new Node(pg[2].width/20- 16.5 *2.5 +430, 470+ 5    *2.5)); //2
    }
    newProject = false; 
    base();
    base1();
  }
}

public void selectGaun() {
  if (templateGaun>0) {
    if (!newProject) {
      for (int i = gaun1.size()-1; i >= 0; i--)
        gaun1.remove(gaun1.get(i));
      for (int i = gaun2.size()-1; i >= 0; i--)
        gaun2.remove(gaun2.get(i));
      for (int i = gaun3.size()-1; i >= 0; i--)
        gaun3.remove(gaun3.get(i));  
      for (int i = garisGaun.size()-1; i >= 0; i--)
        garisGaun.remove(garisGaun.get(i));
      for (int i = garisGaun2.size()-1; i >= 0; i--)
        garisGaun2.remove(garisGaun2.get(i));
      for (int i = polaGaun1.size()-1; i >= 0; i--)
        polaGaun1.remove(polaGaun1.get(i));
      for (int i = polaGaun2.size()-1; i >= 0; i--)
        polaGaun2.remove(polaGaun2.get(i));
      for (int i = polaGaun3.size()-1; i >= 0; i--)
        polaGaun3.remove(polaGaun3.get(i));
      for (int i = polaGaun4.size()-1; i >= 0; i--)
        polaGaun4.remove(polaGaun4.get(i));
      for (int i = polaGaun5.size()-1; i >= 0; i--)
        polaGaun5.remove(polaGaun5.get(i));
      for (int i = polaGaun6.size()-1; i >= 0; i--)
        polaGaun6.remove(polaGaun6.get(i));
      for (int i = polaGaun7.size()-1; i >= 0; i--)
        polaGaun7.remove(polaGaun7.get(i));
      for (int i = polaGaun8.size()-1; i >= 0; i--)
        polaGaun8.remove(polaGaun8.get(i));  
    }
    newProject = true;
    if (templateGaun==1) { //gaun bukaan depan pendek
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      garisGaun.add(new Node(pg[3].width/2, 240));
      garisGaun.add(new Node(pg[3].width/2, 350));
      garisGaun.add(new Node(pg[3].width/2+55, 350));
       garisGaun.add(new Node(pg[3].width/2-55, 350));
     
     //Pola Depan
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 22.5 *2.5, 50+ 3.5  *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 25.5 *2.5, 50+ 7    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 32   *2.5, 50+ 7    *2.5)); 
      polaGaun1.add(new Node(pg[2].width/20+ 32   *2.5, 50+ 45   *2.5)); //B
      polaGaun1.add(new Node(pg[2].width/20+ 20   *2.5, 50+ 45   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 18.5 *2.5, 50+ 34   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 17   *2.5, 50+ 45   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 45   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 22.5 *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 20.5 *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 18.5 *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 11.5 *2.5, 50+ 14.5 *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20- 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun2.add(new Node(pg[2].width/20- 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20- 22.5 *2.5 +200, 50+ 3.5  *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 25.5 *2.5 +200, 50+ 7    *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 32   *2.5 +200, 50+ 7    *2.5)); 
      polaGaun2.add(new Node(pg[2].width/20- 32   *2.5 +200, 50+ 45   *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20- 20   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 17   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun2.add(new Node(pg[2].width/20- 7.5  *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun2.add(new Node(pg[2].width/20- 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20- 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      
      polaGaun5.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 16   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaGaun5.add(new Node(pg[2].width/20+ 33.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 35   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 36.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 46   *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 48.5 *2.5, 480+ 17   *2.5)); //F
      polaGaun5.add(new Node(pg[2].width/20+ 51.5 *2.5, 480+ 53.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 25.5 *2.5, 480+ 56.5 *2.5)); //D
      polaGaun5.add(new Node(pg[2].width/20- 0.5  *2.5, 480+ 53.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 2.5  *2.5, 480+ 17   *2.5)); //F
      
//Pola Belakang
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 22.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 50+ 2    *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 2    *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 31.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 33   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 44   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 42.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 44.5 *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 38   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 36.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 27   *2.5 +200, 50+ 45   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 20   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 17   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 35   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 36.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 46   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 48.5 *2.5 +200, 480+ 17   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 51.5 *2.5 +200, 480+ 53.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 480+ 56.5 *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 0.5  *2.5 +200, 480+ 53.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F   
    }
    if (templateGaun==2) {//gaun bukaan depan panjang
     gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      garisGaun.add(new Node(pg[3].width/2, 240));
      garisGaun.add(new Node(pg[3].width/2, 350));
      garisGaun.add(new Node(pg[3].width/2+55, 350));
       garisGaun.add(new Node(pg[3].width/2-55, 350));
      
      //Pola Depan
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 22.5 *2.5, 50+ 3.5  *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 25.5 *2.5, 50+ 7    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 32   *2.5, 50+ 7    *2.5)); 
      polaGaun1.add(new Node(pg[2].width/20+ 32   *2.5, 50+ 45   *2.5)); //B
      polaGaun1.add(new Node(pg[2].width/20+ 20   *2.5, 50+ 45   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 18.5 *2.5, 50+ 34   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 17   *2.5, 50+ 45   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 45   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 22.5 *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 20.5 *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 18.5 *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 11.5 *2.5, 50+ 14.5 *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20- 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun2.add(new Node(pg[2].width/20- 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20- 22.5 *2.5 +200, 50+ 3.5  *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 25.5 *2.5 +200, 50+ 7    *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 32   *2.5 +200, 50+ 7    *2.5)); 
      polaGaun2.add(new Node(pg[2].width/20- 32   *2.5 +200, 50+ 45   *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20- 20   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 17   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun2.add(new Node(pg[2].width/20- 7.5  *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun2.add(new Node(pg[2].width/20- 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20- 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      
      polaGaun5.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 16   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaGaun5.add(new Node(pg[2].width/20+ 33.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 35   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 36.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 46   *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 48.5 *2.5, 480+ 17   *2.5)); //F
      polaGaun5.add(new Node(pg[2].width/20+ 51.5 *2.5, 480+ 88.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 25.5 *2.5, 480+ 91.5 *2.5)); //D
      polaGaun5.add(new Node(pg[2].width/20- 0.5  *2.5, 480+ 88.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 2.5  *2.5, 480+ 17   *2.5)); //F
      
//Pola Belakang
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 22.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 50+ 2    *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 2    *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 31.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 33   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 44   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 42.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 44.5 *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 38   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 36.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 27   *2.5 +200, 50+ 45   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 20   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 17   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 35   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 36.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 46   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 48.5 *2.5 +200, 480+ 17   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 51.5 *2.5 +200, 480+ 88.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 480+ 91.5 *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 0.5  *2.5 +200, 480+ 88.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F 
    }
    if (templateGaun==3) {//gaun bukaan belakang pendek
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      //Pola Depan      
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 22.5 *2.5, 50+ 3.5  *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 25.5 *2.5, 50+ 7    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 28.5 *2.5, 50+ 7    *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 31.5 *2.5, 50+ 3.5  *2.5)); //4
      polaGaun1.add(new Node(pg[2].width/20+ 33   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 44   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 42.5 *2.5, 50+ 14.5 *2.5)); //I
      polaGaun1.add(new Node(pg[2].width/20+ 44.5 *2.5, 50+ 18.5 *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 47   *2.5, 50+ 20.5 *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 22.5 *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 45   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 38   *2.5, 50+ 45   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 36.5 *2.5, 50+ 34   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 45   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 27   *2.5, 50+ 45   *2.5)); //
      polaGaun1.add(new Node(pg[2].width/20+ 20   *2.5, 50+ 45   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 18.5 *2.5, 50+ 34   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 17   *2.5, 50+ 45   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 45   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 22.5 *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 20.5 *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 18.5 *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 11.5 *2.5, 50+ 14.5 *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 16   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20+ 33.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 35   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 36.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 46   *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 48.5 *2.5, 480+ 17   *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20+ 51.5 *2.5, 480+ 53.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 25.5 *2.5, 480+ 56.5 *2.5)); //D
      polaGaun2.add(new Node(pg[2].width/20- 0.5  *2.5, 480+ 53.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 2.5  *2.5, 480+ 17   *2.5)); //F
      
//Pola Belakang
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 22.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 50+ 2    *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 2    *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 31.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 33   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 44   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 42.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 44.5 *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 38   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 36.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 27   *2.5 +200, 50+ 45   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 20   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 17   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 35   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 36.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 46   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 48.5 *2.5 +200, 480+ 17   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 51.5 *2.5 +200, 480+ 53.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 480+ 56.5 *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 0.5  *2.5 +200, 480+ 53.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F  
      
    }
    if(templateGaun==4){//gaun bukaan belakang panjang 
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      //Pola Depan      
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 22.5 *2.5, 50+ 3.5  *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 25.5 *2.5, 50+ 7    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 28.5 *2.5, 50+ 7    *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 31.5 *2.5, 50+ 3.5  *2.5)); //4
      polaGaun1.add(new Node(pg[2].width/20+ 33   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 44   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 42.5 *2.5, 50+ 14.5 *2.5)); //I
      polaGaun1.add(new Node(pg[2].width/20+ 44.5 *2.5, 50+ 18.5 *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 47   *2.5, 50+ 20.5 *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 22.5 *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 45   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 38   *2.5, 50+ 45   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 36.5 *2.5, 50+ 34   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 45   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 27   *2.5, 50+ 45   *2.5)); //
      polaGaun1.add(new Node(pg[2].width/20+ 20   *2.5, 50+ 45   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 18.5 *2.5, 50+ 34   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 17   *2.5, 50+ 45   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 45   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 22.5 *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 20.5 *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 18.5 *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 11.5 *2.5, 50+ 14.5 *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 14.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 16   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 17.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 25.5 *2.5, 480+ 1.5  *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20+ 33.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 35   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 36.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 46   *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 48.5 *2.5, 480+ 17   *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20+ 51.5 *2.5, 480+ 88.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 25.5 *2.5, 480+ 91.5 *2.5)); //D
      polaGaun2.add(new Node(pg[2].width/20- 0.5  *2.5, 480+ 88.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 2.5  *2.5, 480+ 17   *2.5)); //F
      
//Pola Belakang
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 22.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 50+ 2    *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 2    *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 31.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 33   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 44   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 42.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 44.5 *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 38   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 36.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 27   *2.5 +200, 50+ 45   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 20   *2.5 +200, 50+ 45   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 50+ 34   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 17   *2.5 +200, 50+ 45   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 45   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 22.5 *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 20.5 *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 18.5 *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 11.5 *2.5 +200, 50+ 14.5 *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 14.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 16   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 17.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 35   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 36.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 46   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 48.5 *2.5 +200, 480+ 17   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 51.5 *2.5 +200, 480+ 88.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 25.5 *2.5 +200, 480+ 91.5 *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 0.5  *2.5 +200, 480+ 88.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 2.5  *2.5 +200, 480+ 17   *2.5)); //F
    }
    if (templateGaun==5) { //gaun bukaan depan pendek m
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      garisGaun.add(new Node(pg[3].width/2, 240));
      garisGaun.add(new Node(pg[3].width/2, 350));
      garisGaun.add(new Node(pg[3].width/2+55, 350));
      garisGaun.add(new Node(pg[3].width/2-55, 350));
      
      //Pola Depan      
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 22   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 23.5 *2.5, 50+ 4    *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 26.5 *2.5, 50+ 8    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 8    *2.5)); 
      polaGaun1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 47.5 *2.5)); //B
      polaGaun1.add(new Node(pg[2].width/20+ 20   *2.5, 50+ 47   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 18.5 *2.5, 50+ 36   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 17   *2.5, 50+ 47   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 47   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 26   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 8    *2.5, 50+ 24   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 22   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 12   *2.5, 50+ 18   *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20- 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun2.add(new Node(pg[2].width/20- 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 50+ 4    *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 26.5 *2.5 +200, 50+ 8    *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 33.5 *2.5 +200, 50+ 8    *2.5)); 
      polaGaun2.add(new Node(pg[2].width/20- 33.5 *2.5 +200, 50+ 47.5 *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20- 20   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 17   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun2.add(new Node(pg[2].width/20- 7    *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun2.add(new Node(pg[2].width/20- 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20- 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 12   *2.5 +200, 50+ 18   *2.5)); //I
      
      polaGaun5.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 17   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaGaun5.add(new Node(pg[2].width/20+ 35.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 37   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 38.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 49   *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 52   *2.5, 480+ 18   *2.5)); //F
      polaGaun5.add(new Node(pg[2].width/20+ 55   *2.5, 480+ 63.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 66.5 *2.5)); //D
      polaGaun5.add(new Node(pg[2].width/20- 1    *2.5, 480+ 63.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 2    *2.5, 480+ 17   *2.5)); //F
      
//Pola Belakang 
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 23.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 26.5 *2.5 +200, 50+ 2.5  *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 30.5 *2.5 +200, 50+ 2.5  *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 45   *2.5 +200, 50+ 18   *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 49   *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 40   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 38.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 47   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 20   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 17   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 12   *2.5 +200, 50+ 18   *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 37   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 38.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 49   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 52   *2.5 +200, 480+ 18   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 55   *2.5 +200, 480+ 63.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 66.5 *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 1    *2.5 +200, 480+ 63.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 2    *2.5 +200, 480+ 17   *2.5)); //F  
    }
    if (templateGaun==6) {//gaun bukaan depan panjang m
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      garisGaun.add(new Node(pg[3].width/2, 240));
      garisGaun.add(new Node(pg[3].width/2, 350));
      garisGaun.add(new Node(pg[3].width/2+55, 350));
       garisGaun.add(new Node(pg[3].width/2-55, 350));
      
      //Pola Depan      
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 22   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 23.5 *2.5, 50+ 4    *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 26.5 *2.5, 50+ 8    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 8    *2.5)); 
      polaGaun1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 47.5 *2.5)); //B
      polaGaun1.add(new Node(pg[2].width/20+ 20   *2.5, 50+ 47   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 18.5 *2.5, 50+ 36   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 17   *2.5, 50+ 47   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 47   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 26   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 8    *2.5, 50+ 24   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 22   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 12   *2.5, 50+ 18   *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20- 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun2.add(new Node(pg[2].width/20- 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20- 23.5 *2.5 +200, 50+ 4    *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 26.5 *2.5 +200, 50+ 8    *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 33.5 *2.5 +200, 50+ 8    *2.5)); 
      polaGaun2.add(new Node(pg[2].width/20- 33.5 *2.5 +200, 50+ 47.5 *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20- 20   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 18.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 17   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun2.add(new Node(pg[2].width/20- 7    *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun2.add(new Node(pg[2].width/20- 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20- 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 12   *2.5 +200, 50+ 18   *2.5)); //I   
      
      polaGaun5.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 17   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaGaun5.add(new Node(pg[2].width/20+ 35.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 37   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 38.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 49   *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 52   *2.5, 480+ 18   *2.5)); //F
      polaGaun5.add(new Node(pg[2].width/20+ 55   *2.5, 480+ 94.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 96   *2.5)); //D
      polaGaun5.add(new Node(pg[2].width/20- 1    *2.5, 480+ 94.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 2    *2.5, 480+ 17   *2.5)); //F 
      
//Pola Belakang 
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 23.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 26.5 *2.5 +200, 50+ 2.5  *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 30.5 *2.5 +200, 50+ 2.5  *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 45   *2.5 +200, 50+ 18   *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 49   *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 40   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 38.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 47   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 20   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 17   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 12   *2.5 +200, 50+ 18   *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 37   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 38.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 49   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 52   *2.5 +200, 480+ 18   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 55   *2.5 +200, 480+ 94.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 96   *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 1    *2.5 +200, 480+ 94.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 2    *2.5 +200, 480+ 17   *2.5)); //F
    }
    if (templateGaun==7) {//gaun bukaan belakang pendek m
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));   
      
      //Pola Depan      
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 22   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 23.5 *2.5, 50+ 4    *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 26.5 *2.5, 50+ 8    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 30.5 *2.5, 50+ 8    *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 4    *2.5)); //4
      polaGaun1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 47   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 45   *2.5, 50+ 18   *2.5)); //I
      polaGaun1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 22   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 49   *2.5, 50+ 24   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 26   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 50   *2.5, 50+ 47   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 40   *2.5, 50+ 47   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 38.5 *2.5, 50+ 36   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 37   *2.5, 50+ 47   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 28.5 *2.5, 50+ 47   *2.5)); //
      polaGaun1.add(new Node(pg[2].width/20+ 20   *2.5, 50+ 47   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 18.5 *2.5, 50+ 36   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 17   *2.5, 50+ 47   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 47   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 26   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 8    *2.5, 50+ 24   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 22   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 12   *2.5, 50+ 18   *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 17   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20+ 35.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 37   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 38.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 49   *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 52   *2.5, 480+ 18   *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20+ 55   *2.5, 480+ 63.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 66.5 *2.5)); //D
      polaGaun2.add(new Node(pg[2].width/20- 1    *2.5, 480+ 63.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 2    *2.5, 480+ 17   *2.5)); //F
      
//Pola Belakang 
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 23.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 26.5 *2.5 +200, 50+ 2.5  *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 30.5 *2.5 +200, 50+ 2.5  *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 45   *2.5 +200, 50+ 18   *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 49   *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 40   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 38.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 47   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 20   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 17   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 12   *2.5 +200, 50+ 18   *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 37   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 38.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 49   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 52   *2.5 +200, 480+ 18   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 55   *2.5 +200, 480+ 63.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 66.5 *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 1    *2.5 +200, 480+ 63.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 2    *2.5 +200, 480+ 17   *2.5)); //F
    }
    if(templateGaun==8){//gaun bukaan belakang panjang m
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));  
      
      //Pola Depan      
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 22   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 23.5 *2.5, 50+ 4    *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 26.5 *2.5, 50+ 8    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 30.5 *2.5, 50+ 8    *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 33.5 *2.5, 50+ 4    *2.5)); //4
      polaGaun1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 47   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 45   *2.5, 50+ 18   *2.5)); //I
      polaGaun1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 22   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 49   *2.5, 50+ 24   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 26   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 50   *2.5, 50+ 47   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 40   *2.5, 50+ 47   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 38.5 *2.5, 50+ 36   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 37   *2.5, 50+ 47   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 28.5 *2.5, 50+ 47   *2.5)); //
      polaGaun1.add(new Node(pg[2].width/20+ 20   *2.5, 50+ 47   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 18.5 *2.5, 50+ 36   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 17   *2.5, 50+ 47   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7    *2.5, 50+ 47   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5    *2.5, 50+ 26   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 8    *2.5, 50+ 24   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 22   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 12   *2.5, 50+ 18   *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 15.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 17   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 18.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 1.5  *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20+ 35.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 37   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 38.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 49   *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 52   *2.5, 480+ 18   *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20+ 55   *2.5, 480+ 94.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 96   *2.5)); //D
      polaGaun2.add(new Node(pg[2].width/20- 1    *2.5, 480+ 94.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 2    *2.5, 480+ 17   *2.5)); //F 
      
//Pola Belakang 
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 22   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 23.5 *2.5 +200, 50+ 1    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 26.5 *2.5 +200, 50+ 2.5  *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 30.5 *2.5 +200, 50+ 2.5  *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 33.5 *2.5 +200, 50+ 1    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 35   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 47   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 45   *2.5 +200, 50+ 18   *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 49   *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 40   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 38.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 50+ 47   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 20   *2.5 +200, 50+ 47   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 50+ 36   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 17   *2.5 +200, 50+ 47   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7    *2.5 +200, 50+ 47   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5    *2.5 +200, 50+ 26   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 8    *2.5 +200, 50+ 24   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 22   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 12   *2.5 +200, 50+ 18   *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 17   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 18.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 37   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 38.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 49   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 52   *2.5 +200, 480+ 18   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 55   *2.5 +200, 480+ 94.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 96   *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 1    *2.5 +200, 480+ 94.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 2    *2.5 +200, 480+ 17   *2.5)); //F
    }
    if (templateGaun==9) { //gaun bukaan depan pendek l
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      garisGaun.add(new Node(pg[3].width/2, 240));
      garisGaun.add(new Node(pg[3].width/2, 350));
      garisGaun.add(new Node(pg[3].width/2+55, 350));
       garisGaun.add(new Node(pg[3].width/2-55, 350));
      
      //Pola Depan
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 23   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 24.5 *2.5, 50+ 5    *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 27.5 *2.5, 50+ 9    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 9    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 49 *2.5)); //B
      polaGaun1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 49   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 19.5 *2.5, 50+ 38   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 18   *2.5, 50+ 49   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 49   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 30   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 28   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 26   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 12.5 *2.5, 50+ 21   *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20- 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun2.add(new Node(pg[2].width/20- 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20- 24.5 *2.5 +200, 50+ 5    *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 50+ 9    *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 35   *2.5 +200, 50+ 9    *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 35   *2.5 +200, 50+ 49 *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20- 21   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 19.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 18   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun2.add(new Node(pg[2].width/20- 7.5  *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun2.add(new Node(pg[2].width/20- 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20- 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 12.5 *2.5 +200, 50+ 21   *2.5)); //I
      
      polaGaun5.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 16.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 18   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 19.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 28.5 *2.5, 480+ 1.5  *2.5)); //B
      polaGaun5.add(new Node(pg[2].width/20+ 37.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/20+ 39   *2.5, 480+ 13   *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/20+ 40.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/20+ 52   *2.5, 480+ 0    *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/20+ 56.5 *2.5, 480+ 20   *2.5)); //F
      polaGaun5.add(new Node(pg[2].width/20+ 59.5 *2.5, 480+ 68.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 70   *2.5)); //D
      polaGaun5.add(new Node(pg[2].width/20- 2.5  *2.5, 480+ 68.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/20+ 0.5  *2.5, 480+ 20   *2.5)); //F

//Pola Belakang
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 24.5 *2.5 +200, 50+ 2    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 27.5 *2.5 +200, 50+ 4    *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 32.5 *2.5 +200, 50+ 4    *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 50+ 2    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 21   *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 54.5 *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 52.5 *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 42   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 40.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 39   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 30   *2.5 +200, 50+ 49   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 19.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 18   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 50+ 21   *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 16.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 18   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 19.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 37.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 39   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 40.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 52   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 56.5 *2.5 +200, 480+ 20   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 59.5 *2.5 +200, 480+ 68.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 70   *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 2.5  *2.5 +200, 480+ 68.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 0.5  *2.5 +200, 480+ 20   *2.5)); //F 
    }
    if (templateGaun==10) {//gaun bukaan depan panjang l
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      garisGaun.add(new Node(pg[3].width/2, 240));
      garisGaun.add(new Node(pg[3].width/2, 350));
      garisGaun.add(new Node(pg[3].width/2+55, 350));
      garisGaun.add(new Node(pg[3].width/2-55, 350));
      
      //Pola Depan
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 23   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 24.5 *2.5, 50+ 5    *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 27.5 *2.5, 50+ 9    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 9    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 35   *2.5, 50+ 49 *2.5)); //B
      polaGaun1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 49   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 19.5 *2.5, 50+ 38   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 18   *2.5, 50+ 49   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 49   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 30   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 28   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 26   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 12.5 *2.5, 50+ 21   *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20- 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun2.add(new Node(pg[2].width/20- 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20- 24.5 *2.5 +200, 50+ 5    *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 27.5 *2.5 +200, 50+ 9    *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 35   *2.5 +200, 50+ 9    *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 35   *2.5 +200, 50+ 49 *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20- 21   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 19.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 18   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun2.add(new Node(pg[2].width/20- 7.5  *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun2.add(new Node(pg[2].width/20- 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20- 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun2.add(new Node(pg[2].width/20- 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun2.add(new Node(pg[2].width/20- 12.5 *2.5 +200, 50+ 21   *2.5)); //I
      
      polaGaun5.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0     *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/25+ 16.5 *2.5, 480+ 0.9   *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/25+ 18   *2.5, 480+ 13    *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/25+ 19.5 *2.5, 480+ 1.1   *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/25+ 28.5 *2.5, 480+ 1.5   *2.5)); //B
      polaGaun5.add(new Node(pg[2].width/25+ 37.5 *2.5, 480+ 1.1   *2.5)); //L
      polaGaun5.add(new Node(pg[2].width/25+ 39   *2.5, 480+ 13    *2.5)); //K
      polaGaun5.add(new Node(pg[2].width/25+ 40.5 *2.5, 480+ 0.9   *2.5)); //M
      polaGaun5.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 0     *2.5)); //E
      polaGaun5.add(new Node(pg[2].width/25+ 56.5 *2.5, 480+ 20    *2.5)); //F
      polaGaun5.add(new Node(pg[2].width/25+ 59.5 *2.5, 480+ 100.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 102   *2.5)); //D
      polaGaun5.add(new Node(pg[2].width/25- 2.5  *2.5, 480+ 100.5 *2.5)); //H
      polaGaun5.add(new Node(pg[2].width/25+ 0.5  *2.5, 480+ 20    *2.5)); //F

//Pola Belakang
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 24.5 *2.5 +200, 50+ 2    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 27.5 *2.5 +200, 50+ 4    *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 32.5 *2.5 +200, 50+ 4    *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 50+ 2    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 21   *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 54.5 *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 52.5 *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 42   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 40.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 39   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 30   *2.5 +200, 50+ 49   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 19.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 18   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 50+ 21   *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0     *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/25+ 16.5 *2.5 +200, 480+ 0.9   *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/25+ 18   *2.5 +200, 480+ 13    *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/25+ 19.5 *2.5 +200, 480+ 1.1   *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 1.5   *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/25+ 37.5 *2.5 +200, 480+ 1.1   *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/25+ 39   *2.5 +200, 480+ 13    *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/25+ 40.5 *2.5 +200, 480+ 0.9   *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/25+ 52   *2.5 +200, 480+ 0     *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/25+ 56.5 *2.5 +200, 480+ 20    *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/25+ 59.5 *2.5 +200, 480+ 100.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 102   *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 480+ 100.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/25+ 0.5  *2.5 +200, 480+ 20    *2.5)); //F 
    }
    if (templateGaun==11) {//gaun bukaan belakang pendek l
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 550,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      //Pola Depan
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 23   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 24.5 *2.5, 50+ 5    *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 27.5 *2.5, 50+ 9    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 32.5 *2.5, 50+ 9    *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 35.5 *2.5, 50+ 5    *2.5)); //4
      polaGaun1.add(new Node(pg[2].width/20+ 37   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 50   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 21   *2.5)); //I
      polaGaun1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 26   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 28   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 54.5 *2.5, 50+ 30   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 52.5 *2.5, 50+ 49   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 42   *2.5, 50+ 49   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 40.5 *2.5, 50+ 38   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 39   *2.5, 50+ 49   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 30   *2.5, 50+ 49   *2.5)); //
      polaGaun1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 49   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 19.5 *2.5, 50+ 38   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 18   *2.5, 50+ 49   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 49   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 30   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 28   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 26   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 12.5 *2.5, 50+ 21   *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/20+ 5    *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 16.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 18   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 19.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 28.5 *2.5, 480+ 1.5  *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/20+ 37.5 *2.5, 480+ 1.1  *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/20+ 39   *2.5, 480+ 13   *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/20+ 40.5 *2.5, 480+ 0.9  *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/20+ 52   *2.5, 480+ 0    *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/20+ 56.5 *2.5, 480+ 20   *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/20+ 59.5 *2.5, 480+ 68.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 27   *2.5, 480+ 70   *2.5)); //D
      polaGaun2.add(new Node(pg[2].width/20- 2.5  *2.5, 480+ 68.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/20+ 0.5  *2.5, 480+ 20   *2.5)); //F

//Pola Belakang
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 24.5 *2.5 +200, 50+ 2    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 27.5 *2.5 +200, 50+ 4    *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 32.5 *2.5 +200, 50+ 4    *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 50+ 2    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 21   *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 54.5 *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 52.5 *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 42   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 40.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 39   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 30   *2.5 +200, 50+ 49   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 19.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 18   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 50+ 21   *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/20+ 5    *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 16.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 18   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 19.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 28.5 *2.5 +200, 480+ 1.5  *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/20+ 37.5 *2.5 +200, 480+ 1.1  *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/20+ 39   *2.5 +200, 480+ 13   *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/20+ 40.5 *2.5 +200, 480+ 0.9  *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/20+ 52   *2.5 +200, 480+ 0    *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/20+ 56.5 *2.5 +200, 480+ 20   *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/20+ 59.5 *2.5 +200, 480+ 68.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 27   *2.5 +200, 480+ 70   *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/20- 2.5  *2.5 +200, 480+ 68.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/20+ 0.5  *2.5 +200, 480+ 20   *2.5)); //F
    }
    if(templateGaun==12){//gaun bukaan belakang panjang l
      gaun1.add(new Node1(pg[3].width/2-25, 220,0,0));
      gaun1.add(new Node1(pg[3].width/2-20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2, 240,0,0));
      gaun1.add(new Node1(pg[3].width/2+20, 230,0,0));
      gaun1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
      gaun1.add(new Node1(pg[3].width/2+55, 240,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 285,100,0));
      gaun1.add(new Node1(pg[3].width/2+45, 300,100,0));
      gaun1.add(new Node1(pg[3].width/2+55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2+55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2+75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-75, 700,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 400,100,100));
      gaun1.add(new Node1(pg[3].width/2-55, 320,100,100));
      gaun1.add(new Node1(pg[3].width/2-45, 300,0,100));
      gaun1.add(new Node1(pg[3].width/2-45, 285,0,100));
      gaun1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      //Pola Depan
      polaGaun1.add(new Node(pg[2].width/20+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 23   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 24.5 *2.5, 50+ 5    *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 27.5 *2.5, 50+ 9    *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 32.5 *2.5, 50+ 9    *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 35.5 *2.5, 50+ 5    *2.5)); //4
      polaGaun1.add(new Node(pg[2].width/20+ 37   *2.5, 50+ 0    *2.5)); //F
      polaGaun1.add(new Node(pg[2].width/20+ 50   *2.5, 50+ 3.5  *2.5)); //J
      polaGaun1.add(new Node(pg[2].width/20+ 47.5 *2.5, 50+ 21   *2.5)); //I
      polaGaun1.add(new Node(pg[2].width/20+ 49.5 *2.5, 50+ 26   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 52   *2.5, 50+ 28   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 54.5 *2.5, 50+ 30   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 52.5 *2.5, 50+ 49   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 42   *2.5, 50+ 49   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 40.5 *2.5, 50+ 38   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 39   *2.5, 50+ 49   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 30   *2.5, 50+ 49   *2.5)); //
      polaGaun1.add(new Node(pg[2].width/20+ 21   *2.5, 50+ 49   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 19.5 *2.5, 50+ 38   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 18   *2.5, 50+ 49   *2.5)); //3
      polaGaun1.add(new Node(pg[2].width/20+ 7.5  *2.5, 50+ 49   *2.5)); //N
      polaGaun1.add(new Node(pg[2].width/20+ 5.5  *2.5, 50+ 30   *2.5)); //E
      polaGaun1.add(new Node(pg[2].width/20+ 6    *2.5, 50+ 28   *2.5)); //2
      polaGaun1.add(new Node(pg[2].width/20+ 9.5  *2.5, 50+ 26   *2.5)); //1
      polaGaun1.add(new Node(pg[2].width/20+ 12.5 *2.5, 50+ 21   *2.5)); //I
      
      polaGaun2.add(new Node(pg[2].width/25+ 5    *2.5, 480+ 0     *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/25+ 16.5 *2.5, 480+ 0.9   *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/25+ 18   *2.5, 480+ 13    *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/25+ 19.5 *2.5, 480+ 1.1   *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/25+ 28.5 *2.5, 480+ 1.5   *2.5)); //B
      polaGaun2.add(new Node(pg[2].width/25+ 37.5 *2.5, 480+ 1.1   *2.5)); //L
      polaGaun2.add(new Node(pg[2].width/25+ 39   *2.5, 480+ 13    *2.5)); //K
      polaGaun2.add(new Node(pg[2].width/25+ 40.5 *2.5, 480+ 0.9   *2.5)); //M
      polaGaun2.add(new Node(pg[2].width/25+ 52   *2.5, 480+ 0     *2.5)); //E
      polaGaun2.add(new Node(pg[2].width/25+ 56.5 *2.5, 480+ 20    *2.5)); //F
      polaGaun2.add(new Node(pg[2].width/25+ 59.5 *2.5, 480+ 100.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/25+ 27   *2.5, 480+ 102   *2.5)); //D
      polaGaun2.add(new Node(pg[2].width/25- 2.5  *2.5, 480+ 100.5 *2.5)); //H
      polaGaun2.add(new Node(pg[2].width/25+ 0.5  *2.5, 480+ 20    *2.5)); //F

//Pola Belakang
      polaGaun3.add(new Node(pg[2].width/20+ 10   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 23   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 24.5 *2.5 +200, 50+ 2    *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 27.5 *2.5 +200, 50+ 4    *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 32.5 *2.5 +200, 50+ 4    *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 35.5 *2.5 +200, 50+ 2    *2.5)); //4
      polaGaun3.add(new Node(pg[2].width/20+ 37   *2.5 +200, 50+ 0    *2.5)); //F
      polaGaun3.add(new Node(pg[2].width/20+ 50   *2.5 +200, 50+ 3.5  *2.5)); //J
      polaGaun3.add(new Node(pg[2].width/20+ 47.5 *2.5 +200, 50+ 21   *2.5)); //I
      polaGaun3.add(new Node(pg[2].width/20+ 49.5 *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 52   *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 54.5 *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 52.5 *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 42   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 40.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 39   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 30   *2.5 +200, 50+ 49   *2.5)); //
      polaGaun3.add(new Node(pg[2].width/20+ 21   *2.5 +200, 50+ 49   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 19.5 *2.5 +200, 50+ 38   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 18   *2.5 +200, 50+ 49   *2.5)); //3
      polaGaun3.add(new Node(pg[2].width/20+ 7.5  *2.5 +200, 50+ 49   *2.5)); //N
      polaGaun3.add(new Node(pg[2].width/20+ 5.5  *2.5 +200, 50+ 30   *2.5)); //E
      polaGaun3.add(new Node(pg[2].width/20+ 6    *2.5 +200, 50+ 28   *2.5)); //2
      polaGaun3.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 50+ 26   *2.5)); //1
      polaGaun3.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 50+ 21   *2.5)); //I
      
      polaGaun4.add(new Node(pg[2].width/25+ 5    *2.5 +200, 480+ 0     *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/25+ 16.5 *2.5 +200, 480+ 0.9   *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/25+ 18   *2.5 +200, 480+ 13    *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/25+ 19.5 *2.5 +200, 480+ 1.1   *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/25+ 28.5 *2.5 +200, 480+ 1.5   *2.5)); //B
      polaGaun4.add(new Node(pg[2].width/25+ 37.5 *2.5 +200, 480+ 1.1   *2.5)); //L
      polaGaun4.add(new Node(pg[2].width/25+ 39   *2.5 +200, 480+ 13    *2.5)); //K
      polaGaun4.add(new Node(pg[2].width/25+ 40.5 *2.5 +200, 480+ 0.9   *2.5)); //M
      polaGaun4.add(new Node(pg[2].width/25+ 52   *2.5 +200, 480+ 0     *2.5)); //E
      polaGaun4.add(new Node(pg[2].width/25+ 56.5 *2.5 +200, 480+ 20    *2.5)); //F
      polaGaun4.add(new Node(pg[2].width/25+ 59.5 *2.5 +200, 480+ 100.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/25+ 27   *2.5 +200, 480+ 102   *2.5)); //D
      polaGaun4.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 480+ 100.5 *2.5)); //H
      polaGaun4.add(new Node(pg[2].width/25+ 0.5  *2.5 +200, 480+ 20    *2.5)); //F  
    }
    newProject = false; 
    base();
    base1();
  }
}

void selectAtasanlk() {
  if (templateAtasanlk>0) {
    if (!newProject) {
      for (int i = atasanlk1.size()-1; i >= 0; i--)
        atasanlk1.remove(atasanlk1.get(i));
      for (int i = atasanlk2.size()-1; i >= 0; i--)
        atasanlk2.remove(atasanlk2.get(i));
      for (int i = atasanlk3.size()-1; i >= 0; i--)
        atasanlk3.remove(atasanlk3.get(i));
      for (int i = garisAtasanlk.size()-1; i >= 0; i--)
        garisAtasanlk.remove(garisAtasanlk.get(i));
      for (int i = garisAtasanlk2.size()-1; i >= 0; i--)
        garisAtasanlk2.remove(garisAtasanlk2.get(i));
      for (int i = polaAtasanlk1.size()-1; i >= 0; i--)
        polaAtasanlk1.remove(polaAtasanlk1.get(i));
      for (int i = polaAtasanlk2.size()-1; i >= 0; i--)
        polaAtasanlk2.remove(polaAtasanlk2.get(i));
      for (int i = polaAtasanlk3.size()-1; i >= 0; i--)
        polaAtasanlk3.remove(polaAtasanlk3.get(i));
      for (int i = polaAtasanlk4.size()-1; i >= 0; i--)
        polaAtasanlk4.remove(polaAtasanlk4.get(i));
      for (int i = polaAtasanlk5.size()-1; i >= 0; i--)
        polaAtasanlk5.remove(polaAtasanlk5.get(i));
      for (int i = polaAtasanlk6.size()-1; i >= 0; i--)
        polaAtasanlk6.remove(polaAtasanlk6.get(i));
      for (int i = polaAtasanlk7.size()-1; i >= 0; i--)
        polaAtasanlk7.remove(polaAtasanlk7.get(i));
      for (int i = polaAtasanlk8.size()-1; i >= 0; i--)
        polaAtasanlk8.remove(polaAtasanlk8.get(i));
    }

    newProject = true; 
    if (templateAtasanlk==1 && size==1) { //baju tanpa bukaan s   
    
      atasanlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      atasanlk1.add(new Node1(pg[3].width/2-20, 230,100,0));
      atasanlk1.add(new Node1(pg[3].width/2, 240,0,0));
      atasanlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      atasanlk1.add(new Node1(pg[3].width/2+25, 220,100,0)); // leher
      atasanlk1.add(new Node1(pg[3].width/2+55, 240,100,100)); //ketiak
      atasanlk1.add(new Node1(pg[3].width/2+45, 285,0,100));
      atasanlk1.add(new Node1(pg[3].width/2+45, 300,100,0));
      atasanlk1.add(new Node1(pg[3].width/2+55, 320,0,100));//ketiak
      atasanlk1.add(new Node1(pg[3].width/2+55, 420,50,50));
      atasanlk1.add(new Node1(pg[3].width/2-55, 420,100,100));
      atasanlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
      atasanlk1.add(new Node1(pg[3].width/2-45, 300,100,100));
      atasanlk1.add(new Node1(pg[3].width/2-45, 285,100,100));
      atasanlk1.add(new Node1(pg[3].width/2-55, 240,0,100));

       //POLA DEPAN
      polaAtasanlk1.add(new Node(pg[2].width/25+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasanlk1.add(new Node(pg[2].width/25+ 21   *2.5, 50+ 0    *2.5)); //F
      polaAtasanlk1.add(new Node(pg[2].width/25+ 22.5 *2.5, 50+ 3.5  *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 50+ 7    *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 28.5 *2.5, 50+ 7    *2.5)); //3
      polaAtasanlk1.add(new Node(pg[2].width/25+ 31.5 *2.5, 50+ 3.5  *2.5)); //4
      polaAtasanlk1.add(new Node(pg[2].width/25+ 33   *2.5, 50+ 0    *2.5)); //F
      polaAtasanlk1.add(new Node(pg[2].width/25+ 44   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasanlk1.add(new Node(pg[2].width/25+ 42.5 *2.5, 50+ 14.5 *2.5)); //I
      polaAtasanlk1.add(new Node(pg[2].width/25+ 44.5 *2.5, 50+ 18.5 *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 47   *2.5, 50+ 20.5 *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 49.5 *2.5, 50+ 22.5 *2.5)); //E
      polaAtasanlk1.add(new Node(pg[2].width/25+ 49.5 *2.5, 50+ 71.5 *2.5)); //N
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 50+ 71.5 *2.5)); //N
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 50+ 22.5 *2.5)); //E
      polaAtasanlk1.add(new Node(pg[2].width/25+ 7    *2.5, 50+ 20.5 *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 50+ 18.5 *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 11.5 *2.5, 50+ 14.5 *2.5)); //I

      //POLA BELAKANG
      polaAtasanlk2.add(new Node(pg[2].width/25+ 10   *2.5+250, 50+ 3.5  *2.5)); //J
      polaAtasanlk2.add(new Node(pg[2].width/25+ 21   *2.5+250, 50+ 0    *2.5)); //F
      polaAtasanlk2.add(new Node(pg[2].width/25+ 22.5 *2.5+250, 50+ 1    *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 25.5 *2.5+250, 50+ 2    *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 28.5 *2.5+250, 50+ 2    *2.5)); //3
      polaAtasanlk2.add(new Node(pg[2].width/25+ 31.5 *2.5+250, 50+ 1    *2.5)); //4
      polaAtasanlk2.add(new Node(pg[2].width/25+ 33   *2.5+250, 50+ 0    *2.5)); //F
      polaAtasanlk2.add(new Node(pg[2].width/25+ 44   *2.5+250, 50+ 3.5  *2.5)); //J
      polaAtasanlk2.add(new Node(pg[2].width/25+ 42.5 *2.5+250, 50+ 14.5 *2.5)); //I
      polaAtasanlk2.add(new Node(pg[2].width/25+ 44.5 *2.5+250, 50+ 18.5 *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 47   *2.5+250, 50+ 20.5 *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 49.5 *2.5+250, 50+ 22.5 *2.5)); //E
      polaAtasanlk2.add(new Node(pg[2].width/25+ 49.5 *2.5+250, 50+ 71.5 *2.5)); //N
      polaAtasanlk2.add(new Node(pg[2].width/25+ 5.5  *2.5+250, 50+ 71.5 *2.5)); //N
      polaAtasanlk2.add(new Node(pg[2].width/25+ 5.5  *2.5+250, 50+ 22.5 *2.5)); //E
      polaAtasanlk2.add(new Node(pg[2].width/25+ 7    *2.5+250, 50+ 20.5 *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 9.5  *2.5+250, 50+ 18.5 *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 11.5 *2.5+250, 50+ 14.5 *2.5)); //I
    }
 
    if(templateAtasanlk==2 && size==1){ //baju bukaan depan s
     atasanlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-20, 230,100,0));
     atasanlk1.add(new Node1(pg[3].width/2, 240,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+20, 230,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
     atasanlk1.add(new Node1(pg[3].width/2+55, 240,100,0)); //ketiak
     atasanlk1.add(new Node1(pg[3].width/2+45, 285,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+45, 300,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
     atasanlk1.add(new Node1(pg[3].width/2+55, 420,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 420,100,100));
     atasanlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
     atasanlk1.add(new Node1(pg[3].width/2-45, 300,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 240,100,100));
      
     garisAtasanlk.add(new Node(pg[3].width/2, 240));
     garisAtasanlk.add(new Node(pg[3].width/2, 420));
      
       //POLA DEPAN
      //#Kiri
      polaAtasanlk1.add(new Node(pg[2].width/25+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasanlk1.add(new Node(pg[2].width/25+ 21   *2.5, 50+ 0    *2.5)); //F
      polaAtasanlk1.add(new Node(pg[2].width/25+ 22.5 *2.5, 50+ 3.5  *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 50+ 7    *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 32   *2.5, 50+ 7    *2.5)); 
      polaAtasanlk1.add(new Node(pg[2].width/25+ 32   *2.5, 50+ 71.5 *2.5)); //B
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 50+ 71.5 *2.5)); //N
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 50+ 22.5 *2.5)); //E
      polaAtasanlk1.add(new Node(pg[2].width/25+ 7    *2.5, 50+ 20.5 *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 50+ 18.5 *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 11.5 *2.5, 50+ 14.5 *2.5)); //I

      //#Kanan
      polaAtasanlk2.add(new Node(pg[2].width/25+ 22   *2.5 +50, 50+ 7    *2.5)); 
      polaAtasanlk2.add(new Node(pg[2].width/25+ 28.5 *2.5 +50, 50+ 7    *2.5)); //3
      polaAtasanlk2.add(new Node(pg[2].width/25+ 31.5 *2.5 +50, 50+ 3.5  *2.5)); //4
      polaAtasanlk2.add(new Node(pg[2].width/25+ 33   *2.5 +50, 50+ 0    *2.5)); //F
      polaAtasanlk2.add(new Node(pg[2].width/25+ 44   *2.5 +50, 50+ 3.5  *2.5)); //J
      polaAtasanlk2.add(new Node(pg[2].width/25+ 42.5 *2.5 +50, 50+ 14.5 *2.5)); //I
      polaAtasanlk2.add(new Node(pg[2].width/25+ 44.5 *2.5 +50, 50+ 18.5 *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 47   *2.5 +50, 50+ 20.5 *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 49.5 *2.5 +50, 50+ 22.5 *2.5)); //E
      polaAtasanlk2.add(new Node(pg[2].width/25+ 49.5 *2.5 +50, 50+ 71.5 *2.5)); //N
      polaAtasanlk2.add(new Node(pg[2].width/25+ 22   *2.5 +50, 50+ 71.5 *2.5)); //B
      
      //POLA BELAKANG
      polaAtasanlk3.add(new Node(pg[2].width/25+ 10   *2.5+250, 50+ 3.5  *2.5)); //J
      polaAtasanlk3.add(new Node(pg[2].width/25+ 21   *2.5+250, 50+ 0    *2.5)); //F
      polaAtasanlk3.add(new Node(pg[2].width/25+ 22.5 *2.5+250, 50+ 1    *2.5)); //1
      polaAtasanlk3.add(new Node(pg[2].width/25+ 25.5 *2.5+250, 50+ 2    *2.5)); //2
      polaAtasanlk3.add(new Node(pg[2].width/25+ 28.5 *2.5+250, 50+ 2    *2.5)); //3
      polaAtasanlk3.add(new Node(pg[2].width/25+ 31.5 *2.5+250, 50+ 1    *2.5)); //4
      polaAtasanlk3.add(new Node(pg[2].width/25+ 33   *2.5+250, 50+ 0    *2.5)); //F
      polaAtasanlk3.add(new Node(pg[2].width/25+ 44   *2.5+250, 50+ 3.5  *2.5)); //J
      polaAtasanlk3.add(new Node(pg[2].width/25+ 42.5 *2.5+250, 50+ 14.5 *2.5)); //I
      polaAtasanlk3.add(new Node(pg[2].width/25+ 44.5 *2.5+250, 50+ 18.5 *2.5)); //1
      polaAtasanlk3.add(new Node(pg[2].width/25+ 47   *2.5+250, 50+ 20.5 *2.5)); //2
      polaAtasanlk3.add(new Node(pg[2].width/25+ 49.5 *2.5+250, 50+ 22.5 *2.5)); //E
      polaAtasanlk3.add(new Node(pg[2].width/25+ 49.5 *2.5+250, 50+ 71.5 *2.5)); //N
      polaAtasanlk3.add(new Node(pg[2].width/25+ 5.5  *2.5+250, 50+ 71.5 *2.5)); //N
      polaAtasanlk3.add(new Node(pg[2].width/25+ 5.5  *2.5+250, 50+ 22.5 *2.5)); //E
      polaAtasanlk3.add(new Node(pg[2].width/25+ 7    *2.5+250, 50+ 20.5 *2.5)); //2
      polaAtasanlk3.add(new Node(pg[2].width/25+ 9.5  *2.5+250, 50+ 18.5 *2.5)); //1
      polaAtasanlk3.add(new Node(pg[2].width/25+ 11.5 *2.5+250, 50+ 14.5 *2.5)); //I 
    }
    if(templateAtasanlk==1 && size==2){//tanpa bukaan m
     atasanlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-20, 230,100,0));
     atasanlk1.add(new Node1(pg[3].width/2, 240,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+20, 230,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
     atasanlk1.add(new Node1(pg[3].width/2+55, 240,100,0)); //ketiak
     atasanlk1.add(new Node1(pg[3].width/2+45, 285,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+45, 300,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
     atasanlk1.add(new Node1(pg[3].width/2+55, 420,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 420,100,100));
     atasanlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
     atasanlk1.add(new Node1(pg[3].width/2-45, 300,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 240,100,100));
     
      //POLA DEPAN
      polaAtasanlk1.add(new Node(pg[2].width/25+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasanlk1.add(new Node(pg[2].width/25+ 22   *2.5, 50+ 0    *2.5)); //F
      polaAtasanlk1.add(new Node(pg[2].width/25+ 23.5 *2.5, 50+ 4    *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 26.5 *2.5, 50+ 8    *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 30.5 *2.5, 50+ 8    *2.5)); //3
      polaAtasanlk1.add(new Node(pg[2].width/25+ 33.5 *2.5, 50+ 4    *2.5)); //4
      polaAtasanlk1.add(new Node(pg[2].width/25+ 35   *2.5, 50+ 0    *2.5)); //F
      polaAtasanlk1.add(new Node(pg[2].width/25+ 47   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasanlk1.add(new Node(pg[2].width/25+ 45   *2.5, 50+ 18   *2.5)); //I
      polaAtasanlk1.add(new Node(pg[2].width/25+ 47.5 *2.5, 50+ 22   *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 49   *2.5, 50+ 24   *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 52   *2.5, 50+ 26   *2.5)); //E
      polaAtasanlk1.add(new Node(pg[2].width/25+ 52   *2.5, 50+ 76.5 *2.5)); //N
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5    *2.5, 50+ 76.5 *2.5)); //N
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5    *2.5, 50+ 26   *2.5)); //E
      polaAtasanlk1.add(new Node(pg[2].width/25+ 8    *2.5, 50+ 24   *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 50+ 22   *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 12   *2.5, 50+ 14.5 *2.5)); //I

      //POLA BELAKANG
      polaAtasanlk2.add(new Node(pg[2].width/25+ 10   *2.5  +250, 50+ 3.5  *2.5)); //J
      polaAtasanlk2.add(new Node(pg[2].width/25+ 22   *2.5  +250, 50+ 0    *2.5)); //F
      polaAtasanlk2.add(new Node(pg[2].width/25+ 23.5 *2.5  +250, 50+ 1    *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 26.5 *2.5  +250, 50+ 2.5  *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 30.5 *2.5  +250, 50+ 2.5  *2.5)); //3
      polaAtasanlk2.add(new Node(pg[2].width/25+ 33.5 *2.5  +250, 50+ 1    *2.5)); //4
      polaAtasanlk2.add(new Node(pg[2].width/25+ 35   *2.5  +250, 50+ 0    *2.5)); //F
      polaAtasanlk2.add(new Node(pg[2].width/25+ 47   *2.5  +250, 50+ 3.5  *2.5)); //J
      polaAtasanlk2.add(new Node(pg[2].width/25+ 45   *2.5  +250, 50+ 18   *2.5)); //I
      polaAtasanlk2.add(new Node(pg[2].width/25+ 47.5 *2.5  +250, 50+ 22   *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 49   *2.5  +250, 50+ 24   *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 52   *2.5  +250, 50+ 26   *2.5)); //E
      polaAtasanlk2.add(new Node(pg[2].width/25+ 52   *2.5  +250, 50+ 76.5 *2.5)); //N
      polaAtasanlk2.add(new Node(pg[2].width/25+ 5    *2.5  +250, 50+ 76.5 *2.5)); //N
      polaAtasanlk2.add(new Node(pg[2].width/25+ 5    *2.5  +250, 50+ 26   *2.5)); //E
      polaAtasanlk2.add(new Node(pg[2].width/25+ 8    *2.5  +250, 50+ 24   *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 9.5  *2.5  +250, 50+ 22   *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 12   *2.5  +250, 50+ 14.5 *2.5)); //I
    }
    if(templateAtasanlk==4){//bukaan depan m
     atasanlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-20, 230,100,0));
     atasanlk1.add(new Node1(pg[3].width/2, 240,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+20, 230,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
     atasanlk1.add(new Node1(pg[3].width/2+55, 240,100,0)); //ketiak
     atasanlk1.add(new Node1(pg[3].width/2+45, 285,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+45, 300,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
     atasanlk1.add(new Node1(pg[3].width/2+55, 420,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 420,100,100));
     atasanlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
     atasanlk1.add(new Node1(pg[3].width/2-45, 300,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 240,100,100));
      
      garisAtasanlk.add(new Node(pg[3].width/2, 240));
      garisAtasanlk.add(new Node(pg[3].width/2, 420));
      
       //POLA DEPAN
      //#Kiri
      polaAtasanlk1.add(new Node(pg[2].width/25+ 10   *2.5, 50+ 3.5   *2.5)); //J
      polaAtasanlk1.add(new Node(pg[2].width/25+ 22   *2.5, 50+ 0     *2.5)); //F
      polaAtasanlk1.add(new Node(pg[2].width/25+ 23.5 *2.5, 50+ 4     *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 26.5 *2.5, 50+ 8     *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 33.5 *2.5, 50+ 8     *2.5)); 
      polaAtasanlk1.add(new Node(pg[2].width/25+ 33.5 *2.5, 50+ 76.5  *2.5)); //B
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5    *2.5, 50+ 76.5  *2.5)); //N
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5    *2.5, 50+ 26    *2.5)); //E
      polaAtasanlk1.add(new Node(pg[2].width/25+ 8    *2.5, 50+ 24    *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 50+ 22    *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 12   *2.5, 50+ 14.5  *2.5)); //I

      //#Kanan
      polaAtasanlk2.add(new Node(pg[2].width/25+ 23.5 *2.5 +50, 50+ 8    *2.5)); 
      polaAtasanlk2.add(new Node(pg[2].width/25+ 30.5 *2.5 +50, 50+ 8    *2.5)); //3
      polaAtasanlk2.add(new Node(pg[2].width/25+ 33.5 *2.5 +50, 50+ 4    *2.5)); //4
      polaAtasanlk2.add(new Node(pg[2].width/25+ 35   *2.5 +50, 50+ 0    *2.5)); //F
      polaAtasanlk2.add(new Node(pg[2].width/25+ 47   *2.5 +50, 50+ 3.5  *2.5)); //J
      polaAtasanlk2.add(new Node(pg[2].width/25+ 45   *2.5 +50, 50+ 18   *2.5)); //I
      polaAtasanlk2.add(new Node(pg[2].width/25+ 47.5 *2.5 +50, 50+ 22   *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 49   *2.5 +50, 50+ 24   *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 52   *2.5 +50, 50+ 26   *2.5)); //E
      polaAtasanlk2.add(new Node(pg[2].width/25+ 52   *2.5 +50, 50+ 76.5 *2.5)); //N
      polaAtasanlk2.add(new Node(pg[2].width/25+ 23.5 *2.5 +50, 50+ 76.5 *2.5)); //B
      
      //POLA BELAKANG
      polaAtasanlk3.add(new Node(pg[2].width/25+ 10   *2.5   +250, 50+ 3.5  *2.5)); //J
      polaAtasanlk3.add(new Node(pg[2].width/25+ 22   *2.5   +250, 50+ 0    *2.5)); //F
      polaAtasanlk3.add(new Node(pg[2].width/25+ 23.5 *2.5   +250, 50+ 1    *2.5)); //1
      polaAtasanlk3.add(new Node(pg[2].width/25+ 26.5 *2.5   +250, 50+ 2.5  *2.5)); //2
      polaAtasanlk3.add(new Node(pg[2].width/25+ 30.5 *2.5   +250, 50+ 2.5  *2.5)); //3
      polaAtasanlk3.add(new Node(pg[2].width/25+ 33.5 *2.5   +250, 50+ 1    *2.5)); //4
      polaAtasanlk3.add(new Node(pg[2].width/25+ 35   *2.5   +250, 50+ 0    *2.5)); //F
      polaAtasanlk3.add(new Node(pg[2].width/25+ 47   *2.5   +250, 50+ 3.5  *2.5)); //J
      polaAtasanlk3.add(new Node(pg[2].width/25+ 45   *2.5   +250, 50+ 18   *2.5)); //I
      polaAtasanlk3.add(new Node(pg[2].width/25+ 47.5 *2.5   +250, 50+ 22   *2.5)); //1
      polaAtasanlk3.add(new Node(pg[2].width/25+ 49   *2.5   +250, 50+ 24   *2.5)); //2
      polaAtasanlk3.add(new Node(pg[2].width/25+ 52   *2.5   +250, 50+ 26   *2.5)); //E
      polaAtasanlk3.add(new Node(pg[2].width/25+ 52   *2.5   +250, 50+ 76.5 *2.5)); //N
      polaAtasanlk3.add(new Node(pg[2].width/25+ 5    *2.5   +250, 50+ 76.5 *2.5)); //N
      polaAtasanlk3.add(new Node(pg[2].width/25+ 5    *2.5   +250, 50+ 26   *2.5)); //E
      polaAtasanlk3.add(new Node(pg[2].width/25+ 8    *2.5   +250, 50+ 24   *2.5)); //2
      polaAtasanlk3.add(new Node(pg[2].width/25+ 9.5  *2.5   +250, 50+ 22   *2.5)); //1
      polaAtasanlk3.add(new Node(pg[2].width/25+ 12   *2.5   +250, 50+ 14.5 *2.5)); //I
    }
    if(templateAtasanlk==5){ //tanpa bukaan l
     atasanlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-20, 230,100,0));
     atasanlk1.add(new Node1(pg[3].width/2, 240,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+20, 230,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
     atasanlk1.add(new Node1(pg[3].width/2+55, 240,100,0)); //ketiak
     atasanlk1.add(new Node1(pg[3].width/2+45, 285,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+45, 300,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
     atasanlk1.add(new Node1(pg[3].width/2+55, 420,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 420,100,100));
     atasanlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
     atasanlk1.add(new Node1(pg[3].width/2-45, 300,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 240,100,100));
     
       //POLA DEPAN
      polaAtasanlk1.add(new Node(pg[2].width/25+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasanlk1.add(new Node(pg[2].width/25+ 23   *2.5, 50+ 0    *2.5)); //F
      polaAtasanlk1.add(new Node(pg[2].width/25+ 24.5 *2.5, 50+ 5    *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 27.5 *2.5, 50+ 9    *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 32.5 *2.5, 50+ 9    *2.5)); //3
      polaAtasanlk1.add(new Node(pg[2].width/25+ 35.5 *2.5, 50+ 5    *2.5)); //4
      polaAtasanlk1.add(new Node(pg[2].width/25+ 37   *2.5, 50+ 0    *2.5)); //F
      polaAtasanlk1.add(new Node(pg[2].width/25+ 50   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasanlk1.add(new Node(pg[2].width/25+ 47.5 *2.5, 50+ 21   *2.5)); //I
      polaAtasanlk1.add(new Node(pg[2].width/25+ 49.5 *2.5, 50+ 26   *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 52   *2.5, 50+ 28   *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 54.5 *2.5, 50+ 30   *2.5)); //E
      polaAtasanlk1.add(new Node(pg[2].width/25+ 54.5 *2.5, 50+ 81.5 *2.5)); //N
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 50+ 81.5 *2.5)); //N
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 50+ 30   *2.5)); //E
      polaAtasanlk1.add(new Node(pg[2].width/25+ 6    *2.5, 50+ 28   *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 50+ 26   *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 50+ 21   *2.5)); //I

      //POLA BELAKANG
      polaAtasanlk2.add(new Node(pg[2].width/25+ 10   *2.5   +250, 50+ 3.5  *2.5)); //J
      polaAtasanlk2.add(new Node(pg[2].width/25+ 23   *2.5   +250, 50+ 0    *2.5)); //F
      polaAtasanlk2.add(new Node(pg[2].width/25+ 24.5 *2.5   +250, 50+ 2    *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 27.5 *2.5   +250, 50+ 4    *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 32.5 *2.5   +250, 50+ 4    *2.5)); //3
      polaAtasanlk2.add(new Node(pg[2].width/25+ 35.5 *2.5   +250, 50+ 2    *2.5)); //4
      polaAtasanlk2.add(new Node(pg[2].width/25+ 37   *2.5   +250, 50+ 0    *2.5)); //F
      polaAtasanlk2.add(new Node(pg[2].width/25+ 50   *2.5   +250, 50+ 3.5  *2.5)); //J
      polaAtasanlk2.add(new Node(pg[2].width/25+ 47.5 *2.5   +250, 50+ 21   *2.5)); //I
      polaAtasanlk2.add(new Node(pg[2].width/25+ 49.5 *2.5   +250, 50+ 26   *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 52   *2.5   +250, 50+ 28   *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 54.5 *2.5   +250, 50+ 30   *2.5)); //E
      polaAtasanlk2.add(new Node(pg[2].width/25+ 54.5 *2.5   +250, 50+ 81.5 *2.5)); //N
      polaAtasanlk2.add(new Node(pg[2].width/25+ 5.5  *2.5   +250, 50+ 81.5 *2.5)); //N
      polaAtasanlk2.add(new Node(pg[2].width/25+ 5.5  *2.5   +250, 50+ 30   *2.5)); //E
      polaAtasanlk2.add(new Node(pg[2].width/25+ 6    *2.5   +250, 50+ 28   *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 9.5  *2.5   +250, 50+ 26   *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 12.5 *2.5   +250, 50+ 21   *2.5)); //I
    }
    if(templateAtasanlk==6){//bukaan depan l
     atasanlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-20, 230,100,0));
     atasanlk1.add(new Node1(pg[3].width/2, 240,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+20, 230,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+25, 220,0,0)); // leher
     atasanlk1.add(new Node1(pg[3].width/2+55, 240,100,0)); //ketiak
     atasanlk1.add(new Node1(pg[3].width/2+45, 285,100,100));
     atasanlk1.add(new Node1(pg[3].width/2+45, 300,0,100));
     atasanlk1.add(new Node1(pg[3].width/2+55, 320,0,0));//ketiak
     atasanlk1.add(new Node1(pg[3].width/2+55, 420,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 420,100,100));
     atasanlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
     atasanlk1.add(new Node1(pg[3].width/2-45, 300,0,0));
     atasanlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
     atasanlk1.add(new Node1(pg[3].width/2-55, 240,100,100));
      
      garisAtasanlk.add(new Node(pg[3].width/2, 240));
      garisAtasanlk.add(new Node(pg[3].width/2, 420));
      
       //POLA DEPAN
      //#Kiri
      polaAtasanlk1.add(new Node(pg[2].width/25+ 10   *2.5, 50+ 3.5  *2.5)); //J
      polaAtasanlk1.add(new Node(pg[2].width/25+ 23   *2.5, 50+ 0    *2.5)); //F
      polaAtasanlk1.add(new Node(pg[2].width/25+ 24.5 *2.5, 50+ 5    *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 27.5 *2.5, 50+ 9    *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 35   *2.5, 50+ 9    *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 35   *2.5, 50+ 81.5 *2.5)); //B
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 50+ 81.5 *2.5)); //N
      polaAtasanlk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 50+ 30   *2.5)); //E
      polaAtasanlk1.add(new Node(pg[2].width/25+ 6    *2.5, 50+ 28   *2.5)); //2
      polaAtasanlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 50+ 26   *2.5)); //1
      polaAtasanlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 50+ 21   *2.5)); //I

      //#Kanan
      polaAtasanlk2.add(new Node(pg[2].width/25+ 25   *2.5 +50, 50+ 9    *2.5)); 
      polaAtasanlk2.add(new Node(pg[2].width/25+ 32.5 *2.5 +50, 50+ 9    *2.5)); //3
      polaAtasanlk2.add(new Node(pg[2].width/25+ 35.5 *2.5 +50, 50+ 5    *2.5)); //4
      polaAtasanlk2.add(new Node(pg[2].width/25+ 37   *2.5 +50, 50+ 0    *2.5)); //F
      polaAtasanlk2.add(new Node(pg[2].width/25+ 50   *2.5 +50, 50+ 3.5  *2.5)); //J
      polaAtasanlk2.add(new Node(pg[2].width/25+ 47.5 *2.5 +50, 50+ 21   *2.5)); //I
      polaAtasanlk2.add(new Node(pg[2].width/25+ 49.5 *2.5 +50, 50+ 26   *2.5)); //1
      polaAtasanlk2.add(new Node(pg[2].width/25+ 52   *2.5 +50, 50+ 28   *2.5)); //2
      polaAtasanlk2.add(new Node(pg[2].width/25+ 54.5 *2.5 +50, 50+ 30   *2.5)); //E
      polaAtasanlk2.add(new Node(pg[2].width/25+ 54.5 *2.5 +50, 50+ 81.5 *2.5)); //N
      polaAtasanlk2.add(new Node(pg[2].width/25+ 25   *2.5 +50, 50+ 81.5 *2.5)); //B
      
      //POLA BELAKANG
      polaAtasanlk3.add(new Node(pg[2].width/25+ 10   *2.5   +250, 50+ 3.5  *2.5)); //J
      polaAtasanlk3.add(new Node(pg[2].width/25+ 23   *2.5   +250, 50+ 0    *2.5)); //F
      polaAtasanlk3.add(new Node(pg[2].width/25+ 24.5 *2.5   +250, 50+ 2    *2.5)); //1
      polaAtasanlk3.add(new Node(pg[2].width/25+ 27.5 *2.5   +250, 50+ 4    *2.5)); //2
      polaAtasanlk3.add(new Node(pg[2].width/25+ 32.5 *2.5   +250, 50+ 4    *2.5)); //3
      polaAtasanlk3.add(new Node(pg[2].width/25+ 35.5 *2.5   +250, 50+ 2    *2.5)); //4
      polaAtasanlk3.add(new Node(pg[2].width/25+ 37   *2.5   +250, 50+ 0    *2.5)); //F
      polaAtasanlk3.add(new Node(pg[2].width/25+ 50   *2.5   +250, 50+ 3.5  *2.5)); //J
      polaAtasanlk3.add(new Node(pg[2].width/25+ 47.5 *2.5   +250, 50+ 21   *2.5)); //I
      polaAtasanlk3.add(new Node(pg[2].width/25+ 49.5 *2.5   +250, 50+ 26   *2.5)); //1
      polaAtasanlk3.add(new Node(pg[2].width/25+ 52   *2.5   +250, 50+ 28   *2.5)); //2
      polaAtasanlk3.add(new Node(pg[2].width/25+ 54.5 *2.5   +250, 50+ 30   *2.5)); //E
      polaAtasanlk3.add(new Node(pg[2].width/25+ 54.5 *2.5   +250, 50+ 81.5 *2.5)); //N
      polaAtasanlk3.add(new Node(pg[2].width/25+ 5.5  *2.5   +250, 50+ 81.5 *2.5)); //N
      polaAtasanlk3.add(new Node(pg[2].width/25+ 5.5  *2.5   +250, 50+ 30   *2.5)); //E
      polaAtasanlk3.add(new Node(pg[2].width/25+ 6    *2.5   +250, 50+ 28   *2.5)); //2
      polaAtasanlk3.add(new Node(pg[2].width/25+ 9.5  *2.5   +250, 50+ 26   *2.5)); //1
      polaAtasanlk3.add(new Node(pg[2].width/25+ 12.5 *2.5   +250, 50+ 21   *2.5)); //I
    }
    newProject = false; 
    base();
    base1();
  }
}

void selectCelanalk() {
  if (templateCelanalk>0) {
    if (!newProject) {
      for (int i = celanalk1.size()-1; i >= 0; i--)
        celanalk1.remove(celanalk1.get(i));
      for (int i = celanalk2.size()-1; i >= 0; i--)
        celanalk2.remove(celanalk2.get(i));
      for (int i = celanalk3.size()-1; i >= 0; i--)
        celanalk3.remove(celanalk3.get(i));  
      for (int i = garisCelanalk.size()-1; i >= 0; i--)
        garisCelanalk.remove(garisCelanalk.get(i));
      for (int i = garisCelanalk2.size()-1; i >= 0; i--)
        garisCelanalk2.remove(garisCelanalk2.get(i));
      for (int i = polaCelanalk1.size()-1; i >= 0; i--)
        polaCelanalk1.remove(polaCelanalk1.get(i));
      for (int i = polaCelanalk2.size()-1; i >= 0; i--)
        polaCelanalk2.remove(polaCelanalk2.get(i));
      for (int i = polaCelanalk3.size()-1; i >= 0; i--)
        polaCelanalk3.remove(polaCelanalk3.get(i));
      for (int i = polaCelanalk4.size()-1; i >= 0; i--)
        polaCelanalk4.remove(polaCelanalk4.get(i));
      for (int i = polaCelanalk5.size()-1; i >= 0; i--)
        polaCelanalk5.remove(polaCelanalk5.get(i));
      for (int i = polaCelanalk6.size()-1; i >= 0; i--)
        polaCelanalk6.remove(polaCelanalk6.get(i));
      for (int i = polaCelanalk7.size()-1; i >= 0; i--)
        polaCelanalk7.remove(polaCelanalk7.get(i));
      for (int i = polaCelanalk8.size()-1; i >= 0; i--)
        polaCelanalk8.remove(polaCelanalk8.get(i));
    }
    newProject = true;
    if (templateCelanalk==1) {//celana pendek s
      celanalk1.add(new Node1(pg[3].width/2-40, 360, 0,100));//0,100
      celanalk1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      celanalk1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      celanalk1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      celanalk2.add(new Node1(pg[3].width/2-40, 370,0,0));
      celanalk2.add(new Node1(pg[3].width/2+40, 370,0,0));
      celanalk2.add(new Node1(pg[3].width/2+50, 400,100,0));
      celanalk2.add(new Node1(pg[3].width/2+52, 550,100,100));
      celanalk2.add(new Node1(pg[3].width/2+5, 550,0,100));
      celanalk2.add(new Node1(pg[3].width/2, 450,50,50));
      celanalk2.add(new Node1(pg[3].width/2-5, 550,0,100));
      celanalk2.add(new Node1(pg[3].width/2-52, 550,100,100));
      celanalk2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
      celanalk3.add(new Node1(pg[3].width/2+40,370,0,0));
      celanalk3.add(new Node1(pg[3].width/2+50,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2+40,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2+30,390,100,100));
      celanalk3.add(new Node1(pg[3].width/2+25,370,0,100));
      celanalk3.add(new Node1(pg[3].width/2+40,370,0,100));
      celanalk3.add(new Node1(pg[3].width/2-40,370,0,0));
      celanalk3.add(new Node1(pg[3].width/2-50,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2-40,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2-30,390,100,100));
      celanalk3.add(new Node1(pg[3].width/2-25,370,0,100));
      celanalk3.add(new Node1(pg[3].width/2-40,370,0,100));
      
      garisCelanalk.add(new Node(pg[3].width/2-4,370));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,370));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      
      //POLA DEPAN
      //kiri
      polaCelanalk1.add(new Node(pg[2].width/25+ 24.5 *2.5, 430+ 6    *2.5)); //K
      polaCelanalk1.add(new Node(pg[2].width/25+ 24.5 *2.5, 430+ 23   *2.5)); //N
      polaCelanalk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 27   *2.5)); //
      polaCelanalk1.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 30   *2.5)); //F
      polaCelanalk1.add(new Node(pg[2].width/25+ 27   *2.5, 430+ 65   *2.5)); //U
      polaCelanalk1.add(new Node(pg[2].width/25+ 3    *2.5, 430+ 65   *2.5)); //T
      polaCelanalk1.add(new Node(pg[2].width/25+ 1.5  *2.5, 430+ 30   *2.5)); //B
      polaCelanalk1.add(new Node(pg[2].width/25+ 2    *2.5, 430+ 23   *2.5)); //O
      polaCelanalk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 430+ 5    *2.5)); //J
      polaCelanalk1.add(new Node(pg[2].width/25+ 10   *2.5, 430+ 5    *2.5)); //1
      polaCelanalk1.add(new Node(pg[2].width/25+ 11.5 *2.5, 430+ 16   *2.5)); //2
      polaCelanalk1.add(new Node(pg[2].width/25+ 13   *2.5, 430+ 5    *2.5)); //3
      polaCelanalk1.add(new Node(pg[2].width/25+ 15   *2.5, 430+ 5.5  *2.5)); //I
      polaCelanalk1.add(new Node(pg[2].width/25+ 17   *2.5, 430+ 6    *2.5)); //4
      polaCelanalk1.add(new Node(pg[2].width/25+ 18.5 *2.5, 430+ 16   *2.5)); //5
      polaCelanalk1.add(new Node(pg[2].width/25+ 20   *2.5, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk2.add(new Node(pg[2].width/25+ 24.5 *2.5, 430+ 6    *2.5)); //K
      polaCelanalk2.add(new Node(pg[2].width/25+ 27.5 *2.5, 430+ 6    *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 27.5 *2.5, 430+ 17   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 26.5 *2.5, 430+ 22   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 24.5 *2.5, 430+ 23   *2.5)); //N

      //kanan
      polaCelanalk3.add(new Node(pg[2].width/25- 24.5 *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk3.add(new Node(pg[2].width/25- 24.5 *2.5 +200, 430+ 23   *2.5)); //N
      polaCelanalk3.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 27   *2.5)); //
      polaCelanalk3.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 30   *2.5)); //F
      polaCelanalk3.add(new Node(pg[2].width/25- 27   *2.5 +200, 430+ 65   *2.5)); //U
      polaCelanalk3.add(new Node(pg[2].width/25- 3    *2.5 +200, 430+ 65   *2.5)); //T
      polaCelanalk3.add(new Node(pg[2].width/25- 1.5  *2.5 +200, 430+ 30   *2.5)); //B
      polaCelanalk3.add(new Node(pg[2].width/25- 2    *2.5 +200, 430+ 23   *2.5)); //O
      polaCelanalk3.add(new Node(pg[2].width/25- 5.5  *2.5 +200, 430+ 5    *2.5)); //J
      polaCelanalk3.add(new Node(pg[2].width/25- 10   *2.5 +200, 430+ 5    *2.5)); //1
      polaCelanalk3.add(new Node(pg[2].width/25- 11.5 *2.5 +200, 430+ 16   *2.5)); //2
      polaCelanalk3.add(new Node(pg[2].width/25- 13   *2.5 +200, 430+ 5    *2.5)); //3
      polaCelanalk3.add(new Node(pg[2].width/25- 15   *2.5 +200, 430+ 5.5  *2.5)); //I
      polaCelanalk3.add(new Node(pg[2].width/25- 17   *2.5 +200, 430+ 6    *2.5)); //4
      polaCelanalk3.add(new Node(pg[2].width/25- 18.5 *2.5 +200, 430+ 16   *2.5)); //5
      polaCelanalk3.add(new Node(pg[2].width/25- 20   *2.5 +200, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk4.add(new Node(pg[2].width/25- 24.5 *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk4.add(new Node(pg[2].width/25- 27.5 *2.5 +200, 430+ 6    *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 27.5 *2.5 +200, 430+ 17   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 26.5 *2.5 +200, 430+ 22   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 24.5 *2.5 +200, 430+ 23   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelanalk5.add(new Node(pg[2].width/25+ 24.5 *2.5 +210, 430+ 3    *2.5)); //K
      polaCelanalk5.add(new Node(pg[2].width/25+ 29.5 *2.5 +210, 430+ 23   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 32.5 *2.5 +210, 430+ 27   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 36.5 *2.5 +210, 430+ 30   *2.5)); //F
      polaCelanalk5.add(new Node(pg[2].width/25+ 31   *2.5 +210, 430+ 65   *2.5)); //U
      polaCelanalk5.add(new Node(pg[2].width/25+ 3    *2.5 +210, 430+ 65   *2.5)); //T
      polaCelanalk5.add(new Node(pg[2].width/25+ 1.5  *2.5 +210, 430+ 30   *2.5)); //B
      polaCelanalk5.add(new Node(pg[2].width/25+ 1.5  *2.5 +210, 430+ 5    *2.5)); //J
      polaCelanalk5.add(new Node(pg[2].width/25+ 13.5 *2.5 +210, 430+ 5    *2.5)); //1
      polaCelanalk5.add(new Node(pg[2].width/25+ 15   *2.5 +210, 430+ 16   *2.5)); //I
      polaCelanalk5.add(new Node(pg[2].width/25+ 16.5 *2.5 +210, 430+ 5    *2.5)); //2

      //kanan
      polaCelanalk6.add(new Node(pg[2].width/25- 24.5 *2.5 +430, 430+ 3    *2.5)); //K
      polaCelanalk6.add(new Node(pg[2].width/25- 29.5 *2.5 +430, 430+ 23   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 32.5 *2.5 +430, 430+ 27   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 36.5 *2.5 +430, 430+ 30   *2.5)); //F
      polaCelanalk6.add(new Node(pg[2].width/25- 31   *2.5 +430, 430+ 65   *2.5)); //U
      polaCelanalk6.add(new Node(pg[2].width/25- 3    *2.5 +430, 430+ 65   *2.5)); //T
      polaCelanalk6.add(new Node(pg[2].width/25- 1.5  *2.5 +430, 430+ 30   *2.5)); //B
      polaCelanalk6.add(new Node(pg[2].width/25- 1.5  *2.5 +430, 430+ 5    *2.5)); //J
      polaCelanalk6.add(new Node(pg[2].width/25- 13.5 *2.5 +430, 430+ 5    *2.5)); //1
      polaCelanalk6.add(new Node(pg[2].width/25- 15   *2.5 +430, 430+ 16   *2.5)); //I
      polaCelanalk6.add(new Node(pg[2].width/25- 16.5 *2.5 +430, 430+ 5    *2.5)); //2
    }
    if (templateCelanalk==2) {//celana panjang s
        celanalk1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
      celanalk1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      celanalk1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      celanalk1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      celanalk2.add(new Node1(pg[3].width/2-40, 370,0,0));
      celanalk2.add(new Node1(pg[3].width/2+40, 370,0,0));
      celanalk2.add(new Node1(pg[3].width/2+50, 400,100,0));
      celanalk2.add(new Node1(pg[3].width/2+52, 700,100,100));
      celanalk2.add(new Node1(pg[3].width/2+10, 700,0,100));
      celanalk2.add(new Node1(pg[3].width/2, 450,50,50));
      celanalk2.add(new Node1(pg[3].width/2-10, 700,0,100));
      celanalk2.add(new Node1(pg[3].width/2-52, 700,100,100));
      celanalk2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
      celanalk3.add(new Node1(pg[3].width/2+40,370,0,0));
      celanalk3.add(new Node1(pg[3].width/2+50,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2+40,400,100,100));
      celanalk3.add(new Node1(pg[3].width/2+30,390,100,100));
      celanalk3.add(new Node1(pg[3].width/2+25,370,0,100));
      celanalk3.add(new Node1(pg[3].width/2+40,370,0,100));
      
      celanalk3.add(new Node1(pg[3].width/2-40,370,0,0));
      celanalk3.add(new Node1(pg[3].width/2-50,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2-40,400,100,100));
      celanalk3.add(new Node1(pg[3].width/2-30,390,100,100));
      celanalk3.add(new Node1(pg[3].width/2-25,370,0,100));
      celanalk3.add(new Node1(pg[3].width/2-40,370,0,100));
      
      garisCelanalk.add(new Node(pg[3].width/2-4,370));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,370));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      
       //POLA DEPAN
      //kiri
      polaCelanalk1.add(new Node(pg[2].width/25+ 24.5 *2.5, 430+ 6    *2.5)); //K
      polaCelanalk1.add(new Node(pg[2].width/25+ 24.5 *2.5, 430+ 23   *2.5)); //N
      polaCelanalk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 27   *2.5)); //
      polaCelanalk1.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 30   *2.5)); //F
      polaCelanalk1.add(new Node(pg[2].width/25+ 27   *2.5, 430+ 65   *2.5)); //U
      polaCelanalk1.add(new Node(pg[2].width/25+ 24.5 *2.5, 430+ 99   *2.5)); //R
      polaCelanalk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 430+ 99   *2.5)); //Q
      polaCelanalk1.add(new Node(pg[2].width/25+ 3    *2.5, 430+ 65   *2.5)); //T
      polaCelanalk1.add(new Node(pg[2].width/25+ 1.5  *2.5, 430+ 30   *2.5)); //B
      polaCelanalk1.add(new Node(pg[2].width/25+ 2    *2.5, 430+ 23   *2.5)); //O
      polaCelanalk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 430+ 5    *2.5)); //J
      polaCelanalk1.add(new Node(pg[2].width/25+ 10   *2.5, 430+ 5    *2.5)); //1
      polaCelanalk1.add(new Node(pg[2].width/25+ 11.5 *2.5, 430+ 16   *2.5)); //2
      polaCelanalk1.add(new Node(pg[2].width/25+ 13   *2.5, 430+ 5    *2.5)); //3
      polaCelanalk1.add(new Node(pg[2].width/25+ 15   *2.5, 430+ 5.5  *2.5)); //I
      polaCelanalk1.add(new Node(pg[2].width/25+ 17   *2.5, 430+ 6    *2.5)); //4
      polaCelanalk1.add(new Node(pg[2].width/25+ 18.5 *2.5, 430+ 16   *2.5)); //5
      polaCelanalk1.add(new Node(pg[2].width/25+ 20   *2.5, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk2.add(new Node(pg[2].width/25+ 24.5 *2.5, 430+ 6    *2.5)); //K
      polaCelanalk2.add(new Node(pg[2].width/25+ 27.5 *2.5, 430+ 6    *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 27.5 *2.5, 430+ 17   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 26.5 *2.5, 430+ 22   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 24.5 *2.5, 430+ 23   *2.5)); //N

      //kanan
      polaCelanalk3.add(new Node(pg[2].width/25- 24.5 *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk3.add(new Node(pg[2].width/25- 24.5 *2.5 +200, 430+ 23   *2.5)); //N
      polaCelanalk3.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 27   *2.5)); //
      polaCelanalk3.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 30   *2.5)); //F
      polaCelanalk3.add(new Node(pg[2].width/25- 27   *2.5 +200, 430+ 65   *2.5)); //U
      polaCelanalk3.add(new Node(pg[2].width/25- 24.5 *2.5 +200, 430+ 99   *2.5)); //R
      polaCelanalk3.add(new Node(pg[2].width/25- 5.5  *2.5 +200, 430+ 99   *2.5)); //Q
      polaCelanalk3.add(new Node(pg[2].width/25- 3    *2.5 +200, 430+ 65   *2.5)); //T
      polaCelanalk3.add(new Node(pg[2].width/25- 1.5  *2.5 +200, 430+ 30   *2.5)); //B
      polaCelanalk3.add(new Node(pg[2].width/25- 2    *2.5 +200, 430+ 23   *2.5)); //O
      polaCelanalk3.add(new Node(pg[2].width/25- 5.5  *2.5 +200, 430+ 5    *2.5)); //J
      polaCelanalk3.add(new Node(pg[2].width/25- 10   *2.5 +200, 430+ 5    *2.5)); //1
      polaCelanalk3.add(new Node(pg[2].width/25- 11.5 *2.5 +200, 430+ 16   *2.5)); //2
      polaCelanalk3.add(new Node(pg[2].width/25- 13   *2.5 +200, 430+ 5    *2.5)); //3
      polaCelanalk3.add(new Node(pg[2].width/25- 15   *2.5 +200, 430+ 5.5  *2.5)); //I
      polaCelanalk3.add(new Node(pg[2].width/25- 17   *2.5 +200, 430+ 6    *2.5)); //4
      polaCelanalk3.add(new Node(pg[2].width/25- 18.5 *2.5 +200, 430+ 16   *2.5)); //5
      polaCelanalk3.add(new Node(pg[2].width/25- 20   *2.5 +200, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk4.add(new Node(pg[2].width/25- 24.5 *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk4.add(new Node(pg[2].width/25- 27.5 *2.5 +200, 430+ 6    *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 27.5 *2.5 +200, 430+ 17   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 26.5 *2.5 +200, 430+ 22   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 24.5 *2.5 +200, 430+ 23   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelanalk5.add(new Node(pg[2].width/25+ 24.5 *2.5 +210, 430+ 3    *2.5)); //K
      polaCelanalk5.add(new Node(pg[2].width/25+ 29.5 *2.5 +210, 430+ 23   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 32.5 *2.5 +210, 430+ 27   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 36.5 *2.5 +210, 430+ 30   *2.5)); //F
      polaCelanalk5.add(new Node(pg[2].width/25+ 31   *2.5 +210, 430+ 65   *2.5)); //U
      polaCelanalk5.add(new Node(pg[2].width/25+ 28.5 *2.5 +210, 430+ 99   *2.5)); //R
      polaCelanalk5.add(new Node(pg[2].width/25+ 5.5  *2.5 +210, 430+ 99   *2.5)); //Q
      polaCelanalk5.add(new Node(pg[2].width/25+ 3    *2.5 +210, 430+ 65   *2.5)); //T
      polaCelanalk5.add(new Node(pg[2].width/25+ 1.5  *2.5 +210, 430+ 30   *2.5)); //B
      polaCelanalk5.add(new Node(pg[2].width/25+ 1.5  *2.5 +210, 430+ 5    *2.5)); //J
      polaCelanalk5.add(new Node(pg[2].width/25+ 13.5 *2.5 +210, 430+ 5    *2.5)); //1
      polaCelanalk5.add(new Node(pg[2].width/25+ 15   *2.5 +210, 430+ 16   *2.5)); //I
      polaCelanalk5.add(new Node(pg[2].width/25+ 16.5 *2.5 +210, 430+ 5    *2.5)); //2

      //kanan
      polaCelanalk6.add(new Node(pg[2].width/25- 24.5 *2.5 +430, 430+ 3    *2.5)); //K
      polaCelanalk6.add(new Node(pg[2].width/25- 29.5 *2.5 +430, 430+ 23   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 32.5 *2.5 +430, 430+ 27   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 36.5 *2.5 +430, 430+ 30   *2.5)); //F
      polaCelanalk6.add(new Node(pg[2].width/25- 31   *2.5 +430, 430+ 65   *2.5)); //U
      polaCelanalk6.add(new Node(pg[2].width/25- 28.5 *2.5 +430, 430+ 99   *2.5)); //R
      polaCelanalk6.add(new Node(pg[2].width/25- 5.5  *2.5 +430, 430+ 99   *2.5)); //Q
      polaCelanalk6.add(new Node(pg[2].width/25- 3    *2.5 +430, 430+ 65   *2.5)); //T
      polaCelanalk6.add(new Node(pg[2].width/25- 1.5  *2.5 +430, 430+ 30   *2.5)); //B
      polaCelanalk6.add(new Node(pg[2].width/25- 1.5  *2.5 +430, 430+ 5    *2.5)); //J
      polaCelanalk6.add(new Node(pg[2].width/25- 13.5 *2.5 +430, 430+ 5    *2.5)); //1
      polaCelanalk6.add(new Node(pg[2].width/25- 15   *2.5 +430, 430+ 16   *2.5)); //I
      polaCelanalk6.add(new Node(pg[2].width/25- 16.5 *2.5 +430, 430+ 5    *2.5)); //2
    }
    if (templateCelanalk==3) { //celana pendek m
     celanalk1.add(new Node1(pg[3].width/2-40, 360, 0,100));//0,100
      celanalk1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
      celanalk1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
      celanalk1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
      celanalk2.add(new Node1(pg[3].width/2-40, 370,0,0));
      celanalk2.add(new Node1(pg[3].width/2+40, 370,0,0));
      celanalk2.add(new Node1(pg[3].width/2+50, 400,100,0));
      celanalk2.add(new Node1(pg[3].width/2+52, 550,100,100));
      celanalk2.add(new Node1(pg[3].width/2+5, 550,0,100));
      celanalk2.add(new Node1(pg[3].width/2, 450,50,50));
      celanalk2.add(new Node1(pg[3].width/2-5, 550,0,100));
      celanalk2.add(new Node1(pg[3].width/2-52, 550,100,100));
      celanalk2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
      celanalk3.add(new Node1(pg[3].width/2+40,370,0,0));
      celanalk3.add(new Node1(pg[3].width/2+50,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2+40,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2+30,390,100,100));
      celanalk3.add(new Node1(pg[3].width/2+25,370,0,100));
      celanalk3.add(new Node1(pg[3].width/2+40,370,0,100));
      
      celanalk3.add(new Node1(pg[3].width/2-40,370,0,0));
      celanalk3.add(new Node1(pg[3].width/2-50,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2-40,400,100,0));
      celanalk3.add(new Node1(pg[3].width/2-30,390,100,100));
      celanalk3.add(new Node1(pg[3].width/2-25,370,0,100));
      celanalk3.add(new Node1(pg[3].width/2-40,370,0,100));
      
      garisCelanalk.add(new Node(pg[3].width/2-4,370));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,370));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      
       //POLA DEPAN
      //kiri
      polaCelanalk1.add(new Node(pg[2].width/25+ 25   *2.5, 430+ 6    *2.5)); //K
      polaCelanalk1.add(new Node(pg[2].width/25+ 25   *2.5, 430+ 27   *2.5)); //N
      polaCelanalk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 29   *2.5)); //
      polaCelanalk1.add(new Node(pg[2].width/25+ 30   *2.5, 430+ 34   *2.5)); //F
      polaCelanalk1.add(new Node(pg[2].width/25+ 27.5 *2.5, 430+ 70   *2.5)); //U
      polaCelanalk1.add(new Node(pg[2].width/25+ 2.5  *2.5, 430+ 70   *2.5)); //T
      polaCelanalk1.add(new Node(pg[2].width/25+ 0.5  *2.5, 430+ 34   *2.5)); //B
      polaCelanalk1.add(new Node(pg[2].width/25+ 1    *2.5, 430+ 27   *2.5)); //O
      polaCelanalk1.add(new Node(pg[2].width/25+ 5    *2.5, 430+ 5    *2.5)); //J
      polaCelanalk1.add(new Node(pg[2].width/25+ 10   *2.5, 430+ 5    *2.5)); //1
      polaCelanalk1.add(new Node(pg[2].width/25+ 11.5 *2.5, 430+ 16   *2.5)); //2
      polaCelanalk1.add(new Node(pg[2].width/25+ 13   *2.5, 430+ 5    *2.5)); //3
      polaCelanalk1.add(new Node(pg[2].width/25+ 15   *2.5, 430+ 5.5  *2.5)); //I
      polaCelanalk1.add(new Node(pg[2].width/25+ 17   *2.5, 430+ 6    *2.5)); //4
      polaCelanalk1.add(new Node(pg[2].width/25+ 18.5 *2.5, 430+ 16   *2.5)); //5
      polaCelanalk1.add(new Node(pg[2].width/25+ 20   *2.5, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk2.add(new Node(pg[2].width/25+ 25   *2.5, 430+ 6    *2.5)); //K
      polaCelanalk2.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 6    *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 18   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 27.5 *2.5, 430+ 24   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 25   *2.5, 430+ 27   *2.5)); //N

      //kanan
      polaCelanalk3.add(new Node(pg[2].width/25- 25   *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk3.add(new Node(pg[2].width/25- 25   *2.5 +200, 430+ 27   *2.5)); //N
      polaCelanalk3.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 29   *2.5)); //
      polaCelanalk3.add(new Node(pg[2].width/25- 30   *2.5 +200, 430+ 34   *2.5)); //F
      polaCelanalk3.add(new Node(pg[2].width/25- 27.5 *2.5 +200, 430+ 70   *2.5)); //U
      polaCelanalk3.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 430+ 70   *2.5)); //T
      polaCelanalk3.add(new Node(pg[2].width/25- 0.5  *2.5 +200, 430+ 34   *2.5)); //B
      polaCelanalk3.add(new Node(pg[2].width/25- 1    *2.5 +200, 430+ 27   *2.5)); //O
      polaCelanalk3.add(new Node(pg[2].width/25- 5    *2.5 +200, 430+ 5    *2.5)); //J
      polaCelanalk3.add(new Node(pg[2].width/25- 10   *2.5 +200, 430+ 5    *2.5)); //1
      polaCelanalk3.add(new Node(pg[2].width/25- 11.5 *2.5 +200, 430+ 16   *2.5)); //2
      polaCelanalk3.add(new Node(pg[2].width/25- 13   *2.5 +200, 430+ 5    *2.5)); //3
      polaCelanalk3.add(new Node(pg[2].width/25- 15   *2.5 +200, 430+ 5.5  *2.5)); //I
      polaCelanalk3.add(new Node(pg[2].width/25- 17   *2.5 +200, 430+ 6    *2.5)); //4
      polaCelanalk3.add(new Node(pg[2].width/25- 18.5 *2.5 +200, 430+ 16   *2.5)); //5
      polaCelanalk3.add(new Node(pg[2].width/25- 20   *2.5 +200, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk4.add(new Node(pg[2].width/25- 25   *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk4.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 6    *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 18   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 27.5 *2.5 +200, 430+ 24   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 25   *2.5 +200, 430+ 27   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelanalk5.add(new Node(pg[2].width/25+ 26   *2.5 +210, 430+ 3    *2.5)); //K
      polaCelanalk5.add(new Node(pg[2].width/25+ 30.5 *2.5 +210, 430+ 24   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 33.5 *2.5 +210, 430+ 29   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 38   *2.5 +210, 430+ 34   *2.5)); //F
      polaCelanalk5.add(new Node(pg[2].width/25+ 31.5 *2.5 +210, 430+ 70   *2.5)); //U
      polaCelanalk5.add(new Node(pg[2].width/25+ 3    *2.5 +210, 430+ 70   *2.5)); //T
      polaCelanalk5.add(new Node(pg[2].width/25+ 0.5  *2.5 +210, 430+ 34   *2.5)); //B
      polaCelanalk5.add(new Node(pg[2].width/25+ 0.5  *2.5 +210, 430+ 5    *2.5)); //J
      polaCelanalk5.add(new Node(pg[2].width/25+ 13.5 *2.5 +210, 430+ 5    *2.5)); //1
      polaCelanalk5.add(new Node(pg[2].width/25+ 15   *2.5 +210, 430+ 16   *2.5)); //I
      polaCelanalk5.add(new Node(pg[2].width/25+ 16.5 *2.5 +210, 430+ 5    *2.5)); //2

      //kanan
      polaCelanalk6.add(new Node(pg[2].width/25- 26   *2.5 +430, 430+ 3    *2.5)); //K
      polaCelanalk6.add(new Node(pg[2].width/25- 30.5 *2.5 +430, 430+ 24   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 33.5 *2.5 +430, 430+ 29   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 38   *2.5 +430, 430+ 34   *2.5)); //F
      polaCelanalk6.add(new Node(pg[2].width/25- 31.5 *2.5 +430, 430+ 70   *2.5)); //U
      polaCelanalk6.add(new Node(pg[2].width/25- 3    *2.5 +430, 430+ 70   *2.5)); //T
      polaCelanalk6.add(new Node(pg[2].width/25- 0.5  *2.5 +430, 430+ 34   *2.5)); //B
      polaCelanalk6.add(new Node(pg[2].width/25- 0.5  *2.5 +430, 430+ 5    *2.5)); //J
      polaCelanalk6.add(new Node(pg[2].width/25- 13.5 *2.5 +430, 430+ 5    *2.5)); //1
      polaCelanalk6.add(new Node(pg[2].width/25- 15   *2.5 +430, 430+ 16   *2.5)); //I
      polaCelanalk6.add(new Node(pg[2].width/25- 16.5 *2.5 +430, 430+ 5    *2.5)); //2
    }
    if (templateCelanalk==4) { //celana panjang m
       celanalk1.add(new Node1(pg[3].width/2-40, 360, 0,100));//0,100
     celanalk1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
     celanalk1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
     celanalk1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
     celanalk2.add(new Node1(pg[3].width/2-40, 370,0,0));
     celanalk2.add(new Node1(pg[3].width/2+40, 370,0,0));
     celanalk2.add(new Node1(pg[3].width/2+50, 400,100,0));
     celanalk2.add(new Node1(pg[3].width/2+52, 700,100,100));
     celanalk2.add(new Node1(pg[3].width/2+10, 700,0,100));
     celanalk2.add(new Node1(pg[3].width/2, 450,50,50));
     celanalk2.add(new Node1(pg[3].width/2-10, 700,0,100));
     celanalk2.add(new Node1(pg[3].width/2-52, 700,100,100));
     celanalk2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
     celanalk3.add(new Node1(pg[3].width/2+40,370,0,0));
     celanalk3.add(new Node1(pg[3].width/2+50,400,100,0));
     celanalk3.add(new Node1(pg[3].width/2+40,400,100,100));
     celanalk3.add(new Node1(pg[3].width/2+30,390,100,100));
     celanalk3.add(new Node1(pg[3].width/2+25,370,0,100));
     celanalk3.add(new Node1(pg[3].width/2+40,370,0,100));
      
     celanalk3.add(new Node1(pg[3].width/2-40,370,0,0));
     celanalk3.add(new Node1(pg[3].width/2-50,400,100,0));
     celanalk3.add(new Node1(pg[3].width/2-40,400,100,100));
     celanalk3.add(new Node1(pg[3].width/2-30,390,100,100));
     celanalk3.add(new Node1(pg[3].width/2-25,370,0,100));
     celanalk3.add(new Node1(pg[3].width/2-40,370,0,100));
      
      garisCelanalk.add(new Node(pg[3].width/2-4,370));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,370));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      
       //POLA DEPAN
      //kiri
      polaCelanalk1.add(new Node(pg[2].width/25+ 25   *2.5, 430+ 6    *2.5)); //K
      polaCelanalk1.add(new Node(pg[2].width/25+ 25   *2.5, 430+ 27   *2.5)); //N
      polaCelanalk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 29   *2.5)); //
      polaCelanalk1.add(new Node(pg[2].width/25+ 30   *2.5, 430+ 34   *2.5)); //F
      polaCelanalk1.add(new Node(pg[2].width/25+ 27.5 *2.5, 430+ 70   *2.5)); //U
      polaCelanalk1.add(new Node(pg[2].width/25+ 26   *2.5, 430+ 103  *2.5)); //R
      polaCelanalk1.add(new Node(pg[2].width/25+ 4    *2.5, 430+ 103  *2.5)); //Q
      polaCelanalk1.add(new Node(pg[2].width/25+ 2.5  *2.5, 430+ 70   *2.5)); //T
      polaCelanalk1.add(new Node(pg[2].width/25+ 0.5  *2.5, 430+ 34   *2.5)); //B
      polaCelanalk1.add(new Node(pg[2].width/25+ 1    *2.5, 430+ 27   *2.5)); //O
      polaCelanalk1.add(new Node(pg[2].width/25+ 5    *2.5, 430+ 5    *2.5)); //J
      polaCelanalk1.add(new Node(pg[2].width/25+ 10   *2.5, 430+ 5    *2.5)); //1
      polaCelanalk1.add(new Node(pg[2].width/25+ 11.5 *2.5, 430+ 16   *2.5)); //2
      polaCelanalk1.add(new Node(pg[2].width/25+ 13   *2.5, 430+ 5    *2.5)); //3
      polaCelanalk1.add(new Node(pg[2].width/25+ 15   *2.5, 430+ 5.5  *2.5)); //I
      polaCelanalk1.add(new Node(pg[2].width/25+ 17   *2.5, 430+ 6    *2.5)); //4
      polaCelanalk1.add(new Node(pg[2].width/25+ 18.5 *2.5, 430+ 16   *2.5)); //5
      polaCelanalk1.add(new Node(pg[2].width/25+ 20   *2.5, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk2.add(new Node(pg[2].width/25+ 25   *2.5, 430+ 6    *2.5)); //K
      polaCelanalk2.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 6    *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 18   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 27.5 *2.5, 430+ 24   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 25   *2.5, 430+ 27   *2.5)); //N

      //kanan
      polaCelanalk3.add(new Node(pg[2].width/25- 25   *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk3.add(new Node(pg[2].width/25- 25   *2.5 +200, 430+ 27   *2.5)); //N
      polaCelanalk3.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 29   *2.5)); //
      polaCelanalk3.add(new Node(pg[2].width/25- 30   *2.5 +200, 430+ 34   *2.5)); //F
      polaCelanalk3.add(new Node(pg[2].width/25- 27.5 *2.5 +200, 430+ 70   *2.5)); //U
      polaCelanalk3.add(new Node(pg[2].width/25- 26   *2.5 +200, 430+ 103  *2.5)); //R
      polaCelanalk3.add(new Node(pg[2].width/25- 4    *2.5 +200, 430+ 103  *2.5)); //Q
      polaCelanalk3.add(new Node(pg[2].width/25- 2.5  *2.5 +200, 430+ 70   *2.5)); //T
      polaCelanalk3.add(new Node(pg[2].width/25- 0.5  *2.5 +200, 430+ 34   *2.5)); //B
      polaCelanalk3.add(new Node(pg[2].width/25- 1    *2.5 +200, 430+ 27   *2.5)); //O
      polaCelanalk3.add(new Node(pg[2].width/25- 5    *2.5 +200, 430+ 5    *2.5)); //J
      polaCelanalk3.add(new Node(pg[2].width/25- 10   *2.5 +200, 430+ 5    *2.5)); //1
      polaCelanalk3.add(new Node(pg[2].width/25- 11.5 *2.5 +200, 430+ 16   *2.5)); //2
      polaCelanalk3.add(new Node(pg[2].width/25- 13   *2.5 +200, 430+ 5    *2.5)); //3
      polaCelanalk3.add(new Node(pg[2].width/25- 15   *2.5 +200, 430+ 5.5  *2.5)); //I
      polaCelanalk3.add(new Node(pg[2].width/25- 17   *2.5 +200, 430+ 6    *2.5)); //4
      polaCelanalk3.add(new Node(pg[2].width/25- 18.5 *2.5 +200, 430+ 16   *2.5)); //5
      polaCelanalk3.add(new Node(pg[2].width/25- 20   *2.5 +200, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk4.add(new Node(pg[2].width/25- 25   *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk4.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 6    *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 18   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 27.5 *2.5 +200, 430+ 24   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 25   *2.5 +200, 430+ 27   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelanalk5.add(new Node(pg[2].width/25+ 26   *2.5 +210, 430+ 3    *2.5)); //K
      polaCelanalk5.add(new Node(pg[2].width/25+ 30.5 *2.5 +210, 430+ 24   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 33.5 *2.5 +210, 430+ 29   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 38   *2.5 +210, 430+ 34   *2.5)); //F
      polaCelanalk5.add(new Node(pg[2].width/25+ 31.5 *2.5 +210, 430+ 70   *2.5)); //U
      polaCelanalk5.add(new Node(pg[2].width/25+ 30   *2.5 +210, 430+ 103  *2.5)); //R
      polaCelanalk5.add(new Node(pg[2].width/25+ 5.5  *2.5 +210, 430+ 103  *2.5)); //Q
      polaCelanalk5.add(new Node(pg[2].width/25+ 3    *2.5 +210, 430+ 70   *2.5)); //T
      polaCelanalk5.add(new Node(pg[2].width/25+ 0.5  *2.5 +210, 430+ 34   *2.5)); //B
      polaCelanalk5.add(new Node(pg[2].width/25+ 0.5  *2.5 +210, 430+ 5    *2.5)); //J
      polaCelanalk5.add(new Node(pg[2].width/25+ 13.5 *2.5 +210, 430+ 5    *2.5)); //1
      polaCelanalk5.add(new Node(pg[2].width/25+ 15   *2.5 +210, 430+ 16   *2.5)); //I
      polaCelanalk5.add(new Node(pg[2].width/25+ 16.5 *2.5 +210, 430+ 5    *2.5)); //2

      //kanan
      polaCelanalk6.add(new Node(pg[2].width/25- 26   *2.5 +430, 430+ 3    *2.5)); //K
      polaCelanalk6.add(new Node(pg[2].width/25- 30.5 *2.5 +430, 430+ 24   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 33.5 *2.5 +430, 430+ 29   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 38   *2.5 +430, 430+ 34   *2.5)); //F
      polaCelanalk6.add(new Node(pg[2].width/25- 31.5 *2.5 +430, 430+ 70   *2.5)); //U
      polaCelanalk6.add(new Node(pg[2].width/25- 30   *2.5 +430, 430+ 103  *2.5)); //R
      polaCelanalk6.add(new Node(pg[2].width/25- 5.5  *2.5 +430, 430+ 103  *2.5)); //Q
      polaCelanalk6.add(new Node(pg[2].width/25- 3    *2.5 +430, 430+ 70   *2.5)); //T
      polaCelanalk6.add(new Node(pg[2].width/25- 0.5  *2.5 +430, 430+ 34   *2.5)); //B
      polaCelanalk6.add(new Node(pg[2].width/25- 0.5  *2.5 +430, 430+ 5    *2.5)); //J
      polaCelanalk6.add(new Node(pg[2].width/25- 13.5 *2.5 +430, 430+ 5    *2.5)); //1
      polaCelanalk6.add(new Node(pg[2].width/25- 15   *2.5 +430, 430+ 16   *2.5)); //I
      polaCelanalk6.add(new Node(pg[2].width/25- 16.5 *2.5 +430, 430+ 5    *2.5)); //2
    }
    if (templateCelanalk==5) {//celana pendek l
    celanalk1.add(new Node1(pg[3].width/2-40, 360, 0,100));//0,100
     celanalk1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
     celanalk1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
     celanalk1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
     celanalk2.add(new Node1(pg[3].width/2-40, 370,0,0));
     celanalk2.add(new Node1(pg[3].width/2+40, 370,0,0));
     celanalk2.add(new Node1(pg[3].width/2+50, 400,100,0));
     celanalk2.add(new Node1(pg[3].width/2+52, 550,100,100));
     celanalk2.add(new Node1(pg[3].width/2+5, 550,0,100));
     celanalk2.add(new Node1(pg[3].width/2, 450,50,50));
     celanalk2.add(new Node1(pg[3].width/2-5, 550,0,100));
     celanalk2.add(new Node1(pg[3].width/2-52, 550,100,100));
     celanalk2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
     celanalk3.add(new Node1(pg[3].width/2+40,370,0,0));
     celanalk3.add(new Node1(pg[3].width/2+50,400,100,0));
     celanalk3.add(new Node1(pg[3].width/2+40,400,100,0));
     celanalk3.add(new Node1(pg[3].width/2+30,390,100,100));
     celanalk3.add(new Node1(pg[3].width/2+25,370,0,100));
     celanalk3.add(new Node1(pg[3].width/2+40,370,0,100));
      
     celanalk3.add(new Node1(pg[3].width/2-40,370,0,0));
     celanalk3.add(new Node1(pg[3].width/2-50,400,100,0));
     celanalk3.add(new Node1(pg[3].width/2-40,400,100,0));
     celanalk3.add(new Node1(pg[3].width/2-30,390,100,100));
     celanalk3.add(new Node1(pg[3].width/2-25,370,0,100));
     celanalk3.add(new Node1(pg[3].width/2-40,370,0,100));
      
      garisCelanalk.add(new Node(pg[3].width/2-4,370));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,370));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      
        //POLA DEPAN
      //kiri
      polaCelanalk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 6    *2.5)); //K
      polaCelanalk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 33   *2.5)); //N
      polaCelanalk1.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 38   *2.5)); //
      polaCelanalk1.add(new Node(pg[2].width/25+ 31.5 *2.5, 430+ 40   *2.5)); //F
      polaCelanalk1.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 80   *2.5)); //U
      polaCelanalk1.add(new Node(pg[2].width/25+ 1.5  *2.5, 430+ 80   *2.5)); //T
      polaCelanalk1.add(new Node(pg[2].width/25+ 0    *2.5, 430+ 32   *2.5)); //B
      polaCelanalk1.add(new Node(pg[2].width/25+ 1    *2.5, 430+ 25   *2.5)); //O
      polaCelanalk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 430+ 5    *2.5)); //J
      polaCelanalk1.add(new Node(pg[2].width/25+ 10   *2.5, 430+ 5    *2.5)); //1
      polaCelanalk1.add(new Node(pg[2].width/25+ 11.5 *2.5, 430+ 16   *2.5)); //2
      polaCelanalk1.add(new Node(pg[2].width/25+ 13   *2.5, 430+ 5    *2.5)); //3
      polaCelanalk1.add(new Node(pg[2].width/25+ 15   *2.5, 430+ 5.5  *2.5)); //I
      polaCelanalk1.add(new Node(pg[2].width/25+ 17   *2.5, 430+ 6    *2.5)); //4
      polaCelanalk1.add(new Node(pg[2].width/25+ 18.5 *2.5, 430+ 16   *2.5)); //5
      polaCelanalk1.add(new Node(pg[2].width/25+ 20   *2.5, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk2.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 6    *2.5)); //K
      polaCelanalk2.add(new Node(pg[2].width/25+ 29.5 *2.5, 430+ 6    *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 29.5 *2.5, 430+ 24   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 29   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 33   *2.5)); //N

      //kanan
      polaCelanalk3.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk3.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 33   *2.5)); //N
      polaCelanalk3.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 38   *2.5)); //
      polaCelanalk3.add(new Node(pg[2].width/25- 31.5 *2.5 +200, 430+ 40   *2.5)); //F
      polaCelanalk3.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 80   *2.5)); //U
      polaCelanalk3.add(new Node(pg[2].width/25- 1.5  *2.5 +200, 430+ 80   *2.5)); //T
      polaCelanalk3.add(new Node(pg[2].width/25- 0    *2.5 +200, 430+ 32   *2.5)); //B
      polaCelanalk3.add(new Node(pg[2].width/25- 1    *2.5 +200, 430+ 25   *2.5)); //O
      polaCelanalk3.add(new Node(pg[2].width/25- 5.5  *2.5 +200, 430+ 5    *2.5)); //J
      polaCelanalk3.add(new Node(pg[2].width/25- 10   *2.5 +200, 430+ 5    *2.5)); //1
      polaCelanalk3.add(new Node(pg[2].width/25- 11.5 *2.5 +200, 430+ 16   *2.5)); //2
      polaCelanalk3.add(new Node(pg[2].width/25- 13   *2.5 +200, 430+ 5    *2.5)); //3
      polaCelanalk3.add(new Node(pg[2].width/25- 15   *2.5 +200, 430+ 5.5  *2.5)); //I
      polaCelanalk3.add(new Node(pg[2].width/25- 17   *2.5 +200, 430+ 6    *2.5)); //4
      polaCelanalk3.add(new Node(pg[2].width/25- 18.5 *2.5 +200, 430+ 16   *2.5)); //5
      polaCelanalk3.add(new Node(pg[2].width/25- 20   *2.5 +200, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk4.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk4.add(new Node(pg[2].width/25- 29.5 *2.5 +200, 430+ 6    *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 29.5 *2.5 +200, 430+ 24   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 29   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 33   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelanalk5.add(new Node(pg[2].width/25+ 26.5 *2.5 +210, 430+ 3    *2.5)); //K
      polaCelanalk5.add(new Node(pg[2].width/25+ 30.5 *2.5 +210, 430+ 29   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 33.5 *2.5 +210, 430+ 35   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 38.5 *2.5 +210, 430+ 40   *2.5)); //F
      polaCelanalk5.add(new Node(pg[2].width/25+ 32.5 *2.5 +210, 430+ 80   *2.5)); //U
      polaCelanalk5.add(new Node(pg[2].width/25+ 3    *2.5 +210, 430+ 80   *2.5)); //T
      polaCelanalk5.add(new Node(pg[2].width/25+ 0    *2.5 +210, 430+ 40   *2.5)); //B
      polaCelanalk5.add(new Node(pg[2].width/25+ 0    *2.5 +210, 430+ 5    *2.5)); //J
      polaCelanalk5.add(new Node(pg[2].width/25+ 13.5 *2.5 +210, 430+ 5    *2.5)); //1
      polaCelanalk5.add(new Node(pg[2].width/25+ 15   *2.5 +210, 430+ 16   *2.5)); //I
      polaCelanalk5.add(new Node(pg[2].width/25+ 16.5 *2.5 +210, 430+ 5    *2.5)); //2

      //kanan
      polaCelanalk6.add(new Node(pg[2].width/25- 26.5 *2.5 +430, 430+ 3    *2.5)); //K
      polaCelanalk6.add(new Node(pg[2].width/25- 30.5 *2.5 +430, 430+ 29   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 33.5 *2.5 +430, 430+ 35   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 38.5 *2.5 +430, 430+ 40   *2.5)); //F
      polaCelanalk6.add(new Node(pg[2].width/25- 32.5 *2.5 +430, 430+ 80   *2.5)); //U
      polaCelanalk6.add(new Node(pg[2].width/25- 3    *2.5 +430, 430+ 80   *2.5)); //T
      polaCelanalk6.add(new Node(pg[2].width/25- 0    *2.5 +430, 430+ 40   *2.5)); //B
      polaCelanalk6.add(new Node(pg[2].width/25- 0    *2.5 +430, 430+ 5    *2.5)); //J
      polaCelanalk6.add(new Node(pg[2].width/25- 13.5 *2.5 +430, 430+ 5    *2.5)); //1
      polaCelanalk6.add(new Node(pg[2].width/25- 15   *2.5 +430, 430+ 16   *2.5)); //I
      polaCelanalk6.add(new Node(pg[2].width/25- 16.5 *2.5 +430, 430+ 5    *2.5)); //2
    }
    if(templateCelanalk==6){//celana panjang l
     celanalk1.add(new Node1(pg[3].width/2-40, 360,0,100));//0,100
     celanalk1.add(new Node1(pg[3].width/2+40, 360,100,0));//100,0
     celanalk1.add(new Node1(pg[3].width/2+40, 370,100,100));//100,100
     celanalk1.add(new Node1(pg[3].width/2-40, 370,0,0));//0,0
      
     celanalk2.add(new Node1(pg[3].width/2-40, 370,0,0));
     celanalk2.add(new Node1(pg[3].width/2+40, 370,0,0));
     celanalk2.add(new Node1(pg[3].width/2+50, 400,100,0));
     celanalk2.add(new Node1(pg[3].width/2+52, 700,100,100));
     celanalk2.add(new Node1(pg[3].width/2+10, 700,0,100));
     celanalk2.add(new Node1(pg[3].width/2, 450,50,50));
     celanalk2.add(new Node1(pg[3].width/2-10, 700,0,100));
     celanalk2.add(new Node1(pg[3].width/2-52, 700,100,100));
     celanalk2.add(new Node1(pg[3].width/2-50, 400,100,0));
      
     celanalk3.add(new Node1(pg[3].width/2+40,370,0,0));
     celanalk3.add(new Node1(pg[3].width/2+50,400,100,0));
     celanalk3.add(new Node1(pg[3].width/2+40,400,100,100));
     celanalk3.add(new Node1(pg[3].width/2+30,390,100,100));
     celanalk3.add(new Node1(pg[3].width/2+25,370,0,100));
     celanalk3.add(new Node1(pg[3].width/2+40,370,0,100));
      
     celanalk3.add(new Node1(pg[3].width/2-40,370,0,0));
     celanalk3.add(new Node1(pg[3].width/2-50,400,100,0));
     celanalk3.add(new Node1(pg[3].width/2-40,400,100,100));
     celanalk3.add(new Node1(pg[3].width/2-30,390,100,100));
     celanalk3.add(new Node1(pg[3].width/2-25,370,0,100));
     celanalk3.add(new Node1(pg[3].width/2-40,370,0,100));
      
      garisCelanalk.add(new Node(pg[3].width/2-4,370));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,370));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      garisCelanalk.add(new Node(pg[3].width/2-4,420));
      garisCelanalk.add(new Node(pg[3].width/2+4,420));
      
        //POLA DEPAN
      //kiri
      polaCelanalk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 6    *2.5)); //K
      polaCelanalk1.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 33   *2.5)); //N
      polaCelanalk1.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 38   *2.5)); //
      polaCelanalk1.add(new Node(pg[2].width/25+ 31.5 *2.5, 430+ 40   *2.5)); //F
      polaCelanalk1.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 80   *2.5)); //U
      polaCelanalk1.add(new Node(pg[2].width/25+ 26.5 *2.5, 430+ 107  *2.5)); //R
      polaCelanalk1.add(new Node(pg[2].width/25+ 3.5  *2.5, 430+ 107  *2.5)); //Q
      polaCelanalk1.add(new Node(pg[2].width/25+ 1.5  *2.5, 430+ 80   *2.5)); //T
      polaCelanalk1.add(new Node(pg[2].width/25+ 0    *2.5, 430+ 32   *2.5)); //B
      polaCelanalk1.add(new Node(pg[2].width/25+ 1    *2.5, 430+ 25   *2.5)); //O
      polaCelanalk1.add(new Node(pg[2].width/25+ 5.5  *2.5, 430+ 5    *2.5)); //J
      polaCelanalk1.add(new Node(pg[2].width/25+ 10   *2.5, 430+ 5    *2.5)); //1
      polaCelanalk1.add(new Node(pg[2].width/25+ 11.5 *2.5, 430+ 16   *2.5)); //2
      polaCelanalk1.add(new Node(pg[2].width/25+ 13   *2.5, 430+ 5    *2.5)); //3
      polaCelanalk1.add(new Node(pg[2].width/25+ 15   *2.5, 430+ 5.5  *2.5)); //I
      polaCelanalk1.add(new Node(pg[2].width/25+ 17   *2.5, 430+ 6    *2.5)); //4
      polaCelanalk1.add(new Node(pg[2].width/25+ 18.5 *2.5, 430+ 16   *2.5)); //5
      polaCelanalk1.add(new Node(pg[2].width/25+ 20   *2.5, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk2.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 6    *2.5)); //K
      polaCelanalk2.add(new Node(pg[2].width/25+ 29.5 *2.5, 430+ 6    *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 29.5 *2.5, 430+ 24   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 28.5 *2.5, 430+ 29   *2.5)); //
      polaCelanalk2.add(new Node(pg[2].width/25+ 25.5 *2.5, 430+ 33   *2.5)); //N

      //kanan
      polaCelanalk3.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk3.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 33   *2.5)); //N
      polaCelanalk3.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 38   *2.5)); //
      polaCelanalk3.add(new Node(pg[2].width/25- 31.5 *2.5 +200, 430+ 40   *2.5)); //F
      polaCelanalk3.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 80   *2.5)); //U
      polaCelanalk3.add(new Node(pg[2].width/25- 26.5 *2.5 +200, 430+ 107  *2.5)); //R
      polaCelanalk3.add(new Node(pg[2].width/25- 3.5  *2.5 +200, 430+ 107  *2.5)); //Q
      polaCelanalk3.add(new Node(pg[2].width/25- 1.5  *2.5 +200, 430+ 80   *2.5)); //T
      polaCelanalk3.add(new Node(pg[2].width/25- 0    *2.5 +200, 430+ 32   *2.5)); //B
      polaCelanalk3.add(new Node(pg[2].width/25- 1    *2.5 +200, 430+ 25   *2.5)); //O
      polaCelanalk3.add(new Node(pg[2].width/25- 5.5  *2.5 +200, 430+ 5    *2.5)); //J
      polaCelanalk3.add(new Node(pg[2].width/25- 10   *2.5 +200, 430+ 5    *2.5)); //1
      polaCelanalk3.add(new Node(pg[2].width/25- 11.5 *2.5 +200, 430+ 16   *2.5)); //2
      polaCelanalk3.add(new Node(pg[2].width/25- 13   *2.5 +200, 430+ 5    *2.5)); //3
      polaCelanalk3.add(new Node(pg[2].width/25- 15   *2.5 +200, 430+ 5.5  *2.5)); //I
      polaCelanalk3.add(new Node(pg[2].width/25- 17   *2.5 +200, 430+ 6    *2.5)); //4
      polaCelanalk3.add(new Node(pg[2].width/25- 18.5 *2.5 +200, 430+ 16   *2.5)); //5
      polaCelanalk3.add(new Node(pg[2].width/25- 20   *2.5 +200, 430+ 6    *2.5)); //6

      //POLA 
      polaCelanalk4.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 6    *2.5)); //K
      polaCelanalk4.add(new Node(pg[2].width/25- 29.5 *2.5 +200, 430+ 6    *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 29.5 *2.5 +200, 430+ 24   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 28.5 *2.5 +200, 430+ 29   *2.5)); //
      polaCelanalk4.add(new Node(pg[2].width/25- 25.5 *2.5 +200, 430+ 33   *2.5)); //N
      
      //POLA BELAKANG
      //kiri
      polaCelanalk5.add(new Node(pg[2].width/25+ 26.5 *2.5 +210, 430+ 3    *2.5)); //K
      polaCelanalk5.add(new Node(pg[2].width/25+ 30.5 *2.5 +210, 430+ 29   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 33.5 *2.5 +210, 430+ 35   *2.5)); //
      polaCelanalk5.add(new Node(pg[2].width/25+ 38.5 *2.5 +210, 430+ 40   *2.5)); //F
      polaCelanalk5.add(new Node(pg[2].width/25+ 32.5 *2.5 +210, 430+ 80   *2.5)); //U
      polaCelanalk5.add(new Node(pg[2].width/25+ 30.5 *2.5 +210, 430+ 107  *2.5)); //R
      polaCelanalk5.add(new Node(pg[2].width/25+ 5.5  *2.5 +210, 430+ 107  *2.5)); //Q
      polaCelanalk5.add(new Node(pg[2].width/25+ 3    *2.5 +210, 430+ 80   *2.5)); //T
      polaCelanalk5.add(new Node(pg[2].width/25+ 0    *2.5 +210, 430+ 40   *2.5)); //B
      polaCelanalk5.add(new Node(pg[2].width/25+ 0    *2.5 +210, 430+ 5    *2.5)); //J
      polaCelanalk5.add(new Node(pg[2].width/25+ 13.5 *2.5 +210, 430+ 5    *2.5)); //1
      polaCelanalk5.add(new Node(pg[2].width/25+ 15   *2.5 +210, 430+ 16   *2.5)); //I
      polaCelanalk5.add(new Node(pg[2].width/25+ 16.5 *2.5 +210, 430+ 5    *2.5)); //2

      //kanan
      polaCelanalk6.add(new Node(pg[2].width/25- 26.5 *2.5 +430, 430+ 3    *2.5)); //K
      polaCelanalk6.add(new Node(pg[2].width/25- 30.5 *2.5 +430, 430+ 29   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 33.5 *2.5 +430, 430+ 35   *2.5)); //
      polaCelanalk6.add(new Node(pg[2].width/25- 38.5 *2.5 +430, 430+ 40   *2.5)); //F
      polaCelanalk6.add(new Node(pg[2].width/25- 32.5 *2.5 +430, 430+ 80   *2.5)); //U
      polaCelanalk6.add(new Node(pg[2].width/25- 30.5 *2.5 +430, 430+ 107  *2.5)); //R
      polaCelanalk6.add(new Node(pg[2].width/25- 5.5  *2.5 +430, 430+ 107  *2.5)); //Q
      polaCelanalk6.add(new Node(pg[2].width/25- 3    *2.5 +430, 430+ 80   *2.5)); //T
      polaCelanalk6.add(new Node(pg[2].width/25- 0    *2.5 +430, 430+ 40   *2.5)); //B
      polaCelanalk6.add(new Node(pg[2].width/25- 0    *2.5 +430, 430+ 5    *2.5)); //J
      polaCelanalk6.add(new Node(pg[2].width/25- 13.5 *2.5 +430, 430+ 5    *2.5)); //1
      polaCelanalk6.add(new Node(pg[2].width/25- 15   *2.5 +430, 430+ 16   *2.5)); //I
      polaCelanalk6.add(new Node(pg[2].width/25- 16.5 *2.5 +430, 430+ 5    *2.5)); //2
    }
    newProject = false; 
    base();
    base1();
  }
}

void selectLeher() {
  if (templateLeher>0) {
    if (!newProject) {
      for (int i = leher1.size()-1; i >= 0; i--)
        leher1.remove(leher1.get(i));
      for (int i = leher2.size()-1; i >= 0; i--)
        leher2.remove(leher2.get(i));
      for (int i = leher3.size()-1; i >= 0; i--)
        leher3.remove(leher3.get(i));  
      for (int i = garisLeher.size()-1; i >= 0; i--)
        garisLeher.remove(garisLeher.get(i));
      for (int i = garisLeher2.size()-1; i >= 0; i--)
        garisLeher2.remove(garisLeher2.get(i));
      for (int i = polaLeher1.size()-1; i >= 0; i--)
        polaLeher1.remove(polaLeher1.get(i));
      for (int i = polaLeher2.size()-1; i >= 0; i--)
        polaLeher2.remove(polaLeher2.get(i));
      for (int i = polaLeher3.size()-1; i >= 0; i--)
        polaLeher3.remove(polaLeher3.get(i));
      for (int i = polaLeher4.size()-1; i >= 0; i--)
        polaLeher4.remove(polaLeher4.get(i));
      for (int i = polaLeher5.size()-1; i >= 0; i--)
        polaLeher5.remove(polaLeher5.get(i));
    }

    newProject = true;
    if (templateLeher==1) { //kerah kemeja s
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+10, 260,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-10, 260,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2, 215,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      
      //Pola Kerah Kemeja Size S
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5 *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 10.5 *2.5, 250+ 5   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 5   *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 33.5 *2.5, 250+ 5   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 39   *2.5, 250+ 4.5 *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 40.5 *2.5, 250+ 3   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 39   *2.5, 250+ 9.5 *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 30.5 *2.5, 250+ 8.5 *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 8.5 *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 13.5 *2.5, 250+ 8.5 *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5 *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3   *2.5)); //F
  
      //POLA KAKI KERAH
      polaLeher2.add(new Node(pg[2].width/20+ 13.5 *2.5, 280+ 5   *2.5)); //E
      polaLeher2.add(new Node(pg[2].width/20+ 22   *2.5, 280+ 5   *2.5)); //A
      polaLeher2.add(new Node(pg[2].width/20+ 30.5 *2.5, 280+ 5   *2.5)); //E
      polaLeher2.add(new Node(pg[2].width/20+ 40.5 *2.5, 280+ 2.5 *2.5)); //I
      polaLeher2.add(new Node(pg[2].width/20+ 43   *2.5, 280+ 4   *2.5)); //G
      polaLeher2.add(new Node(pg[2].width/20+ 41.5 *2.5, 280+ 5   *2.5)); //F
      polaLeher2.add(new Node(pg[2].width/20+ 30.5 *2.5, 280+ 8   *2.5)); //H
      polaLeher2.add(new Node(pg[2].width/20+ 22   *2.5, 280+ 8   *2.5)); //B
      polaLeher2.add(new Node(pg[2].width/20+ 13.5 *2.5, 280+ 8   *2.5)); //H
      polaLeher2.add(new Node(pg[2].width/20+ 5    *2.5, 280+ 5   *2.5)); //F
      polaLeher2.add(new Node(pg[2].width/20+ 3.5  *2.5, 280+ 4   *2.5)); //G
      polaLeher2.add(new Node(pg[2].width/20+ 5.5  *2.5, 280+ 2.5 *2.5)); //I
    
    }
    if (templateLeher==2) {//kerah Sport 
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2, 215,0,0));
      
      leher2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 5    *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 39   *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 40.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 39   *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 34   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 11   *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 10   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    if (templateLeher==3) { //kerah shanghay/tegak
      
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2+18, 213,100,0));
      leher1.add(new Node1(pg[3].width/2+10, 222,100,0));
      leher1.add(new Node1(pg[3].width/2+4, 225,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-4, 225,0,0));
      leher1.add(new Node1(pg[3].width/2-10, 222,0,0));
      leher1.add(new Node1(pg[3].width/2-18, 213,100,100));
      leher1.add(new Node1(pg[3].width/2-25, 220,100,100));
      
      leher2.add(new Node1(pg[3].width/2-18, 213,0,0));
      leher2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2+18, 213,0,0));
      leher2.add(new Node1(pg[3].width/2, 210,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 13.5 *2.5, 250+ 5   *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 5   *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 30.5 *2.5, 250+ 5   *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 40.5 *2.5, 250+ 2.5 *2.5)); //I
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 250+ 4   *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 41.5 *2.5, 250+ 5   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 30.5 *2.5, 250+ 8   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 8   *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 13.5 *2.5, 250+ 8   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 5   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 4   *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 5.5  *2.5, 250+ 2.5 *2.5)); //I
     
    }
     if (templateLeher==4) { //kerah shiller
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2, 215,0,0));
     
      leher2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 5    *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 39   *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 40.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 39   *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 34   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 9.5  *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 10   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    if(templateLeher==5){// kerah board terusan
     leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+35, 250,0,0));
      leher1.add(new Node1(pg[3].width/2+18, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 249,0,0));
      leher1.add(new Node1(pg[3].width/2, 260,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 249,0,0));
      leher1.add(new Node1(pg[3].width/2-18, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-35, 250,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      
      leher2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2, 215,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 5    *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 39   *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 3.5  *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 39   *2.5, 250+ 9    *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 40   *2.5, 250+ 10   *2.5)); //I
      polaLeher1.add(new Node(pg[2].width/20+ 41.5 *2.5, 250+ 10   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 35.5 *2.5, 250+ 10.5 *2.5)); //L
      polaLeher1.add(new Node(pg[2].width/20+ 22   *2.5, 250+ 10.5 *2.5)); //J
      polaLeher1.add(new Node(pg[2].width/20+ 7.5  *2.5, 250+ 10.5 *2.5)); //L
      polaLeher1.add(new Node(pg[2].width/20+ 2.5  *2.5, 250+ 10   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 4    *2.5, 250+ 10   *2.5)); //I
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9    *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 0    *2.5, 250+ 3.5  *2.5)); //G
    }
    if(templateLeher==7){ //kerah kemeja m
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+10, 260,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-10, 260,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2, 215,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 300+ 4.5 *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 11   *2.5, 300+ 5   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 300+ 5   *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 35   *2.5, 300+ 5   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 41   *2.5, 300+ 4.5 *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 42.5 *2.5, 300+ 3   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 41   *2.5, 300+ 9.5 *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 32   *2.5, 300+ 8.5 *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 300+ 8.5 *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 14   *2.5, 300+ 8.5 *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 300+ 9.5 *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 300+ 3   *2.5)); //F

      //POLA KAKI KERAH
      polaLeher2.add(new Node(pg[2].width/20+ 14   *2.5, 350+ 5   *2.5)); //E
      polaLeher2.add(new Node(pg[2].width/20+ 23   *2.5, 350+ 5   *2.5)); //A
      polaLeher2.add(new Node(pg[2].width/20+ 32   *2.5, 350+ 5   *2.5)); //E
      polaLeher2.add(new Node(pg[2].width/20+ 42.5 *2.5, 350+ 2.5 *2.5)); //I
      polaLeher2.add(new Node(pg[2].width/20+ 44   *2.5, 350+ 4   *2.5)); //G
      polaLeher2.add(new Node(pg[2].width/20+ 43.5 *2.5, 350+ 5   *2.5)); //F
      polaLeher2.add(new Node(pg[2].width/20+ 32   *2.5, 350+ 8   *2.5)); //H
      polaLeher2.add(new Node(pg[2].width/20+ 23   *2.5, 350+ 8   *2.5)); //B
      polaLeher2.add(new Node(pg[2].width/20+ 14   *2.5, 350+ 8   *2.5)); //H
      polaLeher2.add(new Node(pg[2].width/20+ 5    *2.5, 350+ 5   *2.5)); //F
      polaLeher2.add(new Node(pg[2].width/20+ 3.5  *2.5, 350+ 4   *2.5)); //G
      polaLeher2.add(new Node(pg[2].width/20+ 5.5  *2.5, 350+ 2.5 *2.5)); //I
    }
    if(templateLeher==8){//sport m
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2, 215,0,0));
      
      leher2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      
       polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 250+ 5    *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 41   *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 42.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 41   *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 35   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 250+ 11   *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 11   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    if(templateLeher==9){// shanghay m
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2+18, 213,100,0));
      leher1.add(new Node1(pg[3].width/2+10, 222,100,0));
      leher1.add(new Node1(pg[3].width/2+4, 225,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-4, 225,0,0));
      leher1.add(new Node1(pg[3].width/2-10, 222,0,0));
      leher1.add(new Node1(pg[3].width/2-18, 213,100,100));
      leher1.add(new Node1(pg[3].width/2-25, 220,100,100));
      
      leher2.add(new Node1(pg[3].width/2-18, 213,0,0));
      leher2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2+18, 213,0,0));
      leher2.add(new Node1(pg[3].width/2, 210,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 14   *2.5, 250+ 5   *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 250+ 5   *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 32   *2.5, 250+ 5   *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 42.5 *2.5, 250+ 2.5 *2.5)); //I
      polaLeher1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 4   *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 43.5 *2.5, 250+ 5   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 32   *2.5, 250+ 8   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 250+ 8   *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 14   *2.5, 250+ 8   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 5   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 4   *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 5.5  *2.5, 250+ 2.5 *2.5)); //I
    }
    if(templateLeher==10){// shiller m
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2, 215,0,0));
     
      leher2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 250+ 5    *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 41   *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 42.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 41   *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 35   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 250+ 9.5  *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 11   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    if(templateLeher==11){ //kemeja board terusan m
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+35, 250,0,0));
      leher1.add(new Node1(pg[3].width/2+18, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 249,0,0));
      leher1.add(new Node1(pg[3].width/2, 260,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 249,0,0));
      leher1.add(new Node1(pg[3].width/2-18, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-35, 250,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      
      leher2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2, 215,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 250+ 5    *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 41   *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 46   *2.5, 250+ 3.5  *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 41   *2.5, 250+ 9    *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 42   *2.5, 250+ 10   *2.5)); //I
      polaLeher1.add(new Node(pg[2].width/20+ 43.5 *2.5, 250+ 10   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 37.5 *2.5, 250+ 10.5 *2.5)); //L  
      polaLeher1.add(new Node(pg[2].width/20+ 23   *2.5, 250+ 10.5 *2.5)); //J
      polaLeher1.add(new Node(pg[2].width/20+ 8.5  *2.5, 250+ 10.5 *2.5)); //L
      polaLeher1.add(new Node(pg[2].width/20+ 2.5  *2.5, 250+ 10   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 4    *2.5, 250+ 10   *2.5)); //I
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9    *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 0    *2.5, 250+ 3.5  *2.5)); //G
    }
    if(templateLeher==13){ //kemeja l 
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+10, 260,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-10, 260,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2, 215,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 300+ 4.5 *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 11.5 *2.5, 300+ 5   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 300+ 5   *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 36.5 *2.5, 300+ 5   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 300+ 4.5 *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 44.5 *2.5, 300+ 3   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 300+ 9.5 *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 33.5 *2.5, 300+ 8.5 *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 300+ 8.5 *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 15   *2.5, 300+ 8.5 *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 300+ 9.5 *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 300+ 3   *2.5)); //F

      //POLA KAKI KERAH
      polaLeher2.add(new Node(pg[2].width/20+ 14.5 *2.5, 350+ 5   *2.5)); //E
      polaLeher2.add(new Node(pg[2].width/20+ 24   *2.5, 350+ 5   *2.5)); //A
      polaLeher2.add(new Node(pg[2].width/20+ 33.5 *2.5, 350+ 5   *2.5)); //E
      polaLeher2.add(new Node(pg[2].width/20+ 43   *2.5, 350+ 2.5 *2.5)); //I
      polaLeher2.add(new Node(pg[2].width/20+ 45.5 *2.5, 350+ 4   *2.5)); //G
      polaLeher2.add(new Node(pg[2].width/20+ 44.5 *2.5, 350+ 5   *2.5)); //F
      polaLeher2.add(new Node(pg[2].width/20+ 33.5 *2.5, 350+ 8   *2.5)); //H
      polaLeher2.add(new Node(pg[2].width/20+ 24   *2.5, 350+ 8   *2.5)); //B
      polaLeher2.add(new Node(pg[2].width/20+ 14.5 *2.5, 350+ 8   *2.5)); //H
      polaLeher2.add(new Node(pg[2].width/20+ 5    *2.5, 350+ 5   *2.5)); //F
      polaLeher2.add(new Node(pg[2].width/20+ 3.5  *2.5, 350+ 4   *2.5)); //G
      polaLeher2.add(new Node(pg[2].width/20+ 5.5  *2.5, 350+ 2.5 *2.5)); //I
    }
    if(templateLeher==14){//sport l
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2, 215,0,0));
      
      leher2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 250+ 5    *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 44.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 36   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 250+ 11   *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 12   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    if(templateLeher==15){//shanghay l
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2+18, 213,100,0));
      leher1.add(new Node1(pg[3].width/2+10, 222,100,0));
      leher1.add(new Node1(pg[3].width/2+4, 225,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-4, 225,0,0));
      leher1.add(new Node1(pg[3].width/2-10, 222,0,0));
      leher1.add(new Node1(pg[3].width/2-18, 213,100,100));
      leher1.add(new Node1(pg[3].width/2-25, 220,100,100));
      
      leher2.add(new Node1(pg[3].width/2-18, 213,0,0));
      leher2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2+18, 213,0,0));
      leher2.add(new Node1(pg[3].width/2, 210,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 14.5 *2.5, 250+ 5   *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 250+ 5   *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 33.5 *2.5, 250+ 5   *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 250+ 2.5 *2.5)); //I
      polaLeher1.add(new Node(pg[2].width/20+ 45.5 *2.5, 250+ 4   *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 44.5 *2.5, 250+ 5   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 33.5 *2.5, 250+ 8   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 250+ 8   *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 14.5 *2.5, 250+ 8   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 5   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 4   *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 5.5  *2.5, 250+ 2.5 *2.5)); //I
    }
    if(templateLeher==16){//shiller l
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2, 215,0,0));
     
      leher2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 250+ 5    *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 44.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 36   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 250+ 9.5  *2.5)); //B
      polaLeher1.add(new Node(pg[2].width/20+ 12   *2.5, 250+ 11   *2.5)); //F
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    if(templateLeher==17){//kemeja board terusan l
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2+35, 250,0,0));
      leher1.add(new Node1(pg[3].width/2+18, 240,0,0));
      leher1.add(new Node1(pg[3].width/2+20, 249,0,0));
      leher1.add(new Node1(pg[3].width/2, 260,0,0));
      leher1.add(new Node1(pg[3].width/2-20, 249,0,0));
      leher1.add(new Node1(pg[3].width/2-18, 240,0,0));
      leher1.add(new Node1(pg[3].width/2-35, 250,0,0));
      leher1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leher1.add(new Node1(pg[3].width/2-25, 220,0,0));
      
      leher2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2, 240,0,0));
      leher2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leher2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leher2.add(new Node1(pg[3].width/2, 215,0,0));
      
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 250+ 5    *2.5)); //A
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 250+ 4.5  *2.5)); //C
      polaLeher1.add(new Node(pg[2].width/20+ 48   *2.5, 250+ 3.5  *2.5)); //G
      polaLeher1.add(new Node(pg[2].width/20+ 43   *2.5, 250+ 9    *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 10   *2.5)); //I
      polaLeher1.add(new Node(pg[2].width/20+ 45.5 *2.5, 250+ 10   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 38.5 *2.5, 250+ 10.5 *2.5)); //L  
      polaLeher1.add(new Node(pg[2].width/20+ 24   *2.5, 250+ 10.5 *2.5)); //J
      polaLeher1.add(new Node(pg[2].width/20+ 9.5  *2.5, 250+ 10.5 *2.5)); //L
      polaLeher1.add(new Node(pg[2].width/20+ 2.5  *2.5, 250+ 10   *2.5)); //H
      polaLeher1.add(new Node(pg[2].width/20+ 4    *2.5, 250+ 10   *2.5)); //I
      polaLeher1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9    *2.5)); //E
      polaLeher1.add(new Node(pg[2].width/20+ 0    *2.5, 250+ 3.5  *2.5)); //G
    }
    
    newProject = false; 
    base();
    base1();
  }
}

void selectLengan() {
  if (templateLengan>0) {
    if (!newProject) {
      for (int i = lengan1.size()-1; i >= 0; i--)
        lengan1.remove(lengan1.get(i));
      for (int i = lengan2.size()-1; i >= 0; i--)
        lengan2.remove(lengan2.get(i));
      for (int i = lengan3.size()-1; i >= 0; i--)
        lengan3.remove(lengan3.get(i));   
      for (int i = lengan4.size()-1; i >= 0; i--)
        lengan4.remove(lengan4.get(i));    
      for (int i = garisLengan.size()-1; i >= 0; i--)
        garisLengan.remove(garisLengan.get(i));
      for (int i = garisLengan2.size()-1; i >= 0; i--)
        garisLengan2.remove(garisLengan2.get(i));
      for (int i = polaLengan1.size()-1; i >= 0; i--)
        polaLengan1.remove(polaLengan1.get(i));
      for (int i = polaLengan2.size()-1; i >= 0; i--)
        polaLengan2.remove(polaLengan2.get(i));
      for (int i = polaLengan3.size()-1; i >= 0; i--)
        polaLengan3.remove(polaLengan3.get(i));
      for (int i = polaLengan4.size()-1; i >= 0; i--)
        polaLengan4.remove(polaLengan4.get(i));
      for (int i = polaLengan5.size()-1; i >= 0; i--)
        polaLengan5.remove(polaLengan5.get(i));
    }

    newProject = true;
    if (templateLengan==1) {//lengan gelembung pendek s
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 290,0,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-80, 290,100,100));
      lengan1.add(new Node1(pg[3].width/2-83, 290,100,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,100));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan3.add(new Node1(pg[3].width/2-45, 300,0,0));
      lengan3.add(new Node1(pg[3].width/2-45, 310,0,0));
      lengan3.add(new Node1(pg[3].width/2-80, 300,100,0));
      lengan3.add(new Node1(pg[3].width/2-80, 290,100,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 290,0,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+80, 290,100,100));
      lengan2.add(new Node1(pg[3].width/2+83, 290,100,100));
      lengan2.add(new Node1(pg[3].width/2+84, 270,0,100));
      lengan2.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      lengan4.add(new Node1(pg[3].width/2+45, 300,0,0));
      lengan4.add(new Node1(pg[3].width/2+45, 310,0,0));
      lengan4.add(new Node1(pg[3].width/2+80, 300,100,0));
      lengan4.add(new Node1(pg[3].width/2+80, 290,100,0));
      
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 29   *2.5, 320+ 5    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 32   *2.5, 320+ 28   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 29   *2.5, 320+ 51   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 56   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 28   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 29   *2.5 +200, 320+ 5    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 32   *2.5 +200, 320+ 28   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 29   *2.5 +200, 320+ 51   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 56   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 28   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3

      //POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 32   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 32   *2.5)); //D
    }
    if(templateLengan==2){ //Lengan gelembung panjang s
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-89, 420,100,100));
      lengan1.add(new Node1(pg[3].width/2-83, 290,0,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,0));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lengan2.add(new Node1(pg[3].width/2-67, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2-67, 430,100,0));
      lengan2.add(new Node1(pg[3].width/2-87, 430,100,100));
      lengan2.add(new Node1(pg[3].width/2-87, 420,100,0));
      
      lengan3.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan3.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan3.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan3.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan3.add(new Node1(pg[3].width/2+89, 420,100,100));
      lengan3.add(new Node1(pg[3].width/2+83, 290,0,100));
      lengan3.add(new Node1(pg[3].width/2+84, 270,0,0));
      lengan3.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan3.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      lengan4.add(new Node1(pg[3].width/2+67, 420,100,0));
      lengan4.add(new Node1(pg[3].width/2+67, 430,100,0));
      lengan4.add(new Node1(pg[3].width/2+87, 430,100,100));
      lengan4.add(new Node1(pg[3].width/2+87, 420,100,0));
    
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 55   *2.5, 320+ 5    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 28   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 55   *2.5, 320+ 51   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 56   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 28   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 55   *2.5 +200, 320+ 5    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 28   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 55   *2.5 +200, 320+ 51   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 56   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 28   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3

      //POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 17   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 17   *2.5)); //D
    }
    if(templateLengan==3){//lengan gelembung atas pendek s
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lengan1.add(new Node1(pg[3].width/2-80, 300,100,0));
      lengan1.add(new Node1(pg[3].width/2-83, 290,100,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,100));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lengan2.add(new Node1(pg[3].width/2+80, 300,100,0));
      lengan2.add(new Node1(pg[3].width/2+83, 290,100,100));
      lengan2.add(new Node1(pg[3].width/2+84, 270,0,100));
      lengan2.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
     polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 31   *2.5, 320+ 3    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 34   *2.5, 320+ 26   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 31   *2.5, 320+ 49   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 52   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 26   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 31   *2.5 +200, 320+ 3    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 34   *2.5 +200, 320+ 26   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 31   *2.5 +200, 320+ 49   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 52   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 26   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3

      //POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 34   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 34   *2.5)); //D
    }
    if (templateLengan==4) { //lengan gelembung atas panjang s
       lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-89, 420,100,100));
      lengan1.add(new Node1(pg[3].width/2-83, 290,0,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,0));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2+89, 420,100,100));
      lengan2.add(new Node1(pg[3].width/2+83, 290,0,100));
      lengan2.add(new Node1(pg[3].width/2+84, 270,0,0));
      lengan2.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 55   *2.5, 320+ 10.5 *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 25   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 55   *2.5, 320+ 39.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 50   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 43   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 36   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 29   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 25   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 21   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 14   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 7    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 55   *2.5 +200, 320+ 10.5 *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 25   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 55   *2.5 +200, 320+ 39.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 50   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 43   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 36   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 29   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 25   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 21   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 14   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 7    *2.5)); //3

      //POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 17   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 17   *2.5)); //D
    }
    if (templateLengan==5) {//lengan licin pendek
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,0));
      lengan1.add(new Node1(pg[3].width/2-45, 300,100,100));
      lengan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      lengan1.add(new Node1(pg[3].width/2-80, 300,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lengan2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 26   *2.5, 320+ 3    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 26   *2.5, 320+ 35   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 38   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 19   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 26   *2.5 +200, 320+ 3    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 26   *2.5 +200, 320+ 35   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 38   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 19   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if (templateLengan==6) {//lengan licin panjang
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lengan1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-90, 420,100,100));
      lengan1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lengan2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 52   *2.5, 320+ 10.5 *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 52   *2.5, 320+ 27.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 38   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 19   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 52   *2.5 +200, 320+ 10.5 *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 52   *2.5 +200, 320+ 27.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 38   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 19   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if (templateLengan==7) {//lengan gladde pendek
      lengan1.add(new Node1(pg[3].width/2-45, 285,0,0));
      lengan1.add(new Node1(pg[3].width/2-45, 300,100,0));
      lengan1.add(new Node1(pg[3].width/2-55, 320,100,100));
      lengan1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lengan2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,100,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      garisLengan.add(new Node(pg[3].width/2+53,315));
      garisLengan.add(new Node(pg[3].width/2+78,295));
      garisLengan2.add(new Node(pg[3].width/2-53,315));
      garisLengan2.add(new Node(pg[3].width/2-78,295));
      
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 26   *2.5, 320+ 3    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 35   *2.5, 320+ 3    *2.5)); //P
      polaLengan1.add(new Node(pg[2].width/20+ 35   *2.5, 320+ 35   *2.5)); //Q
      polaLengan1.add(new Node(pg[2].width/20+ 26   *2.5, 320+ 35   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 38   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 19   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 26   *2.5 +200, 320+ 3    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 35   *2.5 +200, 320+ 3    *2.5)); //P
      polaLengan2.add(new Node(pg[2].width/20+ 35   *2.5 +200, 320+ 35   *2.5)); //Q
      polaLengan2.add(new Node(pg[2].width/20+ 26   *2.5 +200, 320+ 35   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 38   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 19   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if(templateLengan==8){ //lengan gladde panjang
      lengan1.add(new Node1(pg[3].width/2-45, 285,0,0));
      lengan1.add(new Node1(pg[3].width/2-45, 300,100,0));
      lengan1.add(new Node1(pg[3].width/2-55, 320,100,100));
      lengan1.add(new Node1(pg[3].width/2-65, 420,0,100));
      lengan1.add(new Node1(pg[3].width/2-90, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-80, 300,100,100));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lengan2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      garisLengan.add(new Node(pg[3].width/2+65,415));
      garisLengan.add(new Node(pg[3].width/2+90,415));
      garisLengan2.add(new Node(pg[3].width/2-65,415));
      garisLengan2.add(new Node(pg[3].width/2-90,415));
      
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 52   *2.5, 320+ 10.5 *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 61   *2.5, 320+ 10.5 *2.5)); //P
      polaLengan1.add(new Node(pg[2].width/20+ 61   *2.5, 320+ 27.5 *2.5)); //Q
      polaLengan1.add(new Node(pg[2].width/20+ 52   *2.5, 320+ 27.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 38   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 19   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 52   *2.5 +200, 320+ 10.5 *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 61   *2.5 +200, 320+ 10.5 *2.5)); //P
      polaLengan2.add(new Node(pg[2].width/20+ 61   *2.5 +200, 320+ 27.5 *2.5)); //Q
      polaLengan2.add(new Node(pg[2].width/20+ 52   *2.5 +200, 320+ 27.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 38   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 19   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if(templateLengan==9){//lengan gelembung pendek m
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 290,0,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-80, 290,100,100));
      lengan1.add(new Node1(pg[3].width/2-83, 290,100,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,100));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan3.add(new Node1(pg[3].width/2-45, 300,0,0));
      lengan3.add(new Node1(pg[3].width/2-45, 310,0,0));
      lengan3.add(new Node1(pg[3].width/2-80, 300,100,0));
      lengan3.add(new Node1(pg[3].width/2-80, 290,100,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 290,0,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+80, 290,100,100));
      lengan2.add(new Node1(pg[3].width/2+83, 290,100,100));
      lengan2.add(new Node1(pg[3].width/2+84, 270,0,100));
      lengan2.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      lengan4.add(new Node1(pg[3].width/2+45, 300,0,0));
      lengan4.add(new Node1(pg[3].width/2+45, 310,0,0));
      lengan4.add(new Node1(pg[3].width/2+80, 300,100,0));
      lengan4.add(new Node1(pg[3].width/2+80, 290,100,0));
    
    polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 31   *2.5, 320+ 5    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 34   *2.5, 320+ 29   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 31   *2.5, 320+ 53   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 58   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 29   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3

      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 31   *2.5 +200, 320+ 5    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 34   *2.5 +200, 320+ 29   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 31   *2.5 +200, 320+ 53   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 58   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 29   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3
      
      //POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 34   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 34   *2.5)); //D
    }
    if(templateLengan==10){//lengan gelembung panjang m
     lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-89, 420,100,100));
      lengan1.add(new Node1(pg[3].width/2-83, 290,0,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,0));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lengan2.add(new Node1(pg[3].width/2-67, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2-67, 430,100,0));
      lengan2.add(new Node1(pg[3].width/2-87, 430,100,100));
      lengan2.add(new Node1(pg[3].width/2-87, 420,100,0));
      
      lengan3.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan3.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan3.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan3.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan3.add(new Node1(pg[3].width/2+89, 420,100,100));
      lengan3.add(new Node1(pg[3].width/2+83, 290,0,100));
      lengan3.add(new Node1(pg[3].width/2+84, 270,0,0));
      lengan3.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan3.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      lengan4.add(new Node1(pg[3].width/2+67, 420,100,0));
      lengan4.add(new Node1(pg[3].width/2+67, 430,100,0));
      lengan4.add(new Node1(pg[3].width/2+87, 430,100,100));
      lengan4.add(new Node1(pg[3].width/2+87, 420,100,0));
    
     polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 5    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 61   *2.5, 320+ 29   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 53   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 58   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 29   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3

      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 5    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 61   *2.5 +200, 320+ 29   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 53   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 58   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 29   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3
      
      //POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 19   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 19   *2.5)); //D
    }
    if(templateLengan==11){//lengan gelembung atas pendek m
    lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lengan1.add(new Node1(pg[3].width/2-80, 300,100,0));
      lengan1.add(new Node1(pg[3].width/2-83, 290,100,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,100));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lengan2.add(new Node1(pg[3].width/2+80, 300,100,0));
      lengan2.add(new Node1(pg[3].width/2+83, 290,100,100));
      lengan2.add(new Node1(pg[3].width/2+84, 270,0,100));
      lengan2.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
    
    polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 31   *2.5, 320+ 3    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 34   *2.5, 320+ 26   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 31   *2.5, 320+ 49   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 52   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 26   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 31   *2.5 +200, 320+ 3    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 34   *2.5 +200, 320+ 26   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 31   *2.5 +200, 320+ 49   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 52   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 26   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3

//POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 34   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 34   *2.5)); //D
    }
    if(templateLengan==12){//lengan gelembung atas panjang m
       lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-89, 420,100,100));
      lengan1.add(new Node1(pg[3].width/2-83, 290,0,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,0));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2+89, 420,100,100));
      lengan2.add(new Node1(pg[3].width/2+83, 290,0,100));
      lengan2.add(new Node1(pg[3].width/2+84, 270,0,0));
      lengan2.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 10.5 *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 61   *2.5, 320+ 26   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 41.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 52   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 26   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 6    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 10.5 *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 61   *2.5 +200, 320+ 26   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 41.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 52   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 26   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 6    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3

//POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 19   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 19   *2.5)); //D
    
    }
    if(templateLengan==13){//lengan licin m
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,0));
      lengan1.add(new Node1(pg[3].width/2-45, 300,100,100));
      lengan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      lengan1.add(new Node1(pg[3].width/2-80, 300,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lengan2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
       polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 28   *2.5, 320+ 3    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 28   *2.5, 320+ 37   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 40   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 28   *2.5 +200, 320+ 3    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 28   *2.5 +200, 320+ 37   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 40   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 20   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if(templateLengan==14){//lengan licin panjang m
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lengan1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-90, 420,100,100));
      lengan1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lengan2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 55   *2.5, 320+ 10.5 *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 55   *2.5, 320+ 29.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 40   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 55   *2.5 +200, 320+ 10.5 *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 55   *2.5 +200, 320+ 29.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 40   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 20   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if(templateLengan==15){//lengan gladde pendek m
    lengan1.add(new Node1(pg[3].width/2-45, 285,0,0));
      lengan1.add(new Node1(pg[3].width/2-45, 300,100,0));
      lengan1.add(new Node1(pg[3].width/2-55, 320,100,100));
      lengan1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lengan2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,100,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      garisLengan.add(new Node(pg[3].width/2+53,315));
      garisLengan.add(new Node(pg[3].width/2+78,295));
      garisLengan2.add(new Node(pg[3].width/2-53,315));
      garisLengan2.add(new Node(pg[3].width/2-78,295));
    
    polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 28   *2.5, 320+ 3    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 37   *2.5, 320+ 3    *2.5)); //P
      polaLengan1.add(new Node(pg[2].width/20+ 37   *2.5, 320+ 37   *2.5)); //Q
      polaLengan1.add(new Node(pg[2].width/20+ 28   *2.5, 320+ 37   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 40   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 28   *2.5 +200, 320+ 3    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 37   *2.5 +200, 320+ 3    *2.5)); //P
      polaLengan2.add(new Node(pg[2].width/20+ 37   *2.5 +200, 320+ 37   *2.5)); //Q
      polaLengan2.add(new Node(pg[2].width/20+ 28   *2.5 +200, 320+ 37   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 40   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 20   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if(templateLengan==16){//lengan gladde panjang m
      lengan1.add(new Node1(pg[3].width/2-45, 285,0,0));
      lengan1.add(new Node1(pg[3].width/2-45, 300,100,0));
      lengan1.add(new Node1(pg[3].width/2-55, 320,100,100));
      lengan1.add(new Node1(pg[3].width/2-65, 420,0,100));
      lengan1.add(new Node1(pg[3].width/2-90, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-80, 300,100,100));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lengan2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      garisLengan.add(new Node(pg[3].width/2+65,415));
      garisLengan.add(new Node(pg[3].width/2+90,415));
      garisLengan2.add(new Node(pg[3].width/2-65,415));
      garisLengan2.add(new Node(pg[3].width/2-90,415));
    
     polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 55   *2.5, 320+ 10.5 *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 64   *2.5, 320+ 10.5 *2.5)); //P
      polaLengan1.add(new Node(pg[2].width/20+ 64   *2.5, 320+ 29.5 *2.5)); //Q
      polaLengan1.add(new Node(pg[2].width/20+ 55   *2.5, 320+ 29.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 40   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 55   *2.5 +200, 320+ 10.5 *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 64   *2.5 +200, 320+ 10.5 *2.5)); //P
      polaLengan2.add(new Node(pg[2].width/20+ 64   *2.5 +200, 320+ 29.5 *2.5)); //Q
      polaLengan2.add(new Node(pg[2].width/20+ 55   *2.5 +200, 320+ 29.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 40   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 20   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if(templateLengan==17){//lengan gelembung pendek l
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 290,0,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-80, 290,100,100));
      lengan1.add(new Node1(pg[3].width/2-83, 290,100,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,100));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan3.add(new Node1(pg[3].width/2-45, 300,0,0));
      lengan3.add(new Node1(pg[3].width/2-45, 310,0,0));
      lengan3.add(new Node1(pg[3].width/2-80, 300,100,0));
      lengan3.add(new Node1(pg[3].width/2-80, 290,100,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 290,0,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+80, 290,100,100));
      lengan2.add(new Node1(pg[3].width/2+83, 290,100,100));
      lengan2.add(new Node1(pg[3].width/2+84, 270,0,100));
      lengan2.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      lengan4.add(new Node1(pg[3].width/2+45, 300,0,0));
      lengan4.add(new Node1(pg[3].width/2+45, 310,0,0));
      lengan4.add(new Node1(pg[3].width/2+80, 300,100,0));
      lengan4.add(new Node1(pg[3].width/2+80, 290,100,0));
    
     polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 33   *2.5, 320+ 5    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 36   *2.5, 320+ 30   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 33   *2.5, 320+ 55   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 60   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 30   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3

      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 33   *2.5 +200, 320+ 5    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 36   *2.5 +200, 320+ 30   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 33   *2.5 +200, 320+ 55   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 60   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 30   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3
      
//POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 35   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 35   *2.5)); //D
    }
    if(templateLengan==18){//lengan gelembung panjang l
     lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-89, 420,100,100));
      lengan1.add(new Node1(pg[3].width/2-83, 290,0,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,0));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lengan2.add(new Node1(pg[3].width/2-67, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2-67, 430,100,0));
      lengan2.add(new Node1(pg[3].width/2-87, 430,100,100));
      lengan2.add(new Node1(pg[3].width/2-87, 420,100,0));
      
      lengan3.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan3.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan3.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan3.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan3.add(new Node1(pg[3].width/2+89, 420,100,100));
      lengan3.add(new Node1(pg[3].width/2+83, 290,0,100));
      lengan3.add(new Node1(pg[3].width/2+84, 270,0,0));
      lengan3.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan3.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      lengan4.add(new Node1(pg[3].width/2+67, 420,100,0));
      lengan4.add(new Node1(pg[3].width/2+67, 430,100,0));
      lengan4.add(new Node1(pg[3].width/2+87, 430,100,100));
      lengan4.add(new Node1(pg[3].width/2+87, 420,100,0));
    
     polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 61   *2.5, 320+ 5    *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 64   *2.5, 320+ 30   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 61   *2.5, 320+ 55   *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 60   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 30   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 61   *2.5 +200, 320+ 5    *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 64   *2.5 +200, 320+ 30   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 61   *2.5 +200, 320+ 55   *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 60   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 30   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3

      //POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 21   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 21   *2.5)); //D
    }
    if(templateLengan==19){//lengan gelembung atas pendek l
    lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lengan1.add(new Node1(pg[3].width/2-80, 300,100,0));
      lengan1.add(new Node1(pg[3].width/2-83, 290,100,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,100));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lengan2.add(new Node1(pg[3].width/2+80, 300,100,0));
      lengan2.add(new Node1(pg[3].width/2+83, 290,100,100));
      lengan2.add(new Node1(pg[3].width/2+84, 270,0,100));
      lengan2.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
    
    polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 33   *2.5, 320+ 3.5  *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 36   *2.5, 320+ 27   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 33   *2.5, 320+ 50.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 54   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 27   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 33   *2.5 +200, 320+ 3.5  *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 36   *2.5 +200, 320+ 27   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 33   *2.5 +200, 320+ 50.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 54   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 27   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3

//POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 35   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 35   *2.5)); //D
    }
    if(templateLengan==20){//lengan gelembung atas panjang l
       lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-89, 420,100,100));
      lengan1.add(new Node1(pg[3].width/2-83, 290,0,100));
      lengan1.add(new Node1(pg[3].width/2-84, 270,0,0));
      lengan1.add(new Node1(pg[3].width/2-70, 250,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2+89, 420,100,100));
      lengan2.add(new Node1(pg[3].width/2+83, 290,0,100));
      lengan2.add(new Node1(pg[3].width/2+84, 270,0,0));
      lengan2.add(new Node1(pg[3].width/2+70, 250,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 61   *2.5, 320+ 10.5 *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 64   *2.5, 320+ 27   *2.5)); //D
      polaLengan1.add(new Node(pg[2].width/20+ 61   *2.5, 320+ 43.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 15.5 *2.5, 320+ 54   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 48   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 40   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 32   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 27   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 24   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 16   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 12   *2.5, 320+ 8    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 61   *2.5 +200, 320+ 10.5 *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 64   *2.5 +200, 320+ 27   *2.5)); //D
      polaLengan2.add(new Node(pg[2].width/20+ 61   *2.5 +200, 320+ 43.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 15.5 *2.5 +200, 320+ 54   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 48   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 40   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 32   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 27   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 24   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 16   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 12   *2.5 +200, 320+ 8    *2.5)); //3

//POLA BAN
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 0    *2.5)); //A
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 0    *2.5)); //B
      polaLengan3.add(new Node(pg[2].width/20+ 5    *2.5 +380, 320+ 21   *2.5)); //C
      polaLengan3.add(new Node(pg[2].width/20+ 0    *2.5 +380, 320+ 21   *2.5)); //D
    
    }
    if(templateLengan==21){//lengan licin l
     lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,0));
      lengan1.add(new Node1(pg[3].width/2-45, 300,100,100));
      lengan1.add(new Node1(pg[3].width/2-55, 320,0,100));
      lengan1.add(new Node1(pg[3].width/2-80, 300,0,0));
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lengan2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,0));
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));
    
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 30   *2.5, 320+ 3.5  *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 30   *2.5, 320+ 38.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 40   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 30   *2.5 +200, 320+ 3.5  *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 30   *2.5 +200, 320+ 38.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 40   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 20   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if(templateLengan==22){//lengan licin panjang l
      lengan1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lengan1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lengan1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lengan1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-90, 420,100,100));
      lengan1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lengan2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
    
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 10.5 *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 31.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 42   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 10.5 *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 31.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 42   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 20   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if(templateLengan==23){//lengan gladde pendek l
      lengan1.add(new Node1(pg[3].width/2-45, 285,0,0));
      lengan1.add(new Node1(pg[3].width/2-45, 300,100,0));
      lengan1.add(new Node1(pg[3].width/2-55, 320,100,100));
      lengan1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lengan2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,100,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      garisLengan.add(new Node(pg[3].width/2+53,315));
      garisLengan.add(new Node(pg[3].width/2+78,295));
      garisLengan2.add(new Node(pg[3].width/2-53,315));
      garisLengan2.add(new Node(pg[3].width/2-78,295));
    
    polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 30   *2.5, 320+ 3.5  *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 39   *2.5, 320+ 3.5  *2.5)); //P
      polaLengan1.add(new Node(pg[2].width/20+ 39   *2.5, 320+ 38.5 *2.5)); //Q
      polaLengan1.add(new Node(pg[2].width/20+ 30   *2.5, 320+ 38.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 40   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 30   *2.5 +200, 320+ 3.5  *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 39   *2.5 +200, 320+ 3.5  *2.5)); //P
      polaLengan2.add(new Node(pg[2].width/20+ 39   *2.5 +200, 320+ 38.5 *2.5)); //Q
      polaLengan2.add(new Node(pg[2].width/20+ 30   *2.5 +200, 320+ 38.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 40   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 20   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    if(templateLengan==24){//lengan gladde panjang l
      lengan1.add(new Node1(pg[3].width/2-45, 285,0,0));
      lengan1.add(new Node1(pg[3].width/2-45, 300,100,0));
      lengan1.add(new Node1(pg[3].width/2-55, 320,100,100));
      lengan1.add(new Node1(pg[3].width/2-65, 420,0,100));
      lengan1.add(new Node1(pg[3].width/2-90, 420,100,0));
      lengan1.add(new Node1(pg[3].width/2-80, 300,100,100));
      lengan1.add(new Node1(pg[3].width/2-55, 240,0,100));
      
      lengan2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lengan2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lengan2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lengan2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lengan2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lengan2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lengan2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      garisLengan.add(new Node(pg[3].width/2+65,415));
      garisLengan.add(new Node(pg[3].width/2+90,415));
      garisLengan2.add(new Node(pg[3].width/2-65,415));
      garisLengan2.add(new Node(pg[3].width/2-90,415));
    
    polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 10.5 *2.5)); //O
      polaLengan1.add(new Node(pg[2].width/20+ 67   *2.5, 320+ 10.5 *2.5)); //P
      polaLengan1.add(new Node(pg[2].width/20+ 67   *2.5, 320+ 31.5 *2.5)); //Q
      polaLengan1.add(new Node(pg[2].width/20+ 58   *2.5, 320+ 31.5 *2.5)); //N
      polaLengan1.add(new Node(pg[2].width/20+ 12.5 *2.5, 320+ 42   *2.5)); //E
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLengan1.add(new Node(pg[2].width/20+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLengan1.add(new Node(pg[2].width/20+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLengan1.add(new Node(pg[2].width/20+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 0    *2.5)); //F
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 10.5 *2.5)); //O
      polaLengan2.add(new Node(pg[2].width/20+ 67   *2.5 +200, 320+ 10.5 *2.5)); //P
      polaLengan2.add(new Node(pg[2].width/20+ 67   *2.5 +200, 320+ 31.5 *2.5)); //Q
      polaLengan2.add(new Node(pg[2].width/20+ 58   *2.5 +200, 320+ 31.5 *2.5)); //N
      polaLengan2.add(new Node(pg[2].width/20+ 12.5 *2.5 +200, 320+ 42   *2.5)); //E
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 33   *2.5)); //3
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 28   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 23   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 0    *2.5 +200, 320+ 20   *2.5)); //A
      polaLengan2.add(new Node(pg[2].width/20+ 1    *2.5 +200, 320+ 15   *2.5)); //1
      polaLengan2.add(new Node(pg[2].width/20+ 5    *2.5 +200, 320+ 10   *2.5)); //2
      polaLengan2.add(new Node(pg[2].width/20+ 9.5  *2.5 +200, 320+ 5    *2.5)); //3
    }
    newProject = false; 
    base();
    base1();
  }
}

void selectLeherLk() {
  if (templateLeherlk>0) {
    if (!newProject) {
      for (int i = leherlk1.size()-1; i >= 0; i--)
        leherlk1.remove(leherlk1.get(i));
      for (int i = leherlk2.size()-1; i >= 0; i--)
        leherlk2.remove(leherlk2.get(i));
      for (int i = leherlk3.size()-1; i >= 0; i--)
        leherlk3.remove(leherlk3.get(i));  
      for (int i = garisLeherlk.size()-1; i >= 0; i--)
        garisLeherlk.remove(garisLeherlk.get(i));
      for (int i = garisLeherlk2.size()-1; i >= 0; i--)
        garisLeherlk2.remove(garisLeherlk2.get(i));
      for (int i = polaLeherlk1.size()-1; i >= 0; i--)
        polaLeherlk1.remove(polaLeherlk1.get(i));
      for (int i = polaLeherlk2.size()-1; i >= 0; i--)
        polaLeherlk2.remove(polaLeherlk2.get(i));
      for (int i = polaLeherlk3.size()-1; i >= 0; i--)
        polaLeherlk3.remove(polaLeherlk3.get(i));
      for (int i = polaLeherlk4.size()-1; i >= 0; i--)
        polaLeherlk4.remove(polaLeherlk4.get(i));
      for (int i = polaLeherlk5.size()-1; i >= 0; i--)
        polaLeherlk5.remove(polaLeherlk5.get(i));
    }

    newProject = true;
    if (templateLeherlk==1) {// kerah kemeja s
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+10, 260,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-10, 260,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 215,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5 *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 11.5 *2.5, 250+ 5   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 250+ 5   *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 38   *2.5, 250+ 5   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 42   *2.5, 250+ 4.5 *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 43.5 *2.5, 250+ 3   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 42   *2.5, 250+ 9.5 *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 33.5 *2.5, 250+ 8.5 *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 250+ 8.5 *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 14.5 *2.5, 250+ 8.5 *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5 *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3   *2.5)); //F
  
      //POLA KAKI KERAH
      polaLeherlk2.add(new Node(pg[2].width/20+ 14.5 *2.5 +150, 250+ 5   *2.5)); //E
      polaLeherlk2.add(new Node(pg[2].width/20+ 23.5 *2.5 +150, 250+ 5   *2.5)); //A
      polaLeherlk2.add(new Node(pg[2].width/20+ 33   *2.5 +150, 250+ 5   *2.5)); //E
      polaLeherlk2.add(new Node(pg[2].width/20+ 43   *2.5 +150, 250+ 2.5 *2.5)); //I
      polaLeherlk2.add(new Node(pg[2].width/20+ 45.5 *2.5 +150, 250+ 4   *2.5)); //G
      polaLeherlk2.add(new Node(pg[2].width/20+ 43   *2.5 +150, 250+ 5   *2.5)); //F
      polaLeherlk2.add(new Node(pg[2].width/20+ 33   *2.5 +150, 250+ 8   *2.5)); //H
      polaLeherlk2.add(new Node(pg[2].width/20+ 23.5 *2.5 +150, 250+ 8   *2.5)); //B
      polaLeherlk2.add(new Node(pg[2].width/20+ 14.5 *2.5 +150, 250+ 8   *2.5)); //H
      polaLeherlk2.add(new Node(pg[2].width/20+ 5    *2.5 +150, 250+ 5   *2.5)); //F
      polaLeherlk2.add(new Node(pg[2].width/20+ 3.5  *2.5 +150, 250+ 4   *2.5)); //G
      polaLeherlk2.add(new Node(pg[2].width/20+ 5.5  *2.5 +150, 250+ 2.5 *2.5)); //I
      
    }
    if (templateLeherlk==2) {//kerah sport s
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 215,0,0));
      
      leherlk2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
      
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 250+ 5    *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 42   *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 43.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 42   *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 36   *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 250+ 11   *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 11   *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    if(templateLeherlk==3){//kerah Shanghay s
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2+18, 213,100,0));
      leherlk1.add(new Node1(pg[3].width/2+10, 222,100,0));
      leherlk1.add(new Node1(pg[3].width/2+4, 225,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-4, 225,0,0));
      leherlk1.add(new Node1(pg[3].width/2-10, 222,0,0));
      leherlk1.add(new Node1(pg[3].width/2-18, 213,100,100));
      leherlk1.add(new Node1(pg[3].width/2-25, 220,100,100));
      
      leherlk2.add(new Node1(pg[3].width/2-18, 213,0,0));
      leherlk2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2+18, 213,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 210,0,0));
      
      polaLeherlk1.add(new Node(pg[2].width/20+ 14.5 *2.5, 350+ 5   *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 350+ 5   *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 33   *2.5, 350+ 5   *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 43   *2.5, 350+ 2.5 *2.5)); //I
      polaLeherlk1.add(new Node(pg[2].width/20+ 45.5 *2.5, 350+ 4   *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 43   *2.5, 350+ 5   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 33   *2.5, 350+ 8   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 350+ 8   *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 14.5 *2.5, 350+ 8   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 350+ 5   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 350+ 4   *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 5.5  *2.5, 350+ 2.5 *2.5)); //I
    }
    if(templateLeherlk==4){// kerah shiller s
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 215,0,0));
     
      leherlk2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
      
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 250+ 5    *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 42   *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 43.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 42   *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 36   *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 250+ 9.5   *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 11   *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    if(templateLeherlk==5){// kerah kemeja boord terusan s
     leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+35, 250,0,0));
      leherlk1.add(new Node1(pg[3].width/2+18, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 249,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 260,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 249,0,0));
      leherlk1.add(new Node1(pg[3].width/2-18, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-35, 250,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      
      leherlk2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 215,0,0));
      
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 250+ 5    *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 42   *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 47   *2.5, 250+ 3.5  *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 42   *2.5, 250+ 9    *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 43   *2.5, 250+ 10   *2.5)); //I
      polaLeherlk1.add(new Node(pg[2].width/20+ 44.5 *2.5, 250+ 10   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 38.5 *2.5, 250+ 10.5 *2.5)); //L
      polaLeherlk1.add(new Node(pg[2].width/20+ 23.5 *2.5, 250+ 10.5 *2.5)); //J
      polaLeherlk1.add(new Node(pg[2].width/20+ 8.5  *2.5, 250+ 10.5 *2.5)); //L
      polaLeherlk1.add(new Node(pg[2].width/20+ 2.5  *2.5, 250+ 10   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 4    *2.5, 250+ 10   *2.5)); //I
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9    *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 0    *2.5, 250+ 3.5  *2.5)); //G
    }
    
    if(templateLeherlk==7){// kerah kemeja m
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+10, 260,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-10, 260,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 215,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
          
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5 *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 11.5 *2.5, 250+ 5   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 5   *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 37.5 *2.5, 250+ 5   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 4.5 *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 45.5 *2.5, 250+ 3   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 9.5 *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 34.5 *2.5, 250+ 8.5 *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 8.5 *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 15   *2.5, 250+ 8.5 *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5 *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3   *2.5)); //F

      //POLA KAKI KERAH
      polaLeherlk2.add(new Node(pg[2].width/20+ 15   *2.5 +150, 250+ 5   *2.5)); //E
      polaLeherlk2.add(new Node(pg[2].width/20+ 24.5 *2.5 +150, 250+ 5   *2.5)); //A
      polaLeherlk2.add(new Node(pg[2].width/20+ 34.5 *2.5 +150, 250+ 5   *2.5)); //E
      polaLeherlk2.add(new Node(pg[2].width/20+ 45.5 *2.5 +150, 250+ 2.5 *2.5)); //I
      polaLeherlk2.add(new Node(pg[2].width/20+ 46.5 *2.5 +150, 250+ 4   *2.5)); //G
      polaLeherlk2.add(new Node(pg[2].width/20+ 45.5 *2.5 +150, 250+ 5   *2.5)); //F
      polaLeherlk2.add(new Node(pg[2].width/20+ 34.5 *2.5 +150, 250+ 8   *2.5)); //H
      polaLeherlk2.add(new Node(pg[2].width/20+ 24.5 *2.5 +150, 250+ 8   *2.5)); //B
      polaLeherlk2.add(new Node(pg[2].width/20+ 15   *2.5 +150, 250+ 8   *2.5)); //H
      polaLeherlk2.add(new Node(pg[2].width/20+ 5    *2.5 +150, 250+ 5   *2.5)); //F
      polaLeherlk2.add(new Node(pg[2].width/20+ 3.5  *2.5 +150, 250+ 4   *2.5)); //G
      polaLeherlk2.add(new Node(pg[2].width/20+ 5.5  *2.5 +150, 250+ 2.5 *2.5)); //I
    }
    
    if(templateLeherlk==8){// kerah sport m
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 215,0,0));
      
      leherlk2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
    
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 5    *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 45.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 37.5 *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 11   *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 11.5 *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    
    if(templateLeherlk==9){// kerah shanghay m
       leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2+18, 213,100,0));
      leherlk1.add(new Node1(pg[3].width/2+10, 222,100,0));
      leherlk1.add(new Node1(pg[3].width/2+4, 225,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-4, 225,0,0));
      leherlk1.add(new Node1(pg[3].width/2-10, 222,0,0));
      leherlk1.add(new Node1(pg[3].width/2-18, 213,100,100));
      leherlk1.add(new Node1(pg[3].width/2-25, 220,100,100));
      
      leherlk2.add(new Node1(pg[3].width/2-18, 213,0,0));
      leherlk2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2+18, 213,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 210,0,0));
      
      polaLeherlk1.add(new Node(pg[2].width/20+ 15   *2.5, 250+ 5   *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 5   *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 34.5 *2.5, 250+ 5   *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 45.5 *2.5, 250+ 2.5 *2.5)); //I
      polaLeherlk1.add(new Node(pg[2].width/20+ 46.5 *2.5, 250+ 4   *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 45.5 *2.5, 250+ 5   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 34.5 *2.5, 250+ 8   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 8   *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 15   *2.5, 250+ 8   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 5   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 4   *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 5.5  *2.5, 250+ 2.5 *2.5)); //I

    }
    
    if(templateLeherlk==10){// kerah shiller m
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 215,0,0));
     
      leherlk2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
    
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 5    *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 45.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 37.5 *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 9.5  *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 11.5 *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    
    if(templateLeherlk==11){// kerah kemeja boord terusan m
     leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+35, 250,0,0));
      leherlk1.add(new Node1(pg[3].width/2+18, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 249,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 260,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 249,0,0));
      leherlk1.add(new Node1(pg[3].width/2-18, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-35, 250,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      
      leherlk2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 215,0,0));
      
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 5    *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 49   *2.5, 250+ 3.5  *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 44   *2.5, 250+ 9    *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 45   *2.5, 250+ 10   *2.5)); //I
      polaLeherlk1.add(new Node(pg[2].width/20+ 46.5 *2.5, 250+ 10   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 40   *2.5, 250+ 10.5 *2.5)); //L  
      polaLeherlk1.add(new Node(pg[2].width/20+ 24.5 *2.5, 250+ 10.5 *2.5)); //J
      polaLeherlk1.add(new Node(pg[2].width/20+ 9    *2.5, 250+ 10.5 *2.5)); //L
      polaLeherlk1.add(new Node(pg[2].width/20+ 2.5  *2.5, 250+ 10   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 4    *2.5, 250+ 10   *2.5)); //I
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9    *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 0    *2.5, 250+ 3.5  *2.5)); //G
    }
    
    if(templateLeherlk==13){// kerah kemeja l
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+10, 260,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-10, 260,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 215,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5 *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 12   *2.5, 250+ 5   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *2.5, 250+ 5   *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 39   *2.5, 250+ 5   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *2.5, 250+ 4.5 *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 47.5 *2.5, 250+ 3   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *2.5, 250+ 9.5 *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 35   *2.5, 250+ 8.5 *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *2.5, 250+ 8.5 *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 15.5 *2.5, 250+ 8.5 *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5 *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3   *2.5)); //F

      //POLA KAKI KERAH
      polaLeherlk2.add(new Node(pg[2].width/20+ 15.5 *2.5 +150, 250+ 5   *2.5)); //E
      polaLeherlk2.add(new Node(pg[2].width/20+ 25.5 *2.5 +150, 250+ 5   *2.5)); //A
      polaLeherlk2.add(new Node(pg[2].width/20+ 35.5 *2.5 +150, 250+ 5   *2.5)); //E
      polaLeherlk2.add(new Node(pg[2].width/20+ 46   *2.5 +150, 250+ 2.5 *2.5)); //I
      polaLeherlk2.add(new Node(pg[2].width/20+ 47.5 *2.5 +150, 250+ 4   *2.5)); //G
      polaLeherlk2.add(new Node(pg[2].width/20+ 46   *2.5 +150, 250+ 5   *2.5)); //F
      polaLeherlk2.add(new Node(pg[2].width/20+ 35.5 *2.5 +150, 250+ 8   *2.5)); //H
      polaLeherlk2.add(new Node(pg[2].width/20+ 25.5 *2.5 +150, 250+ 8   *2.5)); //B
      polaLeherlk2.add(new Node(pg[2].width/20+ 15.5 *2.5 +150, 250+ 8   *2.5)); //H
      polaLeherlk2.add(new Node(pg[2].width/20+ 5    *2.5 +150, 250+ 5   *2.5)); //F
      polaLeherlk2.add(new Node(pg[2].width/20+ 3.5  *2.5 +150, 250+ 4   *2.5)); //G
      polaLeherlk2.add(new Node(pg[2].width/20+ 5.5  *2.5 +150, 250+ 2.5 *2.5)); //I
    }
    
    if(templateLeherlk==14){// kerah sport l
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 215,0,0));
      
      leherlk2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
    
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *2.5, 250+ 5    *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 47.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 38.5 *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *2.5, 250+ 11   *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 12.5 *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    
    if(templateLeherlk==15){// kerah shanghay l
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2+18, 213,100,0));
      leherlk1.add(new Node1(pg[3].width/2+10, 222,100,0));
      leherlk1.add(new Node1(pg[3].width/2+4, 225,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-4, 225,0,0));
      leherlk1.add(new Node1(pg[3].width/2-10, 222,0,0));
      leherlk1.add(new Node1(pg[3].width/2-18, 213,100,100));
      leherlk1.add(new Node1(pg[3].width/2-25, 220,100,100));
      
      leherlk2.add(new Node1(pg[3].width/2-18, 213,0,0));
      leherlk2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2+18, 213,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 210,0,0));
        
      polaLeherlk1.add(new Node(pg[2].width/20+ 15.5 *2.5, 250+ 5   *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *2.5, 250+ 5   *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 35.5 *2.5, 250+ 5   *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *2.5, 250+ 2.5 *2.5)); //I
      polaLeherlk1.add(new Node(pg[2].width/20+ 47.5 *2.5, 250+ 4   *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *2.5, 250+ 5   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 35.5 *2.5, 250+ 8   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *2.5, 250+ 8   *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 15.5 *2.5, 250+ 8   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 5   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 4   *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 5.5  *2.5, 250+ 2.5 *2.5)); //I
    }
    
    if(templateLeherlk==16){// kerah shiller l
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+35, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 215,0,0));
     
      leherlk2.add(new Node1(pg[3].width/2-28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+28, 235,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));  
     
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *2.5, 250+ 5    *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *2.5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 47.5 *2.5, 250+ 3.5  *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 38.5 *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *2.5, 250+ 9.5  *2.5)); //B
      polaLeherlk1.add(new Node(pg[2].width/20+ 12.5 *2.5, 250+ 11   *2.5)); //F
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *2.5, 250+ 9.5  *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 3.5  *2.5, 250+ 3.5  *2.5)); //G
    }
    
    if(templateLeherlk==17){// kerah kemeja boord terusan l
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk1.add(new Node1(pg[3].width/2+40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2+35, 250,0,0));
      leherlk1.add(new Node1(pg[3].width/2+18, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2+20, 249,0,0));
      leherlk1.add(new Node1(pg[3].width/2, 260,0,0));
      leherlk1.add(new Node1(pg[3].width/2-20, 249,0,0));
      leherlk1.add(new Node1(pg[3].width/2-18, 240,0,0));
      leherlk1.add(new Node1(pg[3].width/2-35, 250,0,0));
      leherlk1.add(new Node1(pg[3].width/2-40, 230,0,0));
      leherlk1.add(new Node1(pg[3].width/2-25, 220,0,0));
      
      leherlk2.add(new Node1(pg[3].width/2-25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2-20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 240,0,0));
      leherlk2.add(new Node1(pg[3].width/2+20, 230,0,0));
      leherlk2.add(new Node1(pg[3].width/2+25, 220,0,0));
      leherlk2.add(new Node1(pg[3].width/2, 215,0,0));
      
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *5, 250+ 5    *2.5)); //A
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *5, 250+ 4.5  *2.5)); //C
      polaLeherlk1.add(new Node(pg[2].width/20+ 51   *5, 250+ 3.5  *2.5)); //G
      polaLeherlk1.add(new Node(pg[2].width/20+ 46   *5, 250+ 9    *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 47   *5, 250+ 10   *2.5)); //I
      polaLeherlk1.add(new Node(pg[2].width/20+ 48.5 *5, 250+ 10   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 41.5 *5, 250+ 10.5 *2.5)); //L  
      polaLeherlk1.add(new Node(pg[2].width/20+ 25.5 *5, 250+ 10.5 *2.5)); //J
      polaLeherlk1.add(new Node(pg[2].width/20+ 9.5  *5, 250+ 10.5 *2.5)); //L
      polaLeherlk1.add(new Node(pg[2].width/20+ 2.5  *5, 250+ 10   *2.5)); //H
      polaLeherlk1.add(new Node(pg[2].width/20+ 4    *5, 250+ 10   *2.5)); //I
      polaLeherlk1.add(new Node(pg[2].width/20+ 5    *5, 250+ 9    *2.5)); //E
      polaLeherlk1.add(new Node(pg[2].width/20+ 0    *5, 250+ 3.5  *2.5)); //G
    }
    
    newProject = false; 
    base();
    base1();
  }
}

void selectLenganLk() {
  if (templateLenganlk>0) {
    if (!newProject) {
      for (int i = lenganlk1.size()-1; i >= 0; i--)
        lenganlk1.remove(lenganlk1.get(i));
      for (int i = lenganlk2.size()-1; i >= 0; i--)
        lenganlk2.remove(lenganlk2.get(i));
      for (int i = lenganlk3.size()-1; i >= 0; i--)
        lenganlk3.remove(lenganlk3.get(i));  
      //for (int i = lenganlk4.size()-1; i >= 0; i--)
      //  lenganlk4.remove(lenganlk4.get(i));   
      for (int i = garisLenganlk.size()-1; i >= 0; i--)
        garisLenganlk.remove(garisLenganlk.get(i));
      for (int i = garisLenganlk2.size()-1; i >= 0; i--)
        garisLenganlk2.remove(garisLenganlk2.get(i));
      for (int i = polaLenganlk1.size()-1; i >= 0; i--)
        polaLenganlk1.remove(polaLenganlk1.get(i));
      for (int i = polaLenganlk2.size()-1; i >= 0; i--)
        polaLenganlk2.remove(polaLenganlk2.get(i));
      for (int i = polaLenganlk3.size()-1; i >= 0; i--)
        polaLenganlk3.remove(polaLenganlk3.get(i));
      for (int i = polaLenganlk4.size()-1; i >= 0; i--)
        polaLenganlk4.remove(polaLenganlk4.get(i));
      for (int i = polaLenganlk5.size()-1; i >= 0; i--)
        polaLenganlk5.remove(polaLenganlk5.get(i));
    }

    newProject = true;
    if (templateLenganlk==1) {//lengan licin pendek
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 26   *2.5, 320+ 3    *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 26   *2.5, 320+ 35   *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 38   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 320+ 19   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 320+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 26   *2.5 +250, 320+ 3    *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 26   *2.5 +250, 320+ 35   *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 320+ 38   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 320+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 320+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 320+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +250, 320+ 19   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 320+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 320+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 320+ 5    *2.5)); //3
    }
    if (templateLenganlk==2) {// lengan licin panjang
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-90, 420,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
       polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 52   *2.5, 320+ 10.5 *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 52   *2.5, 320+ 27.5 *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 38   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 320+ 19   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 320+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 52   *2.5 +350, 320+ 10.5 *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 52   *2.5 +350, 320+ 27.5 *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 320+ 38   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 320+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 320+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 320+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +350, 320+ 19   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 320+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 320+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 320+ 5    *2.5)); //3
    }
    if (templateLenganlk==3) { //lengan gladde pendek
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      garisLenganlk.add(new Node(pg[3].width/2+53,315));
      garisLenganlk.add(new Node(pg[3].width/2+78,295));
      garisLenganlk2.add(new Node(pg[3].width/2-53,315));
      garisLenganlk2.add(new Node(pg[3].width/2-78,295));
      
       polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 30   *2.5, 300+ 2.5  *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 39   *2.5, 300+ 2.5  *2.5)); //P
      polaLenganlk1.add(new Node(pg[2].width/25+ 39   *2.5, 300+ 35.5 *2.5)); //Q
      polaLenganlk1.add(new Node(pg[2].width/25+ 30   *2.5, 300+ 35.5 *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 38   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 300+ 19   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 300+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 30   *2.5 +250, 300+ 2.5  *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 39   *2.5 +250, 300+ 2.5  *2.5)); //P
      polaLenganlk2.add(new Node(pg[2].width/25- 39   *2.5 +250, 300+ 35.5 *2.5)); //Q
      polaLenganlk2.add(new Node(pg[2].width/25- 30   *2.5 +250, 300+ 35.5 *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 300+ 38   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 300+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 300+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 300+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +250, 300+ 19   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 300+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 300+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 300+ 5    *2.5)); //3
    }
    if (templateLenganlk==4) { //lengan gladde panjang
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-90, 420,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      garisLenganlk.add(new Node(pg[3].width/2+65,415));
      garisLenganlk.add(new Node(pg[3].width/2+90,415));
      garisLenganlk2.add(new Node(pg[3].width/2-65,415));
      garisLenganlk2.add(new Node(pg[3].width/2-90,415));
      
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 56   *2.5, 300+ 10   *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 65   *2.5, 300+ 10   *2.5)); //P
      polaLenganlk1.add(new Node(pg[2].width/25+ 65   *2.5, 300+ 28   *2.5)); //Q
      polaLenganlk1.add(new Node(pg[2].width/25+ 56   *2.5, 300+ 28   *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 38   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 300+ 19   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 300+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 56   *2.5 +350, 300+ 10   *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 65   *2.5 +350, 300+ 10   *2.5)); //P
      polaLenganlk2.add(new Node(pg[2].width/25- 65   *2.5 +350, 300+ 28   *2.5)); //Q
      polaLenganlk2.add(new Node(pg[2].width/25- 56   *2.5 +350, 300+ 28   *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 300+ 38   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 300+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 300+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 300+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +350, 300+ 19   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 300+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 300+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 300+ 5    *2.5)); //3
    }
    if(templateLenganlk==5){// licin pendek m
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 28   *2.5, 320+ 3    *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 28   *2.5, 320+ 37   *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 40   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 320+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 28   *2.5 +250, 320+ 3    *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 28   *2.5 +250, 320+ 37   *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 320+ 40   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 320+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 320+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 320+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +250, 320+ 20   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 320+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 320+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 320+ 5    *2.5)); //3
    }
    if(templateLenganlk==6){ //licin panjang m
    lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-90, 420,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
       polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 55   *2.5, 320+ 10.5 *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 55   *2.5, 320+ 29.5 *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 40   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 320+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 55   *2.5 +350, 320+ 10.5 *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 55   *2.5 +350, 320+ 29.5 *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 320+ 40   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 320+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 320+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 320+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +350, 320+ 20   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 320+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 320+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 320+ 5    *2.5)); //3
    }
    if(templateLenganlk==7){ //gladde pendek m
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      garisLenganlk.add(new Node(pg[3].width/2+53,315));
      garisLenganlk.add(new Node(pg[3].width/2+78,295));
      garisLenganlk2.add(new Node(pg[3].width/2-53,315));
      garisLenganlk2.add(new Node(pg[3].width/2-78,295));
      
        polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 31   *2.5, 300+ 1.5  *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 40   *2.5, 300+ 1.5  *2.5)); //P
      polaLenganlk1.add(new Node(pg[2].width/25+ 40   *2.5, 300+ 36.5 *2.5)); //Q
      polaLenganlk1.add(new Node(pg[2].width/25+ 31   *2.5, 300+ 36.5 *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 38   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 300+ 19   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 300+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 31   *2.5 +250, 300+ 1.5  *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 40   *2.5 +250, 300+ 1.5  *2.5)); //P
      polaLenganlk2.add(new Node(pg[2].width/25- 40   *2.5 +250, 300+ 36.5 *2.5)); //Q
      polaLenganlk2.add(new Node(pg[2].width/25- 31   *2.5 +250, 300+ 36.5 *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 300+ 38   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 300+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 300+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 300+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +250, 300+ 19   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 300+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 300+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 300+ 5    *2.5)); //3
    }
    if(templateLenganlk==8){ //gladde panjang m
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-90, 420,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      garisLenganlk.add(new Node(pg[3].width/2+65,415));
      garisLenganlk.add(new Node(pg[3].width/2+90,415));
      garisLenganlk2.add(new Node(pg[3].width/2-65,415));
      garisLenganlk2.add(new Node(pg[3].width/2-90,415));
      
       polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 58   *2.5, 300+ 9    *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 67   *2.5, 300+ 9    *2.5)); //P
      polaLenganlk1.add(new Node(pg[2].width/25+ 67   *2.5, 300+ 29   *2.5)); //Q
      polaLenganlk1.add(new Node(pg[2].width/25+ 58   *2.5, 300+ 29   *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 38   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 300+ 19   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 300+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 58   *2.5 +350, 300+ 9    *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 67   *2.5 +350, 300+ 9    *2.5)); //P
      polaLenganlk2.add(new Node(pg[2].width/25- 67   *2.5 +350, 300+ 29   *2.5)); //Q
      polaLenganlk2.add(new Node(pg[2].width/25- 58   *2.5 +350, 300+ 29   *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 300+ 38   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 300+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 300+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 300+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +350, 300+ 19   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 300+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 300+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 300+ 5    *2.5)); //3
    }
    if(templateLenganlk==9){// licin pendek l
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
       polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 30   *2.5, 320+ 3.5  *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 30   *2.5, 320+ 38.5 *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 40   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 320+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 30   *2.5 +250, 320+ 3.5  *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 30   *2.5 +250, 320+ 38.5 *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 320+ 40   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 320+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 320+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 320+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +250, 320+ 20   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 320+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 320+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 320+ 5    *2.5)); //3
    }
    if(templateLenganlk==10){ //licin panjang l
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-90, 420,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
       polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 58   *2.5, 320+ 10.5 *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 58   *2.5, 320+ 31.5 *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 320+ 42   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 320+ 20   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 320+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 320+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 320+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 320+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 58   *2.5 +350, 320+ 10.5 *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 58   *2.5 +350, 320+ 31.5 *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 320+ 42   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 320+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 320+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 320+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +350, 320+ 20   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 320+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 320+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 320+ 5    *2.5)); //3
    }
    if(templateLenganlk==11){ //gladde pendek l
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));
      
      garisLenganlk.add(new Node(pg[3].width/2+53,315));
      garisLenganlk.add(new Node(pg[3].width/2+78,295));
      garisLenganlk2.add(new Node(pg[3].width/2-53,315));
      garisLenganlk2.add(new Node(pg[3].width/2-78,295));
      
       polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 32   *2.5, 300+ 0.5  *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 41   *2.5, 300+ 0.5  *2.5)); //P
      polaLenganlk1.add(new Node(pg[2].width/25+ 41   *2.5, 300+ 37.5 *2.5)); //Q
      polaLenganlk1.add(new Node(pg[2].width/25+ 32   *2.5, 300+ 37.5 *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 38   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 300+ 19   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 300+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 32   *2.5 +250, 300+ 0.5  *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 41   *2.5 +250, 300+ 0.5  *2.5)); //P
      polaLenganlk2.add(new Node(pg[2].width/25- 41   *2.5 +250, 300+ 37.5 *2.5)); //Q
      polaLenganlk2.add(new Node(pg[2].width/25- 32   *2.5 +250, 300+ 37.5 *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +250, 300+ 38   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 300+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 300+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 300+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +250, 300+ 19   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +250, 300+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +250, 300+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +250, 300+ 5    *2.5)); //3
    }
    if(templateLenganlk==12){ //gladde panjang l
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,100,0));//kiri
      lenganlk1.add(new Node1(pg[3].width/2-45, 285,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-45, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 320,0,0));
      lenganlk1.add(new Node1(pg[3].width/2-65, 420,100,0));
      lenganlk1.add(new Node1(pg[3].width/2-90, 420,100,100));
      lenganlk1.add(new Node1(pg[3].width/2-80, 300,0,100));
      lenganlk1.add(new Node1(pg[3].width/2-55, 240,0,0));
      
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,100,0));//kanan
      lenganlk2.add(new Node1(pg[3].width/2+45, 285,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+45, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 320,0,0));
      lenganlk2.add(new Node1(pg[3].width/2+65, 420,100,0));
      lenganlk2.add(new Node1(pg[3].width/2+90, 420,100,100));
      lenganlk2.add(new Node1(pg[3].width/2+80, 300,0,100));
      lenganlk2.add(new Node1(pg[3].width/2+55, 240,0,0));
      
      garisLenganlk.add(new Node(pg[3].width/2+65,415));
      garisLenganlk.add(new Node(pg[3].width/2+90,415));
      garisLenganlk2.add(new Node(pg[3].width/2-65,415));
      garisLenganlk2.add(new Node(pg[3].width/2-90,415));
      
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 0    *2.5)); //F
      polaLenganlk1.add(new Node(pg[2].width/25+ 60   *2.5, 300+ 8    *2.5)); //O
      polaLenganlk1.add(new Node(pg[2].width/25+ 69   *2.5, 300+ 8    *2.5)); //P
      polaLenganlk1.add(new Node(pg[2].width/25+ 69   *2.5, 300+ 30   *2.5)); //Q
      polaLenganlk1.add(new Node(pg[2].width/25+ 60   *2.5, 300+ 30   *2.5)); //N
      polaLenganlk1.add(new Node(pg[2].width/25+ 12.5 *2.5, 300+ 38   *2.5)); //E
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 33   *2.5)); //3
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 28   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 23   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 0    *2.5, 300+ 19   *2.5)); //A
      polaLenganlk1.add(new Node(pg[2].width/25+ 1    *2.5, 300+ 15   *2.5)); //1
      polaLenganlk1.add(new Node(pg[2].width/25+ 5    *2.5, 300+ 10   *2.5)); //2
      polaLenganlk1.add(new Node(pg[2].width/25+ 9.5  *2.5, 300+ 5    *2.5)); //3
      
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 300+ 0    *2.5)); //F
      polaLenganlk2.add(new Node(pg[2].width/25- 60   *2.5 +350, 300+ 8    *2.5)); //O
      polaLenganlk2.add(new Node(pg[2].width/25- 69   *2.5 +350, 300+ 8    *2.5)); //P
      polaLenganlk2.add(new Node(pg[2].width/25- 69   *2.5 +350, 300+ 30   *2.5)); //Q
      polaLenganlk2.add(new Node(pg[2].width/25- 60   *2.5 +350, 300+ 30   *2.5)); //N
      polaLenganlk2.add(new Node(pg[2].width/25- 12.5 *2.5 +350, 300+ 38   *2.5)); //E
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 300+ 33   *2.5)); //3
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 300+ 28   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 300+ 23   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 0    *2.5 +350, 300+ 19   *2.5)); //A
      polaLenganlk2.add(new Node(pg[2].width/25- 1    *2.5 +350, 300+ 15   *2.5)); //1
      polaLenganlk2.add(new Node(pg[2].width/25- 5    *2.5 +350, 300+ 10   *2.5)); //2
      polaLenganlk2.add(new Node(pg[2].width/25- 9.5  *2.5 +350, 300+ 5    *2.5)); //3
    }
    newProject = false; 
    base();
    base1();
  }
}

void mouseMoved() {
  for (int i=0; i<menuList.length; i++)
    if (menuList[i].menuOpen)
      menuList[i].selectedLineFromMouse();
}

public void mousePressed() {
  int menuResult = -1;  
  for (int i=0; i<menuList.length; i++) {
    menuResult = menuList[i].clicked();
    if (menuResult!=-1) {
      evalMenu(menuResult);
      return;
    }
  }

  if (mouseY<25 && mouseX>width-40)
    exit();

  if (pgRok) {
    int c2d=1;
    for (int i=1; i<=6; i++) {
      if (c2d>=imgRok.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=3; j++) {
        if (c2d>imgRok.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          rok = true;
          atasanlk = false;
          celanalk = false;
          leherlk = false;
          lenganlk = false;
          gaun = false;
          templateRok = c2d;
          selectRok();          
          newProject = false;
          celana = false;
          break;
        }
        c2d++;
      }
    }
  } else if (pgAtasan) {
    int c2d=1;
    for (int i=1; i<=3; i++) {
      if (c2d>=imgAtasan.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=3; j++) {
        if (c2d>imgAtasan.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          atasan = true;
          atasanlk = false;
          celanalk = false;
          leherlk = false;
          lenganlk = false;
          gaun = false;
          templateAtasan = c2d;
          selectAtasan();          
          newProject = false;
          break;
        }
        c2d++;
      }
    }
   } else if (pgLengan) {
    int c2d=1;
    for (int i=1; i<=16; i++) {
      if (c2d>=imgLengan.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=4; j++) {
        if (c2d>imgLengan.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          lengan = true;
          lenganlk = false;
          atasanlk = false;
          celanalk = false;
          leherlk = false;
          templateLengan = c2d;
          selectLengan();          
          newProject = false;
          break;
        }
        c2d++;
      }
    } 
   }else if (pgLenganLk) {
    int c2d=1;
    for (int i=1; i<=4; i++) {
      if (c2d>=imgLenganLk.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=4; j++) {
        if (c2d>imgLenganLk.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          lengan = false;
          lenganlk = true;
          atasan = false;
          celana = false;
          leher = false;
          gaun = false;
          rok = false;
          templateLenganlk = c2d;
          selectLenganLk();          
          newProject = false;
          break;
        }
        c2d++;
      }
    } 
  } else if (pgLeher) {
    int c2d=1;
    for (int i=1; i<=5; i++) {
      if (c2d>=imgLeher.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=3; j++) {
        if (c2d>imgLeher.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          leher = true;
          leherlk = false;
          atasanlk = false;
          celanalk = false;
          lenganlk = false;
          templateLeher = c2d;
          selectLeher();          
          newProject = false;
          break;
        }
        c2d++;
      }
    } 
     } else if (pgLeherLk) {
    int c2d=1;
    for (int i=1; i<=5; i++) {
      if (c2d>=imgLeherLk.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=3; j++) {
        if (c2d>imgLeherLk.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          leher = false;
          leherlk = true;
          rok = false;
          atasan =false;
          gaun = false;
          celana = false;
          lengan = false;
          templateLeherlk = c2d;
          selectLeherLk();          
          newProject = false;
          break;
        }
        c2d++;
      }
    } 
  } else if (pgGaun) {
    int c2d=1;
    for (int i=1; i<=4; i++) {
      if (c2d>=imgGaun.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=4; j++) {
        if (c2d>imgGaun.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          gaun = true;
          rok = false;
          celana = false;
          atasan = false;
          atasanlk = false;
          celanalk = false;
          lenganlk = false;
          leherlk = false;
          templateGaun = c2d;
          selectGaun();          
          newProject = false;
          break;
        }
        c2d++;
      }
    }
  } else if (pgCelana) {
    int c2d=1;
    for (int i=1; i<=2; i++) {
      if (c2d>=imgCelana.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=2; j++) {
        if (c2d>imgCelana.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          celana = true;
          rok = false;
          gaun = false;
          celanalk = false;
          atasanlk = false;
          leherlk = false;
          lenganlk = false;
          templateCelana = c2d;
          selectCelana();          
          newProject = false;
          break;
        }
        c2d++;
      }
    } 
  } else if (pgAtasanLk) {
    int c2d=1;
    for (int i=1; i<=2; i++) {
      if (c2d>=imgAtasanLk.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=2; j++) {
        if (c2d>imgAtasanLk.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          atasanlk = true;
          atasan = false;
          rok  = false;
          gaun = false;
          lengan = false;
          leher = false;
          celana = false;
          templateAtasanlk = c2d;
          selectAtasanlk();          
          newProject = false;
          break;
        }
        c2d++;
      }
    }
  } else if (pgCelanaLk) {
    int c2d=1;
    for (int i=1; i<=2; i++) {
      if (c2d>=imgCelanaLk.length-1) {
        c2d=1;
        break;
      }
      for (int j=1; j<=2; j++) {
        if (c2d>imgCelanaLk.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          celanalk = true;
          rok = false;
          gaun = false;
          celana = false;
          atasan = false;
          lengan = false;
          leher = false;
          templateCelanalk = c2d;
          selectCelanalk();          
          newProject = false;
          break;
        }
        c2d++;
      }
    }
  } else if (pgTex1) {
    int c=1;
    for (int i=1; i<=9; i++) {
      if (c>=imgtex1.length-1) {
        c=1;
        break;
      }
      for (int j=1; j<=6; j++) {
        if (c>imgtex1.length-1)
          break;
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          citraKain = true;
          text=1;
          imageTexture = imgtex1[c];
          urlTexture = urlTex1[c];
        }
        c++;
      }
    }
  } else if (pgTex2) {
    int c=1;
    for (int i=1; i<=9; i++) {
      if (c>=imgtex2.length-1) {
        c=1;
        break;
      }
      for (int j=1; j<=6; j++) {
        if (c>imgtex2.length-1) {
          break;
        }
        if (mouseX>pg[4].width-(j*75)+10+(2*width/3) && mouseX<pg[4].width-(j*75-50)+10+(2*width/3)
          && mouseY-25<i*75+50 && mouseY-25>i*75) {
          citraKain = true;
          text=1;
          imageTexture = imgtex2[c];
          urlTexture = urlTex2[c];
        }
        c++;
      }
    }
  }
}

public void drawPgAction(){
  pg[10].beginDraw();
  pg[10].background(200);
  pg[10].textSize(16);
  pg[10].text("Pola yang Anda Pilih :",15,25);
  pg[10].fill(0);
  
  child = new ArrayList<String>();
  
  if(atasanlk1.size()==15 && polaAtasanlk1.size()==18 && polaAtasanlk2.size()==18 && templateAtasanlk==1 && size==1){
    pg[10].text("Pria",190,25);
    pg[10].text("- Pola Baju Tanpa Bukaan S",15,50);
    child.add("A111");
    child.add("A112");
  }
  else if(atasanlk1.size()==15 && garisAtasanlk.size()==2 && polaAtasanlk1.size()==11 && polaAtasanlk2.size()==11
  && polaAtasanlk3.size()==18 && templateAtasanlk==2 && templateAtasanlk==1){
    pg[10].text("Pria",190,25);
    pg[10].text("- Pola Baju Bukaan Depan S",15,50);
    
    child.add("B111");
    child.add("B112");
    child.add("B113");
  }
  else if(atasanlk1.size()==15 && polaAtasanlk1.size()==18 && polaAtasanlk2.size()==18 && templateAtasanlk!=1 && templateAtasanlk==3 && templateAtasanlk==1){
    pg[10].text("Pria",190,25);
    pg[10].text("- Pola Baju Tanpa Bukaan M",15,50);
    
    child.add("A121");
    child.add("A122");
  }
  else if(atasanlk1.size()==15 && garisAtasanlk.size()==2 && polaAtasanlk1.size()==11 && polaAtasanlk2.size()==11 
  && polaAtasanlk3.size()==18 && templateAtasanlk!=2 && templateAtasanlk==1  && templateAtasanlk==2){
    pg[10].text("Pria",190,25);
    pg[10].text("- Pola Baju Bukaan Depan M",15,50);
    
    child.add("B121");
    child.add("B122");
    child.add("B123");
  }
  else if(atasanlk1.size()==15 && polaAtasanlk1.size()==18 && polaAtasanlk2.size()==18 && templateAtasanlk!=1 
  && templateAtasanlk!=3 && templateAtasanlk==5){
    pg[10].text("Pria",190,25);
    pg[10].text("- Pola Baju Tanpa Bukaan L",15,50);
    
    child.add("A131");
    child.add("A132");
  }
  else if(atasanlk1.size()==15 && garisAtasanlk.size()==2 && polaAtasanlk1.size()==11 && polaAtasanlk2.size()==11 
  && polaAtasanlk3.size()==18 && templateAtasanlk!=2 && templateAtasanlk!=4  && templateAtasanlk==6){
    pg[10].text("Pria",190,25);
    pg[10].text("- Pola Baju Bukaan Depan L",15,50);
    
    child.add("B131");
    child.add("B132");
    child.add("B133");
  }

  if(leherlk1.size()==8 && polaLeherlk1.size()==12 && polaLeherlk2.size()==12 && templateLeherlk==1){
    pg[10].text("- Pola Kerah Kemeja s",15,75);
    
    child.add("F111");
    child.add("F112");
  }
  else if(leherlk1.size()==10 && leherlk2.size()==6 && polaLeherlk1.size()==10 && templateLeherlk==2){
    pg[10].text("- Pola Kerah Sport S",15,75);
    
    child.add("I111");
  }
  else if(leherlk1.size()==13 && leherlk2.size()==8 && polaLeherlk1.size()==12 && templateLeherlk==3){
    pg[10].text("- Pola Kerah Shanghay S",15,75);
    
    child.add("G111");
  }
  else if(leherlk1.size()==10 && leherlk2.size()==6 && polaLeherlk1.size()==10 && templateLeherlk!=2 && templateLeherlk==4 ){
    pg[10].text("- Pola Kerah Shiller S",15,75);
    
    child.add("H111");
  }
  else if(leherlk1.size()==15 && leherlk2.size()==6 && polaLeherlk1.size()==14 && templateLeherlk==5 ){
    pg[10].text("- Pola Kerah Kemeja Boord Terusan S",15,75);
    
    child.add("E111");
  }
  else if(leherlk1.size()==8 && polaLeherlk1.size()==12 && polaLeherlk2.size()==12 && templateLeherlk!=1 && templateLeherlk==7){
    pg[10].text("- Pola Kerah Kemeja M",15,75);
    
    child.add("F121");
    child.add("F122");
  }
  else if(leherlk1.size()==10 && leherlk2.size()==6 && polaLeherlk1.size()==10 && templateLeherlk!=2 && 
  templateLeherlk!=4 && templateLeherlk==8){
    pg[10].text("- Pola Kerah Sport M",15,75);
    
    child.add("I121");
  }
  else if(leherlk1.size()==13 && leherlk2.size()==8 && polaLeherlk1.size()==12 && templateLeherlk!=3 && templateLeherlk==9){
    pg[10].text("- Pola Kerah Shanghay M",15,75);
    
    child.add("G121");
  }
  else if(leherlk1.size()==10 && leherlk2.size()==6 && polaLeherlk1.size()==10 && templateLeherlk!=2 && templateLeherlk!=4 
  && templateLeherlk!=8 && templateLeherlk==10){
    pg[10].text("- Pola Kerah Shiller M",15,75);
    
    child.add("H121");
  }
  else if(leherlk1.size()==15 && leherlk2.size()==6 && polaLeherlk1.size()==14 && templateLeherlk!=5 && templateLeherlk==11 ){
    pg[10].text("- Pola Kerah Kemeja Boord Terusan M",15,75);
    
    child.add("E121");
  }
  else if(leherlk1.size()==8 && polaLeherlk1.size()==12 && polaLeherlk2.size()==12 && templateLeherlk!=1 && templateLeherlk!=7 && templateLeherlk==13){
    pg[10].text("- Pola Kerah Kemeja L",15,75);
    
    child.add("F131");
    child.add("F132");
  }
  else if(leherlk1.size()==10 && leherlk2.size()==6 && polaLeherlk1.size()==10 && templateLeherlk!=2 && 
  templateLeherlk!=4 && templateLeherlk!=8 && templateLeherlk==14){
    pg[10].text("- Pola Kerah Sport L",15,75);
    
    child.add("I131");
  }
  else if(leherlk1.size()==13 && leherlk2.size()==8 && polaLeherlk1.size()==12 && templateLeherlk!=3 && templateLeherlk!=9 && templateLeherlk==15){
    pg[10].text("- Pola Kerah Shanghay L",15,75);
    
    child.add("G131");
  }
  else if(leherlk1.size()==10 && leherlk2.size()==6 && polaLeherlk1.size()==10 && templateLeherlk!=2 && templateLeherlk!=4 
  && templateLeherlk!=8 && templateLeherlk!=10 && templateLeherlk==16){
    pg[10].text("- Pola Kerah Shiller L",15,75);
    
    child.add("H131");
  }
  else if(leherlk1.size()==15 && leherlk2.size()==6 && polaLeherlk1.size()==14 && templateLeherlk!=5 && templateLeherlk!=11 && templateLeherlk==17){
    pg[10].text("- Pola Kerah Kemeja Boord Terusan L",15,75);
    
    child.add("E131");
  }
  
  if(lenganlk1.size()==6 && lenganlk2.size()==6 && polaLenganlk1.size()==11 && polaLenganlk2.size()==11 && templateLenganlk==1){
    pg[10].text("- Pola Lengan Licin Pendek S",15,100);
    
    child.add("L111");
    child.add("L112");
  }
  else if(lenganlk1.size()==8 && lenganlk2.size()==8 && polaLenganlk1.size()==11 && polaLenganlk2.size()==11 && templateLenganlk==2){
    pg[10].text("- Pola Lengan Licin Panjang S",15,100);
    
    child.add("L111");
    child.add("L112");
  }
  else if(lenganlk1.size()==6 && lenganlk2.size()==6  && garisLenganlk.size()==2  && garisLenganlk2.size()==2 
  && polaLenganlk1.size()==13 && polaLenganlk2.size()==13 && templateLenganlk==3){
    pg[10].text("- Pola Lengan Gladde Pendek S",15,100);
    
    child.add("J111");
    child.add("J112");
  }
  else if(lenganlk1.size()==8 && lenganlk2.size()==8  && garisLenganlk.size()==2  && garisLenganlk2.size()==2 
  && polaLenganlk1.size()==13 && polaLenganlk2.size()==13 && templateLenganlk==4){
    pg[10].text("- Pola Lengan Gladde Panjang S",15,100);
    
    child.add("K111");
    child.add("K112");
  }
  else if(lenganlk1.size()==6 && lenganlk2.size()==6 && polaLenganlk1.size()==11 && polaLenganlk2.size()==11 && templateLenganlk!=1 && templateLenganlk==5){
    pg[10].text("- Pola Lengan Licin Pendek M",15,100);
    
    child.add("L121");
    child.add("L122");
  }
  else if(lenganlk1.size()==8 && lenganlk2.size()==8 && polaLenganlk1.size()==11 && polaLenganlk2.size()==11 && templateLenganlk!=2 && templateLenganlk==6){
    pg[10].text("- Pola Lengan Licin Panjang M",15,100);
    
    child.add("M121");
    child.add("M122");
  }
  else if(lenganlk1.size()==6 && lenganlk2.size()==6  && garisLenganlk.size()==2  && garisLenganlk2.size()==2 
  && polaLenganlk1.size()==13 && polaLenganlk2.size()==13 && templateLenganlk!=3 && templateLenganlk==7){
    pg[10].text("- Pola Lengan Gladde Pendek M",15,100);
    
    child.add("J121");
    child.add("J122");
  }
  else if(lenganlk1.size()==8 && lenganlk2.size()==8  && garisLenganlk.size()==2  && garisLenganlk2.size()==2 
  && polaLenganlk1.size()==13 && polaLenganlk2.size()==13 && templateLenganlk!=4 && templateLenganlk==8){
    pg[10].text("- Pola Lengan Gladde Panjang M",15,100);
    
    child.add("K121");
    child.add("K122");
  }
  else if(lenganlk1.size()==6 && lenganlk2.size()==6 && polaLenganlk1.size()==11 && polaLenganlk2.size()==11 
  && templateLenganlk!=1 && templateLenganlk!=5 && templateLenganlk==9){
    pg[10].text("- Pola Lengan Licin Pendek L",15,100);
    
    child.add("L131");
    child.add("L132");
  }
  else if(lenganlk1.size()==8 && lenganlk2.size()==8 && polaLenganlk1.size()==11 && polaLenganlk2.size()==11 
  && templateLenganlk!=2 && templateLenganlk!=6 && templateLenganlk==10){
    pg[10].text("- Pola Lengan Licin Panjang L",15,100);
    
    child.add("M131");
    child.add("M132");
  }
  else if(lenganlk1.size()==6 && lenganlk2.size()==6  && garisLenganlk.size()==2  && garisLenganlk2.size()==2 
  && polaLenganlk1.size()==13 && polaLenganlk2.size()==13 && templateLenganlk!=3 && templateLenganlk!=7 && templateLenganlk==11){
    pg[10].text("- Pola Lengan Gladde Pendek L",15,100);
    
    child.add("J131");
    child.add("J132");
  }
  else if(lenganlk1.size()==8 && lenganlk2.size()==8  && garisLenganlk.size()==2  && garisLenganlk2.size()==2 
  && polaLenganlk1.size()==13 && polaLenganlk2.size()==13 && templateLenganlk!=4 && templateLenganlk!=8 && templateLenganlk==12){
    pg[10].text("- Pola Lengan Gladde Panjang L",15,100);
    
    child.add("K131");
    child.add("K132");
  }
  
  if(celanalk1.size()==4 && celanalk2.size()==9 && celanalk3.size()==12 && garisCelanalk.size()==6 && polaCelanalk1.size()==16 && 
  polaCelanalk2.size()==5 && polaCelanalk3.size()==16 && polaCelanalk4.size()==5 && polaCelanalk5.size()==11 && polaCelanalk6.size()==11 &&
  templateCelanalk==1){
    pg[10].text("- Pola Celana Pendek S",15,125);
    
    child.add("C111");
    child.add("C112");
    child.add("C113");
    child.add("C114");
    child.add("C115");
    child.add("C116");
  }
  else if(celanalk1.size()==4 && celanalk2.size()==9 && celanalk3.size()==12 && garisCelanalk.size()==6 && polaCelanalk1.size()==18 && 
  polaCelanalk2.size()==5 && polaCelanalk3.size()==18 && polaCelanalk4.size()==5 && polaCelanalk5.size()==13 && polaCelanalk6.size()==13 &&
  templateCelanalk==2){
    pg[10].text("- Pola Celana Panjang S",15,125);
    
    child.add("D111");
    child.add("D112");
    child.add("D113");
    child.add("D114");
    child.add("D115");
    child.add("D116");
  }
  else if(celanalk1.size()==4 && celanalk2.size()==9 && celanalk3.size()==12 && garisCelanalk.size()==6 && polaCelanalk1.size()==16 && 
  polaCelanalk2.size()==5 && polaCelanalk3.size()==16 && polaCelanalk4.size()==5 && polaCelanalk5.size()==11 && polaCelanalk6.size()==11 &&
  templateCelanalk!=1 && templateCelanalk==3){
    pg[10].text("- Pola Celana Pendek M",15,125);
    
    child.add("C121");
    child.add("C122");
    child.add("C123");
    child.add("C124");
    child.add("C125");
    child.add("C126");
  }
  else if(celanalk1.size()==4 && celanalk2.size()==9 && celanalk3.size()==12 && garisCelanalk.size()==6 && polaCelanalk1.size()==18 && 
  polaCelanalk2.size()==5 && polaCelanalk3.size()==18 && polaCelanalk4.size()==5 && polaCelanalk5.size()==13 && polaCelanalk6.size()==13 &&
  templateCelanalk!=2 && templateCelanalk==4){
    pg[10].text("- Pola Celana Panjang M",15,125);
    
    child.add("D121");
    child.add("D122");
    child.add("D123");
    child.add("D124");
    child.add("D125");
    child.add("D126");
  }
  else if(celanalk1.size()==4 && celanalk2.size()==9 && celanalk3.size()==12 && garisCelanalk.size()==6 && polaCelanalk1.size()==16 && 
  polaCelanalk2.size()==5 && polaCelanalk3.size()==16 && polaCelanalk4.size()==5 && polaCelanalk5.size()==11 && polaCelanalk6.size()==11 &&
  templateCelanalk!=1 && templateCelanalk!=3 && templateCelanalk==5){
    pg[10].text("- Pola Celana Pendek L",15,125);
    
    child.add("C131");
    child.add("C132");
    child.add("C133");
    child.add("C134");
    child.add("C135");
    child.add("C136");
  }
  else if(celanalk1.size()==4 && celanalk2.size()==9 && celanalk3.size()==12 && garisCelanalk.size()==6 && polaCelanalk1.size()==18 && 
  polaCelanalk2.size()==5 && polaCelanalk3.size()==18 && polaCelanalk4.size()==5 && polaCelanalk5.size()==13 && polaCelanalk6.size()==13 &&
  templateCelanalk!=2 && templateCelana!=4 && templateCelanalk==6){
    pg[10].text("- Pola Celana Panjang L",15,125);
    
    child.add("D131");
    child.add("D132");
    child.add("D133");
    child.add("D134");
    child.add("D135");
    child.add("D136");
  }
  
  if(atasan1.size()==19 && polaAtasan1.size()==22 && polaAtasan2.size()==22  && templateAtasan==1){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Baju Tanpa Bukaan S",15,50);
    
    child.add("A011");
    child.add("A012");
  }
  else if(atasan1.size()==19 && garisAtasan.size()==2 && polaAtasan1.size()==13 && polaAtasan2.size()==13 && polaAtasan3.size()==22  && templateAtasan==2){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Baju Bukaan Depan S",15,50);
    
    child.add("B011");
    child.add("B012");
    child.add("B013");
  }
  else if(atasan1.size()==19 && polaAtasan1.size()==22 && polaAtasan2.size()==13 && polaAtasan3.size()==13  && templateAtasan==3){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Baju Bukaan Belakang S",15,50);
    
    child.add("C011");
    child.add("C012");
    child.add("C013");
  }
  else if(atasan1.size()==19 && polaAtasan1.size()==22 && polaAtasan2.size()==22  && templateAtasan!=1 && templateAtasan==4){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Baju Tanpa Bukaan M",15,50);
  
    child.add("A021");
    child.add("A022");
  }
  else if(atasan1.size()==19 && garisAtasan.size()==2 && polaAtasan1.size()==13 && polaAtasan2.size()==13 && polaAtasan3.size()==22  && templateAtasan!=2 && templateAtasan==5){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Baju Bukaan Depan M",15,50);
    
    child.add("B021");
    child.add("B022");
    child.add("B023");
  }
  else if(atasan1.size()==19 && polaAtasan1.size()==22 && polaAtasan2.size()==13 && polaAtasan3.size()==13  && templateAtasan!=3 && templateAtasan==6){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Baju Bukaan Belakang M",15,50);
    
    child.add("C021");
    child.add("C022");
    child.add("C023");
  }
  else if(atasan1.size()==19 && polaAtasan1.size()==22 && polaAtasan2.size()==22  && templateAtasan!=1 && templateAtasan!=4 && templateAtasan==7){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Baju Tanpa Bukaan L",15,50);
    
    child.add("A031");
    child.add("A032");
  }
  else if(atasan1.size()==19 && garisAtasan.size()==2 && polaAtasan1.size()==13 && polaAtasan2.size()==13 && 
  polaAtasan3.size()==22  && templateAtasan!=2 && templateAtasan!=5 && templateAtasan==8){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Baju Bukaan Depan L",15,50);
    
    child.add("B031");
    child.add("B032");
    child.add("B033");
  }
  else if(atasan1.size()==19 && polaAtasan1.size()==22 && polaAtasan2.size()==13 && polaAtasan3.size()==13  && templateAtasan!=3 && templateAtasan!=6 && templateAtasan==9){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Baju Bukaan Belakang L",15,50);
    
    child.add("C031");
    child.add("C032");
    child.add("C033");
  }
  
  if(leher1.size()==8 && polaLeher1.size()==12 && polaLeher2.size()==12 && templateLeher==1){
    pg[10].text("- Pola Kerah Kemeja S",15,75);
    
    child.add("M011");
    child.add("M012");
  }
  else if(leher1.size()==10 && leher2.size()==6 && polaLeher1.size()==10 && templateLeher==2){
    pg[10].text("- Pola Kerah Sport S",15,75);
    
    child.add("P011");
  }
  else if(leher1.size()==13 && leher2.size()==8 && polaLeher1.size()==12 && templateLeher==3){
    pg[10].text("- Pola Kerah Shanghay S",15,75);
    
    child.add("N011");
  }
  else if(leher1.size()==10 && leher2.size()==6 && polaLeher1.size()==10 && templateLeher!=2 && templateLeher==4 ){
    pg[10].text("- Pola Kerah Shiller S",15,75);
    
    child.add("O011");
  }
  else if(leher1.size()==15 && leher2.size()==6 && polaLeher1.size()==14 && templateLeher==5){
    pg[10].text("- Pola Kerah Kemeja Boord Terusan S",15,75);
    
    child.add("L011");
  }
  else if(leher1.size()==8 && polaLeher1.size()==12 && polaLeher2.size()==12 && templateLeher!=1 && templateLeher==7){
    pg[10].text("- Pola Kerah Kemeja M",15,75);
    
    child.add("M021");
    child.add("M022");
  }
  else if(leher1.size()==10 && leher2.size()==6 && polaLeher1.size()==10 && templateLeher!=2 && templateLeher!=4 && templateLeher==8){
    pg[10].text("- Pola Kerah Sport M",15,75);
    
    child.add("P021");
  }
  else if(leher1.size()==13 && leher2.size()==8 && polaLeher1.size()==12 && templateLeher!=3 && templateLeher==9){
    pg[10].text("- Pola Kerah Shanghay M",15,75);
    
    child.add("N021");
  }
  else if(leher1.size()==10 && leher2.size()==6 && polaLeher1.size()==10 && templateLeher!=2 && templateLeher!=4 && templateLeher!=8 && templateLeher==10 ){
    pg[10].text("- Pola Kerah Shiller M",15,75);
    
    child.add("O021");
  }
  else if(leher1.size()==15 && leher2.size()==6 && polaLeher1.size()==14 && templateLeher!=5 && templateLeher==11){
    pg[10].text("- Pola Kerah Kemeja Boord Terusan M",15,75);
    
    child.add("L021");
  }
  else if(leher1.size()==8 && polaLeher1.size()==12 && polaLeher2.size()==12 && templateLeher!=1 && templateLeher!=7 && templateLeher==13){
    pg[10].text("- Pola Kerah Kemeja L",15,75);
    
    child.add("M031");
    child.add("M032");
  }
  else if(leher1.size()==10 && leher2.size()==6 && polaLeher1.size()==10 && templateLeher!=2 && templateLeher!=4 && templateLeher!=8 
  && templateLeher!=10 && templateLeher==14){
    pg[10].text("- Pola Kerah Sport L",15,75);
    
    child.add("P031");
  }
  else if(leher1.size()==13 && leher2.size()==8 && polaLeher1.size()==12 && templateLeher!=3 && templateLeher!=9 && templateLeher==15){
    pg[10].text("- Pola Kerah Shanghay L",15,75);
    
    child.add("N031");
  }
  else if(leher1.size()==10 && leher2.size()==6 && polaLeher1.size()==10 && templateLeher!=2 && templateLeher!=4 && templateLeher!=8 
  && templateLeher!=10 && templateLeher!=14 && templateLeher==16){
    pg[10].text("- Pola Kerah Shiller L",15,75);
    
    child.add("O031");
  }
  else if(leher1.size()==15 && leher2.size()==6 && polaLeher1.size()==14 && templateLeher!=5 && templateLeher!=11 && templateLeher==17){
    pg[10].text("- Pola Kerah Kemeja Boord Terusan L",15,75);
    
    child.add("L031");
  }
  
  if(celana1.size()==4 && celana2.size()==9 && garisCelana.size()==6 && polaCelana1.size()==16 && 
  polaCelana2.size()==5 && polaCelana3.size()==16 && polaCelana4.size()==5 && polaCelana5.size()==11 && polaCelana6.size()==11 &&
  templateCelana==1){
    pg[10].text("- Pola Celana Pendek S",15,150);
    
    child.add("J011");
    child.add("J012");
    child.add("J013");
    child.add("J014");
    child.add("J015");
    child.add("J016");
  }
  else if(celana1.size()==4 && celana2.size()==9 && garisCelana.size()==6 && polaCelana1.size()==18 && 
  polaCelana2.size()==5 && polaCelana3.size()==18 && polaCelana4.size()==5 && polaCelana5.size()==13 && polaCelana6.size()==13 &&
  templateCelana==2){
    pg[10].text("- Pola Celana Panjang S",15,150);
    
    child.add("K011");
    child.add("K012");
    child.add("K013");
    child.add("K014");
    child.add("K015");
    child.add("K016");
  }
  else if(celana1.size()==4 && celana2.size()==9 && garisCelana.size()==6 && polaCelana1.size()==16 && 
  polaCelana2.size()==5 && polaCelana3.size()==16 && polaCelana4.size()==5 && polaCelana5.size()==11 && polaCelana6.size()==11 &&
  templateCelana!=1 && templateCelana==3){
    pg[10].text("- Pola Celana Pendek M",15,150);
    
    child.add("J021");
    child.add("J022");
    child.add("J023");
    child.add("J024");
    child.add("J025");
    child.add("J026");
  }
  else if(celana1.size()==4 && celana2.size()==9 && garisCelana.size()==6 && polaCelana1.size()==18 && 
  polaCelana2.size()==5 && polaCelana3.size()==18 && polaCelana4.size()==5 && polaCelana5.size()==13 && polaCelana6.size()==13 &&
  templateCelana!=2 && templateCelana==4){
    pg[10].text("- Pola Celana Panjang M",15,150);
    
    child.add("K021");
    child.add("K022");
    child.add("K023");
    child.add("K024");
    child.add("K025");
    child.add("K026");
  }
  else if(celana1.size()==4 && celana2.size()==9 && garisCelana.size()==6 && polaCelana1.size()==16 && 
  polaCelana2.size()==5 && polaCelana3.size()==16 && polaCelana4.size()==5 && polaCelana5.size()==11 && polaCelana6.size()==11 &&
  templateCelana!=1 && templateCelana!=3 && templateCelana==5){
    pg[10].text("- Pola Celana Pendek L",15,150);
    
    child.add("J031");
    child.add("J032");
    child.add("J033");
    child.add("J034");
    child.add("J035");
    child.add("J036");
  }
  else if(celana1.size()==4 && celana2.size()==9 && garisCelana.size()==6 && polaCelana1.size()==18 && 
  polaCelana2.size()==5 && polaCelana3.size()==18 && polaCelana4.size()==5 && polaCelana5.size()==13 && polaCelana6.size()==13 &&
  templateCelana!=2 && templateCelana!=4 && templateCelana==6){
    pg[10].text("- Pola Celana Panjang L",15,150);
    
    child.add("K031");
    child.add("K032");
    child.add("K033");
    child.add("K034");
    child.add("K035");
    child.add("K036");
  }
  
  if(rok1.size()==4 && rok2.size()==6 && garisRok.size()==4 && polaRok1.size()==14 && polaRok2.size()==14 && polaRok3.size()==4 && templateRok==1){
    pg[10].text("- Pola Rok Standar Pendek S",15,125);
    
    child.add("D011");
    child.add("D012");
    child.add("D013");
  }
  else if(rok1.size()==4 && rok2.size()==6 && garisRok.size()==4 && polaRok1.size()==14 && polaRok2.size()==14 && polaRok3.size()==4 && templateRok!=1
  && templateRok==2){
    pg[10].text("- Pola Rok Standar Panjang S",15,125);
    
    child.add("E011");
    child.add("E012");
    child.add("E013");
  }
  else if(rok1.size()==4 && rok2.size()==6 && polaRok1.size()==14 && polaRok2.size()==4 && polaRok3.size()==11 && polaRok4.size()==11 && templateRok==3){
    pg[10].text("- Pola Rok Bukaan Belakang Pendek S",15,125);
    
    child.add("F011");
    child.add("F012");
    child.add("F013");
    child.add("F014");
  }
  else if(rok1.size()==4 && rok2.size()==6 && polaRok1.size()==14 && polaRok2.size()==4 && polaRok3.size()==11 && polaRok4.size()==11 && templateRok!=3 && templateRok==4){
    pg[10].text("- Pola Rok Bukaan Belakang Panjang S",15,125);
    
    child.add("G011");
    child.add("G012");
    child.add("G013");
    child.add("G014");
  }
  else if(rok1.size()==4 && rok2.size()==9 && garisRok.size()==6 && polaRok1.size()==16 && polaRok2.size()==16 && polaRok3.size()==4 && templateRok==5){
    pg[10].text("- Pola Rok Lipit Hadap I Pendek S",15,125);
    
    child.add("H011");
    child.add("H012");
    child.add("H013");
  }
  else if(rok1.size()==4 && rok2.size()==9 && garisRok.size()==6 && polaRok1.size()==16 && polaRok2.size()==16 && polaRok3.size()==4 && templateRok!=5 && templateRok==6){
    pg[10].text("- Pola Rok Lipit Hadap I Panjang S",15,125);
    
    child.add("I011");
    child.add("I012");
    child.add("I013");
  }
  else if(rok1.size()==4 && rok2.size()==6 && garisRok.size()==4 && polaRok1.size()==14 && polaRok2.size()==14 && polaRok3.size()==4 && templateRok!=1 && templateRok!=2 && templateRok==7){
    pg[10].text("- Pola Rok Standar Pendek M",15,125);
    
    child.add("D021");
    child.add("D022");
    child.add("D023");
  }
  else if(rok1.size()==4 && rok2.size()==6 && garisRok.size()==4 && polaRok1.size()==14 && polaRok2.size()==14 && polaRok3.size()==4 && templateRok!=1
  && templateRok!=2  && templateRok!=7  && templateRok==8){
    pg[10].text("- Pola Rok Standar Panjang M",15,125);
    
    child.add("E021");
    child.add("E022");
    child.add("E023");
  }
  else if(rok1.size()==4 && rok2.size()==6 && polaRok1.size()==14 && polaRok2.size()==4 && polaRok3.size()==11 
  && polaRok4.size()==11 && templateRok!=3 && templateRok!=4  && templateRok==9 ){
    pg[10].text("- Pola Rok Bukaan Belakang Pendek M",15,125);
    
    child.add("F021");
    child.add("F022");
    child.add("F023");
    child.add("F024");
  }
  else if(rok1.size()==4 && rok2.size()==6 && polaRok1.size()==14 && polaRok2.size()==4 && polaRok3.size()==11 
  && polaRok4.size()==11 && templateRok!=3 && templateRok!=4  && templateRok!=9 && templateRok==10 ){
    pg[10].text("- Pola Rok Bukaan Belakang Panjang M",15,125);
    
    child.add("G021");
    child.add("G022");
    child.add("G023");
    child.add("G024");
  }
  else if(rok1.size()==4 && rok2.size()==9 && garisRok.size()==6 && polaRok1.size()==16 && polaRok2.size()==16 && polaRok3.size()==4 
  && templateRok!=5 && templateRok!=6  && templateRok==11  ){
    pg[10].text("- Pola Rok Lipit Hadap I Pendek M",15,125);
    
    child.add("H021");
    child.add("H022");
    child.add("H023");
  }
  else if(rok1.size()==4 && rok2.size()==9 && garisRok.size()==6 && polaRok1.size()==16 && polaRok2.size()==16 && polaRok3.size()==4 
  && templateRok!=5 && templateRok!=6  && templateRok!=11  && templateRok==12){
    pg[10].text("- Pola Rok Lipit Hadap I Panjang M",15,125);
    
    child.add("I021");
    child.add("I022");
    child.add("I023");
  }
  else if(rok1.size()==4 && rok2.size()==6 && garisRok.size()==4 && polaRok1.size()==14 && polaRok2.size()==14 && 
  polaRok3.size()==4 && templateRok!=1 && templateRok!=7 && templateRok!=2 && templateRok!=8 && templateRok==13){
    pg[10].text("- Pola Rok Standar Pendek L",15,125);
    
    child.add("D031");
    child.add("D032");
    child.add("D033");
  }
  else if(rok1.size()==4 && rok2.size()==6 && garisRok.size()==4 && polaRok1.size()==14 && polaRok2.size()==14 && 
  polaRok3.size()==4 && templateRok!=1 && templateRok!=7 && templateRok!=2 && templateRok!=8 && templateRok!=13 && templateRok==14){
    pg[10].text("- Pola Rok Standar Pendek L",15,125);
    
    child.add("E031");
    child.add("E032");
    child.add("E033");
  }
 else if(rok1.size()==4 && rok2.size()==6 && polaRok1.size()==14 && polaRok2.size()==4 && polaRok3.size()==11 && polaRok4.size()==11 && templateRok!=3 && templateRok!=4 && templateRok!=9  && templateRok!=9 && templateRok!=9 && templateRok==15){
    pg[10].text("- Pola Rok Bukaan Belakang Pendek L",15,125);
    
    child.add("F031");
    child.add("F032");
    child.add("F033");
    child.add("F034");
  }
  else if(rok1.size()==4 && rok2.size()==6 && polaRok1.size()==14 && polaRok2.size()==4 && polaRok3.size()==11 
  && polaRok4.size()==11 && templateRok!=3 && templateRok!=4  && templateRok!=9 && templateRok!=10 && templateRok!=15 && templateRok==16){
    pg[10].text("- Pola Rok Bukaan Belakang Panjang L ",15,125);
    
    child.add("G031");
    child.add("G032");
    child.add("G033");
    child.add("G034");
  }
   else if(rok1.size()==4 && rok2.size()==9 && garisRok.size()==6 && polaRok1.size()==16 && polaRok2.size()==16 && polaRok3.size()==4 
  && templateRok!=5 && templateRok!=6  && templateRok!=11   && templateRok!=12  && templateRok==17){
    pg[10].text("- Pola Rok Lipit Hadap I Pendek L",15,125);
    
    child.add("H031");
    child.add("H032");
    child.add("H033");
  }
   else if(rok1.size()==4 && rok2.size()==9 && garisRok.size()==6 && polaRok1.size()==16 && polaRok2.size()==16 && polaRok3.size()==4 
  && templateRok!=5 && templateRok!=6  && templateRok!=11   && templateRok!=12  && templateRok!=17   && templateRok==18){
    pg[10].text("- Pola Rok Lipit Hadap I Pendek L",15,125);
    
    child.add("I031");
    child.add("I032");
    child.add("I033");
  }
  
  if(lengan1.size()==9 && lengan2.size()==9 && lengan3.size()==4  && lengan4.size()==4 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan==1){
    pg[10].text("- Pola Lengan Gelembung Pendek S",15,100);
    
    child.add("S011");
    child.add("S012");
    child.add("S013");
    child.add("S014");
  }
  else if(lengan1.size()==9 && lengan2.size()==4 && lengan3.size()==9  && lengan4.size()==4 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan==2){
    pg[10].text("- Pola Lengan Gelembung Panjang S",15,100);
    
    child.add("T011");
    child.add("T012");
    child.add("T013");
    child.add("T014");
  }
  else if(lengan1.size()==9 && lengan2.size()==9 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan==3){
    pg[10].text("- Pola Lengan Gelembung Atas Pendek S",15,100);
    
    child.add("Q011");
    child.add("Q012");
    child.add("Q013");
    child.add("Q014");
  }
  else if(lengan1.size()==9 && lengan2.size()==9 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan!=3 && templateLengan==4){
    pg[10].text("- Pola Lengan Gelembung Atas Panjang S",15,100);
    
    child.add("R011");
    child.add("R012");
    child.add("R013");
    child.add("R014");
  }
  else if(lengan1.size()==6 && lengan2.size()==6 && polaLengan1.size()==11 && polaLengan2.size()==11 
   && templateLengan==5){
    pg[10].text("- Pola Lengan Licin Pendek S",15,100);
    
    child.add("W011");
    child.add("W012");
  }
  else if(lengan1.size()==8 && lengan2.size()==8 && polaLengan1.size()==11 && polaLengan2.size()==11 
  && templateLengan==6){
    pg[10].text("- Pola Lengan Licin Panjang S",15,100);
    
    child.add("X011");
    child.add("X012");
  }
  else if(lengan1.size()==5 && lengan2.size()==6  && garisLengan.size()==2  && garisLengan2.size()==2 && polaLengan1.size()==13 && polaLengan2.size()==13 
  && templateLengan==7){
    pg[10].text("- Pola Lengan Gladde Pendek S",15,100);
    
    child.add("U011");
    child.add("U012");
  }
  else if(lengan1.size()==7 && lengan2.size()==8  && garisLengan.size()==2  && garisLengan2.size()==2 && polaLengan1.size()==13 && polaLengan2.size()==13 
  && templateLengan==8){
    pg[10].text("- Pola Lengan Gladde Panjang S",15,100);
    
    child.add("V011");
    child.add("V012");
  }
  
  else if(lengan1.size()==9 && lengan2.size()==9 && lengan3.size()==4  && lengan4.size()==4 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan!=1 && templateLengan==9){
    pg[10].text("- Pola Lengan Gelembung Pendek M",15,100);
    
    child.add("S021");
    child.add("S022");
    child.add("S023");
    child.add("S024");
  }
  else if(lengan1.size()==9 && lengan2.size()==4 && lengan3.size()==9  && lengan4.size()==4 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan!=2 && templateLengan==10){
    pg[10].text("- Pola Lengan Gelembung Panjang M",15,100);
    
    child.add("T021");
    child.add("T022");
    child.add("T023");
    child.add("T024");
  }
  else if(lengan1.size()==9 && lengan2.size()==9 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan!=3  && templateLengan!=4 && templateLengan==11){
    pg[10].text("- Pola Lengan Gelembung Atas Pendek M",15,100);
    
    child.add("Q021");
    child.add("Q022");
    child.add("Q023");
    child.add("Q024");
  }
  else if(lengan1.size()==9 && lengan2.size()==9 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan!=3 && templateLengan!=4  && templateLengan==12){
    pg[10].text("- Pola Lengan Gelembung Atas Panjang M",15,100);
    
    child.add("R021");
    child.add("R022");
    child.add("R023");
    child.add("R024");
  }
  else if(lengan1.size()==6 && lengan2.size()==6 && polaLengan1.size()==10 && polaLengan2.size()==11 
  && templateLengan==13){
    pg[10].text("- Pola Lengan Licin Pendek M",15,100);
    
    child.add("W021");
    child.add("W022");
  }
  else if(lengan1.size()==8 && lengan2.size()==8 && polaLengan1.size()==11 && polaLengan2.size()==11 
  && templateLengan!=6 && templateLengan!=13  && templateLengan==14){
    pg[10].text("- Pola Lengan Licin Panjang M",15,100);
    
    child.add("X021");
    child.add("X022");
  }
  else if(lengan1.size()==5 && lengan2.size()==6  && garisLengan.size()==2  && garisLengan2.size()==2 && polaLengan1.size()==13 && polaLengan2.size()==13 
  && templateLengan!=7 && templateLengan==15){
    pg[10].text("- Pola Lengan Gladde Pendek M",15,100);
    
    child.add("U021");
    child.add("U022");
  }
  else if(lengan1.size()==7 && lengan2.size()==8  && garisLengan.size()==2  && garisLengan2.size()==2 && polaLengan1.size()==13 && polaLengan2.size()==13 
  && templateLengan!=8 && templateLengan==16){
    pg[10].text("- Pola Lengan Gladde Panjang M",15,100);
    
    child.add("V021");
    child.add("V022");
  }
   
  else if(lengan1.size()==9 && lengan2.size()==9 && lengan3.size()==4  && lengan4.size()==4 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan!=1 && templateLengan!=9 && templateLengan==17){
    pg[10].text("- Pola Lengan Gelembung Pendek L",15,100);
    
    child.add("S031");
    child.add("S032");
    child.add("S033");
    child.add("S034");
  }
  else if(lengan1.size()==9 && lengan2.size()==4 && lengan3.size()==9  && lengan4.size()==4 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan!=2 && templateLengan!=10 && templateLengan==18){
    pg[10].text("- Pola Lengan Gelembung Panjang L",15,100);
    
    child.add("T031");
    child.add("T032");
    child.add("T033");
    child.add("T034");
  }
  else if(lengan1.size()==9 && lengan2.size()==9 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan!=3  && templateLengan!=4 && templateLengan!=11 && templateLengan==19){
    pg[10].text("- Pola Lengan Gelembung Atas Pendek L",15,100);
    
    child.add("Q031");
    child.add("Q032");
    child.add("Q033");
    child.add("Q034");
  }
  else if(lengan1.size()==9 && lengan2.size()==9 && polaLengan1.size()==12 && polaLengan2.size()==12 
  && polaLengan3.size()==4 && templateLengan!=3 && templateLengan!=4  && templateLengan!=11  && templateLengan!=12  && templateLengan==20){
    pg[10].text("- Pola Lengan Gelembung Atas Panjang L",15,100);
    
    child.add("R031");
    child.add("R032");
    child.add("R033");
    child.add("R034");
  }
  else if(lengan1.size()==6 && lengan2.size()==6 && polaLengan1.size()==11 && polaLengan2.size()==11 
  && templateLengan!=5 && templateLengan!=13 && templateLengan==21){
    pg[10].text("- Pola Lengan Licin Pendek L",15,100);
    
    child.add("W031");
    child.add("W032");
  }
  else if(lengan1.size()==8 && lengan2.size()==8 && polaLengan1.size()==11 && polaLengan2.size()==11 
  && templateLengan!=6 && templateLengan!=14 && templateLengan==22){
    pg[10].text("- Pola Lengan Licin Panjang L",15,100);
    
    child.add("X031");
    child.add("X032");
  }
  else if(lengan1.size()==5 && lengan2.size()==6  && garisLengan.size()==2  && garisLengan2.size()==2 && polaLengan1.size()==13 && polaLengan2.size()==13 
  && templateLengan!=7 && templateLengan!=15 && templateLengan==23){
    pg[10].text("- Pola Lengan Gladde Pendek L",15,100);
    
    child.add("U031");
    child.add("U032");
  }
  else if(lengan1.size()==7 && lengan2.size()==8  && garisLengan.size()==2  && garisLengan2.size()==2 && polaLengan1.size()==13 && polaLengan2.size()==13 
  && templateLengan!=8 && templateLengan!=16 && templateLengan==24){
    pg[10].text("- Pola Lengan Gladde Panjang L",15,100);
    
    child.add("V031");
  child.add("V032");
  } 
  
  if(gaun1.size()==17 && garisGaun.size()==4 && polaGaun1.size()==14 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && polaGaun5.size()==14 && templateGaun==1){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Bukaan Depan Pendek S",15,175);
    
    child.add("AC011");
    child.add("AC012");
    child.add("AC013");
    child.add("AC014");
    child.add("AC015");
  }
  else if(gaun1.size()==17 && garisGaun.size()==4 && polaGaun1.size()==14 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14
  && polaGaun5.size()==14 && templateGaun!=1 && templateGaun==2){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Bukaan Depan Panjang S",15,175);
    
    child.add("AD011");
    child.add("AD012");
    child.add("AD013");
    child.add("AD014");
    child.add("AD015");
  }
  else if(gaun1.size()==17 && polaGaun1.size()==25 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && templateGaun==3){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Tanpa Bukaan Pendek S",15,175);
    
    child.add("AA011");
    child.add("AA012");
    child.add("AA013");
    child.add("AA014");
  }
  else if(gaun1.size()==17 && polaGaun1.size()==25 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && templateGaun!=3   && templateGaun==4){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Tanpa Bukaan Panjang S",15,175);
    
    child.add("AB011");
    child.add("AB012");
    child.add("AB013");
    child.add("AB014");
  }
  
  else if(gaun1.size()==17 && garisGaun.size()==4 && polaGaun1.size()==14 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && polaGaun5.size()==14 && templateGaun!=1 && templateGaun!=2 && templateGaun==5){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Bukaan Depan Pendek M",15,175);
    
    child.add("AC021");
    child.add("AC022");
    child.add("AC023");
    child.add("AC024");
    child.add("AC025");
  }
  else if(gaun1.size()==17 && garisGaun.size()==4 && polaGaun1.size()==14 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && polaGaun5.size()==14 && templateGaun!=1 && templateGaun!=2 && templateGaun!=5 && templateGaun==6){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Bukaan Depan Panjang M",15,175);
    
    child.add("AD021");
    child.add("AD022");
    child.add("AD023");
    child.add("AD024");
    child.add("AD025");
  }
  else if(gaun1.size()==17 && polaGaun1.size()==25 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && templateGaun!=3 && templateGaun!=4  && templateGaun==7){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Tanpa Bukaan Pendek M",15,175);
    
    child.add("AA021");
    child.add("AA022");
    child.add("AA023");
    child.add("AA024");
  }
  else if(gaun1.size()==17 && polaGaun1.size()==25 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && templateGaun!=3   && templateGaun!=4 && templateGaun!=7  && templateGaun==8){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Tanpa Bukaan Panjang M",15,175);
    
    child.add("AB021");
    child.add("AB022");
    child.add("AB023");
    child.add("AB024");
  }
  
  else if(gaun1.size()==17 && garisGaun.size()==4 && polaGaun1.size()==14 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && polaGaun5.size()==14 && templateGaun!=1 && templateGaun!=2 && templateGaun!=5 && templateGaun!=6 && templateGaun==9){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Bukaan Depan Pendek L",15,175);
    
    child.add("AC031");
    child.add("AC032");
    child.add("AC033");
    child.add("AC034");
    child.add("AC035");
  }
  else if(gaun1.size()==17 && garisGaun.size()==4 && polaGaun1.size()==14 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && polaGaun5.size()==14 && templateGaun!=1 && templateGaun!=2 && templateGaun!=5 && templateGaun!=6 && templateGaun!=9 && templateGaun==10){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Bukaan Depan Panjang L",15,175);
    
    child.add("AD031");
    child.add("AD032");
    child.add("AD033");
    child.add("AD034");
    child.add("AD035");
  }
  else if(gaun1.size()==17 && polaGaun1.size()==25 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && templateGaun!=3 && templateGaun!=4  && templateGaun!=7 && templateGaun!=8 && templateGaun==11){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Tanpa Bukaan Pendek L",15,175);
    
    child.add("AA031");
    child.add("AA032");
    child.add("AA033");
    child.add("AA034");
  }
  else if(gaun1.size()==17 && polaGaun1.size()==25 && polaGaun2.size()==14 && polaGaun3.size()==25 && polaGaun4.size()==14 
  && templateGaun!=3   && templateGaun!=4 && templateGaun!=7  && templateGaun!=8 && templateGaun!=11 && templateGaun==12){
    pg[10].text("Wanita",190,25);
    pg[10].text("- Pola Gaun Tanpa Bukaan Panjang L",15,175);
    
    child.add("AB031");
    child.add("AB032");
    child.add("AB033");
    child.add("AB034");
  }
  
  println(child);
  for(int z=0;z<child.size();z++){
    pg[10].text(child.get(z)+" ",15+z*60,155);
  }
  
  pg[10].stroke(0);
  pg[10].endDraw();
}

public void keyPressed() {
  if (key == CODED) {
    if (keyCode == CONTROL) 
      controlDown = true;
    if (keyCode == SHIFT)
      shiftDown = true;
    return;
  }

  if (key=='g')                  showGrid();
  if(key=='p' || key=='P')       myPrinter.StartPrinting();
  if (key=='s' || key=='S')      saveProject();
  if (key=='n' || key=='N')      newProject();
  if (key=='o' || key=='O')      openProject();
  if (key=='q' || key=='Q')      exit();
  if (key=='w' || key=='W')      pg[3].save("/SS/OutputVisualisasiPola1.jpg");
  if(key=='v' || key=='V')       pg[2].save("/SS/OutputRancangan.jpg");
}

public void keyReleased() {
  if (key == CODED) {
    if (keyCode == CONTROL)
      controlDown = false;
    if (keyCode == SHIFT)
      shiftDown = false;
  }
}

public void evalMenu(int menuResult1) {
  switch(menuResult1) {
  case 0: 
    print("\nNew Project");
    newProject();
    pgTex1 = false;
    pgTex2 = false;
    pgOpt = false;
    break; 
  case 1:
    print("\nOpen");
    openProject();
    base();
    base1();
   
    break; 
  case 2:
    print("\nSave");
    saveProject();
    break;
    
  case 3:
    print("\nPrint");
    myPrinter.StartPrinting();
    break;
  case 4:
    print("\nTutorial");
    pgTex1 = false;
    pgTex2 = false;
    pgRok = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgTutor = true;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;
  case 5:
    print("\nClose");
    exit();
    break;

  case 100: 
    print("\nSmall");
    pgTex1 = false;
    pgTex2 = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgTutor = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgCelanaLk = false;
    pgAtasanLk = false;
    pgOpt = false;
    size=1;
    reload();
    break;
  case 101: 
    print("\nMedium");
    pgTex1 = false;
    pgTex2 = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgTutor = false;
    pgAtasan = false;
    pgAtasanLk = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgCelanaLk = false;
    pgOpt = false;
    size=2;
    reload();
    break;
  case 102: 
    print("\nLarge");
     pgTex1 = false;
    pgTex2 = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgTutor = false;
    pgAtasan = false;
    pgAtasanLk = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgCelanaLk = false;
    pgOpt = false;
    size=3;
    reload();
    break;
    
   case 600: 
    print("\nWanita");
    pgTex1 = false;
    pgTex2 = false;
    pgUkuranW = true;
    pgUkuranP = false;
    pgRok = false;
    pgTutor = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgCelanaLk = false;
    pgAtasanLk = false;
    pgOpt = false;
    break;
  case 601: 
    print("\nPria");
    pgTex1 = false;
    pgTex2 = false;
    pgUkuranW = false;
    pgUkuranP = true;
    pgRok = false;
    pgTutor = false;
    pgAtasan = false;
    pgAtasanLk = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;
  case 602: 
    print("\nShow Grid");
    showGrid();
    break;  

  case 200: 
    print("\nBaju");
    pgTex1 = false;
    pgTex2 = false;
    pgTutor = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgAtasan = true;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;
    
   case 201: 
    print("\nKerah");
    pgTex1 = false;
    pgTex2 = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgTutor = false;
    pgRok = false;
    pgAtasan = false;
    pgLeher = true;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;
    
  case 202: 
    print("\nLengan");
    pgTex1 = false;
    pgTex2 = false;
    pgTutor = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = true;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;

  case 203: 
    print("\nRok");
    pgTex1 = false;
    pgTex2 = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgTutor = false;
    pgRok = true;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;

  case 204: 
    print("\nGaun");
    pgTex1 = false;
    pgTex2 = false;
    pgTutor = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = true;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;

  case 205: 
    print("\nCelana");
    pgTex1 = false;
    pgTex2 = false;
    pgTutor = false;
    pgRok = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = true;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;

  case 300: 
    print("\nBaju");
    pgTex1 = false;
    pgTex2 = false;
    pgTutor = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = true;
    pgCelanaLk = false;
    pgOpt = false;
    break;
    
  case 301: 
    print("\nKerah");
    pgTex1 = false;
    pgTex2 = false;
    pgTutor = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = true;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;
    
  case 302: 
    print("\nLengan");
    pgTex1 = false;
    pgTex2 = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgTutor = false;
    pgRok = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = true;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    break;

  case 303: 
    print("\nCelana");
    pgTex1 = false;
    pgTex2 = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgTutor = false;
    pgRok = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = true;
    pgOpt = false;
    break;

  case 400: 
    print("\nTekstur 1");
    pgTex1 = true;
    pgTex2 = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgTutor = false;
    pgRok = false;
    pgAtasan = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    setPgTexture(imgtex1);
    break; 
    
  case 401:
    print("\nTekstur 2");
    pgTex1 = false;
    pgTex2 = true;
    pgTutor = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgAtasan = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = false;
    setPgTexture(imgtex2);
    break; 
  
  //davin
  case 500:
    print("\nOptimasi");
    pgTex1 = false;
    pgTex2 = false;
    pgTutor = false;
    pgUkuranW = false;
    pgUkuranP = false;
    pgRok = false;
    pgLeher = false;
    pgLengan = false;
    pgLeherLk = false;
    pgLenganLk = false;
    pgAtasan = false;
    pgGaun = false;
    pgCelana = false;
    pgAtasanLk = false;
    pgCelanaLk = false;
    pgOpt = true;
    drawPgOpt();
    break; 
    
  case -1:
    break;
  default:
    // ERROR 
    println ("\nError 277 with " + menuResult1);
    exit();
    break;
  }
}

public void showGrid() {
  if (!grid2D) grid2D = true;
  else grid2D = false;
}

public void saveProject() {
  File defaultFileName = new File(sketchPath("")+"/Saved Projects"+"/Project.txt");
  selectOutput("Save Project as: ", "fileSelectedForSave", defaultFileName);
}

public void drawPgMenuBar() {
  pg[1].beginDraw();
  pg[1].background(25);
  pg[1].fill(0xffD30F0F);
  pg[1].rect(width-40, 0, width, pg[1].height);
  pg[1].stroke(255);
  pg[1].line(width-25, 8, width-15, 17);
  pg[1].line(width-25, 17, width-15, 8);
  pg[1].endDraw();
}

public void drawPgVisualisasiPola() {
  pg[2].beginDraw();
  pg[2].background(200);
  if (grid2D) {
    pg[2].strokeWeight(1);
    pg[2].stroke(135);
    int i=0;
    while (i<=pg[2].width) {
      pg[2].line(i, 0, i, pg[2].height);
      i+=25;
    }
    int j=0;
    while (j<=pg[2].height) {
      pg[2].line(0, j, width, j);
      j+=25;
    }
  }
  pg[2].stroke(255);
  pg[2].strokeWeight(1);
  pg[2].endDraw();
}

public void drawPgVisualisasiBusana() {
  pg[3].beginDraw();
  pg[3].background(100);
  pg[3].textSize(18);
  pg[3].stroke(255);
  pg[3].text("Rancangan Busana", 25, 50);
  pg[3].strokeWeight(1);
  pg[3].noFill();
  pg[3].curve(pg[3].width/2+50, 50, pg[3].width/2+50, 50, pg[3].width/2+20, 150, pg[3].width/2-40, 180);
  pg[3].curve(pg[3].width/2+50, 50, pg[3].width/2+20, 150, pg[3].width/2-40, 180, pg[3].width/2-50, 200);
  pg[3].curve(pg[3].width/2+20, 150, pg[3].width/2-40, 180, pg[3].width/2-50, 200, pg[3].width/2-50, 200);
  pg[3].line(pg[3].width/2, 150, pg[3].width/2, 400);

  pg[3].line(pg[3].width/2-10, 200, pg[3].width/2-10, 160);
  pg[3].line(pg[3].width/2+10, 200, pg[3].width/2+10, 160);
  pg[3].line(pg[3].width/2-10, 200, pg[3].width/2+10, 200); //leher
  pg[3].line(pg[3].width/2-10, 200, pg[3].width/2-60, 220);
  pg[3].line(pg[3].width/2+10, 200, pg[3].width/2+60, 220);

  pg[3].line(pg[3].width/2-60, 220, pg[3].width/2+60, 220);
  pg[3].line(pg[3].width/2-55, 250, pg[3].width/2+55, 250);
  pg[3].line(pg[3].width/2-50, 270, pg[3].width/2+50, 270);
  pg[3].line(pg[3].width/2-35, 340, pg[3].width/2+35, 340); //pinggang atas
  pg[3].line(pg[3].width/2-60, 220, pg[3].width/2-35, 340);
  pg[3].line(pg[3].width/2+60, 220, pg[3].width/2+35, 340);

  pg[3].line(pg[3].width/2-60, 220, pg[3].width/2-85, 320); //lengan atas
  pg[3].line(pg[3].width/2-50, 270, pg[3].width/2-65, 320); 
  pg[3].line(pg[3].width/2-85, 320, pg[3].width/2-80, 400); //lengan bawah
  pg[3].line(pg[3].width/2-65, 320, pg[3].width/2-70, 400);
  pg[3].line(pg[3].width/2-80, 400, pg[3].width/2-85, 410); //telapak
  pg[3].line(pg[3].width/2-85, 410, pg[3].width/2-75, 440); 
  pg[3].line(pg[3].width/2-70, 400, pg[3].width/2-65, 410);
  pg[3].line(pg[3].width/2-65, 410, pg[3].width/2-75, 440); //
  pg[3].line(pg[3].width/2+60, 220, pg[3].width/2+85, 320); //lengan atas
  pg[3].line(pg[3].width/2+50, 270, pg[3].width/2+65, 320); 
  pg[3].line(pg[3].width/2+85, 320, pg[3].width/2+80, 400); //lengan bawah
  pg[3].line(pg[3].width/2+65, 320, pg[3].width/2+70, 400);
  pg[3].line(pg[3].width/2+80, 400, pg[3].width/2+85, 410); //telapak
  pg[3].line(pg[3].width/2+85, 410, pg[3].width/2+75, 440); 
  pg[3].line(pg[3].width/2+70, 400, pg[3].width/2+65, 410);
  pg[3].line(pg[3].width/2+65, 410, pg[3].width/2+75, 440);

  pg[3].line(pg[3].width/2-50, 400, pg[3].width/2+50, 400); //pinggang bawah
  pg[3].line(pg[3].width/2-35, 340, pg[3].width/2-50, 400);
  pg[3].line(pg[3].width/2+35, 340, pg[3].width/2+50, 400);

  pg[3].line(pg[3].width/2-25, 400, pg[3].width/2-35, 720); 
  pg[3].line(pg[3].width/2+25, 400, pg[3].width/2+35, 720);
  pg[3].line(pg[3].width/2-25, 700, pg[3].width/2-45, 700);
  pg[3].line(pg[3].width/2+25, 700, pg[3].width/2+45, 700);

  pg[3].line(pg[3].width/2-50, 400, pg[3].width/2-45, 700);
  pg[3].line(pg[3].width/2-5, 400, pg[3].width/2-25, 700);
  pg[3].line(pg[3].width/2+5, 400, pg[3].width/2+25, 700);
  pg[3].line(pg[3].width/2+50, 400, pg[3].width/2+45, 700);
  pg[3].endDraw();
}

public void setPgTexture(PImage imgtex[]) {
  for (int i=1; i<=5; i++) {
    pg[i+3].beginDraw();
    pg[i+3].background(255);
    pg[i+3].fill(0);
    pg[i+3].textSize(28);
    pg[i+3].text("Tekstur", 25, 50);
    int c = 1;
    for (int j=1; j<=9; j++) {
      if (c>=imgtex.length-1) {
        c=1;
        break;
      }
      for (int k=1; k<=6; k++) {
        if (c>imgtex.length-1) {
          break;
        }
        pg[i+3].beginShape();
        pg[i+3].texture(imgtex[c]);
        pg[i+3].vertex(pg[i+3].width-(k*75)+10, j*75, 0, 0);
        pg[i+3].vertex(pg[i+3].width-(k*75-50)+10, j*75, 100, 0);
        pg[i+3].vertex(pg[i+3].width-(k*75-50)+10, j*75+50, 100, 100);
        pg[i+3].vertex(pg[i+3].width-(k*75)+10, j*75+50, 0, 100);
        pg[i+3].endShape();
        c++;
      }
    }
    pg[i+3].endDraw();
  }
}

public void drawPgTutorial() {
  pg[11].beginDraw();
  pg[11].background(0xff525252);
  pg[11].fill(255);
  pg[11].textSize(28);
  pg[11].text("Aplikasi untuk Mendesain", 20, 30);
  pg[11].text("Busana dan Perancangan Pola", 20, 65);
  pg[11].textSize(18);
  pg[11].text("Cara Penggunaan :", 10, 95);
  pg[11].textSize(15);
  pg[11].text("1. Pilihlah Desain Busana wanita ataupun Pria yang berada di", 7, 118);
  pg[11].text("    Menu Wanita dan menu Pria. Setelah memilih maka template", 7, 138);
  pg[11].text("    pola akan ditampil kan pada sebelah kanan layar aplikasi. ", 7, 152);
  pg[11].text("2. Anda dapat memilih Template pola yang telah tersedia.", 7, 170);
  pg[11].text("    pilihlah ukuran sesuai dengan kebutuhan anda.", 7, 188);
  pg[11].text("4. Setelah membuat rancangan busana anda dapat menambah", 7, 206);
  pg[11].text("    kan tekstur dengan memilih menu Tekstur, template tekstur", 7, 224);
  pg[11].text("    akan ditampilkan pada sebelah kanan layar aplikasi.", 7, 242);
  pg[11].text("5. Anda dapat menyimpan rancangan pola busana dengan", 7, 260);
  pg[11].text("    memilih menu File kemudian pilihlah submenu Save", 7, 278);
  pg[11].text("    atau anda dapat menekan tombol S pada keyboard.", 7, 296);
  pg[11].text("6. Anda dapat Membuka kembali hasil rancangan pola dengan", 7, 314);
  pg[11].text("    memilih menu file kemudian pilihlah submenu open", 7, 332);
  pg[11].text("    atau anda dapat menekan tombol O pada keyboard.", 7, 350);
  pg[11].endDraw();
}

public void drawPgTemplateAtasan() {
  pg[12].beginDraw();
  pg[12].background(252);
  pg[12].fill(0);
  pg[12].textSize(28);
  pg[12].text("Variasi Pola Baju Wanita", 25, 50);
  pg[12].textSize(20);
  //pg[12].text("Ukuran S : ",27,110);
  //pg[12].text("Ukuran M : ",27,180);
  //pg[12].text("Ukuran L : ",27,250);
  c = 1;
  for (int i=1; i<=3; i++) {
    if (c>=imgAtasan.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=3; j++) {
      if (c>imgAtasan.length-1)
        break;
      pg[12].beginShape();
      pg[12].texture(imgAtasan[c]);
      pg[12].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[12].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[12].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[12].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[12].endShape();
      c++;
    }
  }
  pg[12].endDraw();
}

public void drawPgTemplateUkuranW() {
  pg[22].beginDraw();
  pg[22].background(252);
  pg[22].fill(0);
  pg[22].textSize(20);
  pg[22].line(0,35,500,35);
  pg[22].line(215,35,215,430);
  pg[22].line(215,180,500,180);
  pg[22].line(215,330,500,330);
  pg[22].line(0,430,500,430);
  pg[22].text("Standar Ukuran Wanita", 125, 25);
  pg[22].textSize(10);
  pg[22].text("Jenis",15,50);
  pg[22].text("Ukuran",150,50);
  pg[22].text("S",130,75);
  pg[22].text("M",160,75);
  pg[22].text("L",190,75);
  pg[22].text("Atasan",15,75);
  pg[22].text("Lingkar Badan",15,100);
  pg[22].text("Lingkar Pinggang",15,125);
  pg[22].text("Lingkar Leher",15,150);
  pg[22].text("Lingkar Dada",15,175);
  pg[22].text("Lebar Dada ",15,200);
  pg[22].text("Panjang Punggung",15,225);
  pg[22].text("Lebar Punggung",15,250);
  pg[22].text("Lebar Bahu",15,275);
  pg[22].text("Panjang Sisi",15,300);
  pg[22].text("Tinggi Puncak",15,325);
  pg[22].text("Jarak Payudara",15,350);
  pg[22].text("Panjang Baju",15,375);
  //Atasan S
  pg[22].text("88",130,100);
  pg[22].text("66",130,125);
  pg[22].text("34",130,150);
  pg[22].text("31",130,175);
  pg[22].text("31",130,200);
  pg[22].text("35",130,225);
  pg[22].text("33",130,250);
  pg[22].text("11",130,275);
  pg[22].text("16",130,300);
  pg[22].text("12,5",130,325);
  pg[22].text("17,5",130,350);
  pg[22].text("55",130,375);
  
   //Atasan M
  pg[22].text("90",160,100);
  pg[22].text("72",160,125);
  pg[22].text("39",160,150);
  pg[22].text("33",160,175);
  pg[22].text("33",160,200);
  pg[22].text("37",160,225);
  pg[22].text("35",160,250);
  pg[22].text("12",160,275);
  pg[22].text("17",160,300);
  pg[22].text("13",160,325);
  pg[22].text("18",160,350);
  pg[22].text("65",160,375);
  
  //Atasan L
  pg[22].text("94",190,100);
  pg[22].text("78",190,125);
  pg[22].text("38",190,150);
  pg[22].text("34",190,175);
  pg[22].text("35",190,200);
  pg[22].text("39",190,225);
  pg[22].text("36",190,250);
  pg[22].text("13",190,275);
  pg[22].text("18",190,300);
  pg[22].text("13,5",190,325);
  pg[22].text("19",190,350);
  pg[22].text("75",190,375);
  
  pg[22].text("Jenis",230,50);
  pg[22].text("Ukuran",370,50);
  pg[22].text("S",360,75);
  pg[22].text("M",390,75);
  pg[22].text("L",420,75);
  pg[22].text("Lengan",230,75);
  pg[22].text("Lingkar Kerung Lengan",230,100);
  pg[22].text("Lingkar Lengan",230,125); 
  pg[22].text("Panjang Lengan",230,150);
  pg[22].text("Lingkar Pergelangan",230,175); 
  
  //Lengan S
  pg[22].text("42",360,100);
  pg[22].text("33",360,125);
  pg[22].text("21",360,150);
  pg[22].text("17",360,175);
  
  //Lengan M
  pg[22].text("44",390,100);
  pg[22].text("34",390,125);
  pg[22].text("23",390,150);
  pg[22].text("19",390,175);
  
  //Lengan L
  pg[22].text("48",420,100);
  pg[22].text("35",420,125);
  pg[22].text("24",420,150);
  pg[22].text("21",420,175);
  
  pg[22].text("Jenis",230,200);
  pg[22].text("Ukuran",370,200);
  pg[22].text("S",360,225);
  pg[22].text("M",390,225);
  pg[22].text("L",420,225);
  pg[22].text("Celana/Rok",230,225);
  pg[22].text("Lingkar Pinggang",230,250);
  pg[22].text("Lingkar Pinggul",230,275);
  pg[22].text("Panjang Celana",230,300);
  pg[22].text("Tinggi Pinggul",230,325);
  //Celana S
  pg[22].text("66",360,250);
  pg[22].text("88",360,275);
  pg[22].text("55",360,300);
  pg[22].text("17",360,325);
  
  //Celana M
  pg[22].text("72",390,250);
  pg[22].text("96",390,275);
  pg[22].text("65",390,300);
  pg[22].text("18",390,325);
  
  //Celana L
  pg[22].text("78",420,250);
  pg[22].text("102",420,275);
  pg[22].text("70",420,300);
  pg[22].text("20",420,325);
  
  pg[22].text("Jenis",230,350);
  pg[22].text("Ukuran",370,350);
  pg[22].text("S",360,375);
  pg[22].text("M",390,375);
  pg[22].text("L",420,375);
  pg[22].text("Kerah",230,375);
  pg[22].text("Lingkar Leher",230,400);
  pg[22].text("34",360,400);
  pg[22].text("36",390,400);
  pg[22].text("38",420,400);
  pg[22].endDraw();
}

public void drawPgTemplateUkuranP() {
  pg[23].beginDraw();
  pg[23].background(252);
  pg[23].fill(0);
  pg[23].textSize(20);
  pg[23].text("Standar Ukuran Pria", 125, 25);
  pg[23].line(0,35,500,35);
  pg[23].line(215,35,215,430);
  pg[23].line(215,180,500,180);
  pg[23].line(215,330,500,330);
  pg[23].line(0,430,500,430);
  pg[23].textSize(10);
  pg[23].text("Jenis",15,50);
  pg[23].text("Ukuran",150,50);
  pg[23].text("S",130,75);
  pg[23].text("M",160,75);
  pg[23].text("L",190,75);
  pg[23].text("Atasan",15,75);
  pg[23].text("Lingkar Badan",15,100);
  pg[23].text("Lingkar Pinggang",15,125);
  pg[23].text("Lingkar Leher",15,150);
  pg[23].text("Lingkar Dada",15,175);
  pg[23].text("Lebar Dada ",15,200);
  pg[23].text("Panjang Punggung",15,225);
  pg[23].text("Lebar Punggung",15,250);
  pg[23].text("Lebar Bahu",15,275);
  pg[23].text("Panjang Sisi",15,300);
  pg[23].text("Tinggi Puncak",15,325);
 // pg[23].text("Jarak Payudara",15,350);
  pg[23].text("Panjang Baju",15,350);
  //Atasan S
  pg[23].text("88",130,100);
  pg[23].text("74",130,125);
  pg[23].text("37",130,150);
  pg[23].text("31",130,175);
  pg[23].text("31",130,200);
  pg[23].text("35",130,225);
  pg[23].text("43",130,250);
  pg[23].text("11",130,275);
  pg[23].text("16",130,300);
  pg[23].text("12,5",130,325);
  pg[23].text("17,5",130,350);
  pg[23].text("70",130,375);
  
   //Atasan M
  pg[23].text("96",160,100);
  pg[23].text("78",160,125);
  pg[23].text("39",160,150);
  pg[23].text("33",160,175);
  pg[23].text("33",160,200);
  pg[23].text("37",160,225);
  pg[23].text("45",160,250);
  pg[23].text("12",160,275);
  pg[23].text("17",160,300);
  pg[23].text("13",160,325);
  pg[23].text("18",160,350);
  pg[23].text("75",160,375);
  
  //Atasan L
  pg[23].text("100",190,100);
  pg[23].text("82",190,125);
  pg[23].text("41",190,150);
  pg[23].text("34",190,175);
  pg[23].text("35",190,200);
  pg[23].text("39",190,225);
  pg[23].text("47",190,250);
  pg[23].text("13",190,275);
  pg[23].text("18",190,300);
  pg[23].text("13,5",190,325);
  pg[23].text("19",190,350);
  pg[23].text("80",190,375);
  
  pg[23].text("Jenis",230,50);
  pg[23].text("Ukuran",370,50);
  pg[23].text("S",360,75);
  pg[23].text("M",390,75);
  pg[23].text("L",420,75);
  pg[23].text("Lengan",230,75);
  pg[23].text("Lingkar Kerung Lengan",230,100);
  pg[23].text("Lingkar Lengan",230,125); 
  pg[23].text("Panjang Lengan",230,150);
  pg[23].text("Lingkar Pergelangan",230,175); 
  
  //Lengan S
  pg[23].text("42",360,100);
  pg[23].text("33",360,125);
  pg[23].text("25",360,150);
  pg[23].text("18",360,175);
  
  //Lengan M
  pg[23].text("44",390,100);
  pg[23].text("35",390,125);
  pg[23].text("26",390,150);
  pg[23].text("20",390,175);
  
  //Lengan L
  pg[23].text("48",420,100);
  pg[23].text("37",420,125);
  pg[23].text("27",420,150);
  pg[23].text("22",420,175);
  
  pg[23].text("Jenis",230,200);
  pg[23].text("Ukuran",370,200);
  pg[23].text("S",360,225);
  pg[23].text("M",390,225);
  pg[23].text("L",420,225);
  pg[23].text("Celana",230,225);
  pg[23].text("Lingkar Pinggang",230,250);
  pg[23].text("Lingkar Pinggul",230,275);
  pg[23].text("Panjang Celana",230,300);
  pg[23].text("Tinggi Pinggul",230,325);
  //Celana S
  pg[23].text("74",360,250);
  pg[23].text("90",360,275);
  pg[23].text("55",360,300);
  pg[23].text("17",360,325);
  
  //Celana M
  pg[23].text("78",390,250);
  pg[23].text("94",390,275);
  pg[23].text("65",390,300);
  pg[23].text("18",390,325);
  
  //Celana L
  pg[23].text("82",420,250);
  pg[23].text("98",420,275);
  pg[23].text("70",420,300);
  pg[23].text("20",420,325);
  
  pg[23].text("Jenis",230,350);
  pg[23].text("Ukuran",370,350);
  pg[23].text("S",360,375);
  pg[23].text("M",390,375);
  pg[23].text("L",420,375);
  pg[23].text("Kerah",230,375);
  pg[23].text("Lingkar Leher",230,400);
  pg[23].text("37",360,400);
  pg[23].text("39",390,400);
  pg[23].text("41",420,400);
  pg[23].endDraw();
}

public void drawPgTemplateLeher() {
  pg[18].beginDraw();
  pg[18].background(252);
  pg[18].fill(0);
  pg[18].textSize(28);
  pg[18].text("Variasi Pola Leher Wanita", 25, 50);
  pg[18].textSize(20);
  //pg[18].text("Ukuran S : ",27,150);
  //pg[18].text("Ukuran M : ",27,290);
  //pg[18].text("Ukuran L : ",27,450);
  c = 1;
  for (int i=1; i<=5; i++) {
    if (c>=imgLeher.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=3; j++) {
      if (c>imgLeher.length-1)
        break;
      pg[18].beginShape();
      pg[18].texture(imgLeher[c]);
      pg[18].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[18].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[18].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[18].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[18].endShape();
      c++;
    }
  }
  pg[18].endDraw();
}

public void drawPgTemplateLengan() {
  pg[19].beginDraw();
  pg[19].background(252);
  pg[19].fill(0);
  pg[19].textSize(28);
  pg[19].text("Variasi Pola Lengan Wanita", 25, 50);
  pg[19].textSize(20);
  //pg[19].text("Ukuran S : ",27,150);
  //pg[19].text("Ukuran M : ",27,290);
  //pg[19].text("Ukuran L : ",27,450);
  c = 1;
  for (int i=1; i<=16; i++) {
    if (c>=imgLengan.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=4; j++) {
      if (c>imgLengan.length-1)
        break;
      pg[19].beginShape();
      pg[19].texture(imgLengan[c]);
      pg[19].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[19].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[19].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[19].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[19].endShape();
      c++;
    }
  }
  pg[19].endDraw();
}

public void drawPgTemplateRok() {
  pg[13].beginDraw();
  pg[13].background(252);
  pg[13].fill(0);
  pg[13].textSize(28);
  pg[13].text("Variasi Pola Rok", 25, 50);
  pg[13].textSize(20);
  //pg[13].text("Ukuran S : ",27,150);
  //pg[13].text("Ukuran M : ",27,290);
  //pg[13].text("Ukuran L : ",27,450);
  c = 1;
  for (int i=1; i<=6; i++) {
    if (c>=imgRok.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=3; j++) {
      if (c>imgRok.length-1)
        break;
      pg[13].beginShape();
      pg[13].texture(imgRok[c]);
      pg[13].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[13].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[13].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[13].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[13].endShape();
      c++;
    }
  }
  pg[13].endDraw();
}

public void drawPgTemplateGaun() {
  pg[14].beginDraw();
  pg[14].background(252);
  pg[14].fill(0);
  pg[14].textSize(28);
  pg[14].text("Variasi Pola Gaun", 25, 50);
  pg[14].textSize(20);
  //pg[14].text("Ukuran S : ",27,110);
  //pg[14].text("Ukuran M : ",27,180);
  //pg[14].text("Ukuran L : ",27,250);
  c = 1;
  for (int i=1; i<=4; i++) {
    if (c>=imgGaun.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=4; j++) {
      if (c>imgGaun.length-1)
        break;
      pg[14].beginShape();
      pg[14].texture(imgGaun[c]);
      pg[14].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[14].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[14].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[14].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[14].endShape();
      c++;
    }
  }
  pg[14].endDraw();
}

public void drawPgTemplateCelana() {
  pg[15].beginDraw();
  pg[15].background(252);
  pg[15].fill(0);
  pg[15].textSize(28);
  pg[15].text("Variasi Pola Celana Wanita", 25, 50);
  pg[15].textSize(20);
  //pg[15].text("Ukuran S : ",27,110);
  //pg[15].text("Ukuran M : ",27,180);
  //pg[15].text("Ukuran L : ",27,250);
  c = 1;
  for (int i=1; i<=2; i++) {
    if (c>=imgCelana.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=2; j++) {
      if (c>imgCelana.length-1)
        break;
      pg[15].beginShape();
      pg[15].texture(imgCelana[c]);
      pg[15].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[15].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[15].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[15].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[15].endShape();
      c++;
    }
  }
  pg[15].endDraw();
}

public void drawPgTemplateAtasanLk() {
  pg[16].beginDraw();
  pg[16].background(252);
  pg[16].fill(0);
  pg[16].textSize(28);
  pg[16].text("Variasi Pola Baju Laki-Laki", 25, 50);
  pg[16].textSize(20);
  //pg[16].text("Ukuran S : ",27,110);
  //pg[16].text("Ukuran M : ",27,180);
  //pg[16].text("Ukuran L : ",27,250);
  c = 1;
  for (int i=1; i<=2; i++) {
    if (c>=imgAtasanLk.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=2; j++) {
      if (c>imgAtasanLk.length-1)
        break;
      pg[16].beginShape();
      pg[16].texture(imgAtasanLk[c]);
      pg[16].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[16].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[16].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[16].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[16].endShape();
      c++;
    }
  }
  pg[16].endDraw();
}

public void drawPgTemplateCelanaLk() {
  pg[17].beginDraw();
  pg[17].background(252);
  pg[17].fill(0);
  pg[17].textSize(28);
  pg[17].text("Variasi Pola Celana Laki-Laki", 25, 50);
  pg[17].textSize(20);
  //pg[17].text("Ukuran S : ",27,110);
  //pg[17].text("Ukuran M : ",27,180);
  //pg[17].text("Ukuran L : ",27,250);
  c = 1;
  for (int i=1; i<=2; i++) {
    if (c>=imgCelanaLk.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=2; j++) {
      if (c>imgCelanaLk.length-1)
        break;
      pg[17].beginShape();
      pg[17].texture(imgCelanaLk[c]);
      pg[17].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[17].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[17].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[17].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[17].endShape();
      c++;
    }
  }
  pg[17].endDraw();
}

public void drawPgTemplateLeherLk() {
  pg[20].beginDraw();
  pg[20].background(252);
  pg[20].fill(0);
  pg[20].textSize(28);
  pg[20].text("Variasi Pola Leher Laki-Laki", 25, 50);
  pg[20].textSize(20);
  //pg[20].text("Ukuran S : ",27,150);
  //pg[20].text("Ukuran M : ",27,290);
  //pg[20].text("Ukuran L : ",27,450);
  c = 1;
  for (int i=1; i<=5; i++) {
    if (c>=imgLeherLk.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=3; j++) {
      if (c>imgLeher.length-1)
        break;
      pg[20].beginShape();
      pg[20].texture(imgLeherLk[c]);
      pg[20].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[20].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[20].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[20].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[20].endShape();
      c++;
    }
  }
  pg[20].endDraw();
}

public void drawPgTemplateLenganLk() {
  pg[21].beginDraw();
  pg[21].background(252);
  pg[21].fill(0);
  pg[21].textSize(28);
  pg[21].text("Variasi Pola Lengan Laki-laki", 25, 50);
  pg[21].textSize(20);
  //pg[21].text("Ukuran S : ",27,110);
  //pg[21].text("Ukuran M : ",27,180);
  //pg[21].text("Ukuran L : ",27,250);
  c = 1;
  for (int i=1; i<=4; i++) {
    if (c>=imgLenganLk.length-1) {
      c=1;
      break;
    }
    for (int j=1; j<=4; j++) {
      if (c>imgLenganLk.length-1)
        break;
      pg[21].beginShape();
      pg[21].texture(imgLenganLk[c]);
      pg[21].vertex(pg[4].width-(j*75)+10, i*75, 0, 0);
      pg[21].vertex(pg[4].width-(j*75-50)+10, i*75, 100, 0);
      pg[21].vertex(pg[4].width-(j*75-50)+10, i*75+50, 100, 100);
      pg[21].vertex(pg[4].width-(j*75)+10, i*75+50, 0, 100);
      pg[21].endShape();
      c++;
    }
  }
  pg[21].endDraw();
}

//davin
public void drawPgOpt() {
  pg[24].beginDraw();
  pg[24].background(0xff525252);
  pg[24].fill(255);
  pg[24].textSize(28);
  pg[24].text("Peletakan Pola Busana", 20, 30);
  pg[24].text("Pada Kain", 20, 65);
  pg[24].textSize(18);
  pg[24].text("Panjang kain minimal yang dibutuhkan :", 20, 300);
  pg[24].text("..."+" cm", 20, 325);
  pg[24].endDraw();
  
  pg[25].beginDraw();
  pg[25].background(255);
  pg[25].fill(255);
  
  s=loadShape("pola.svg");
  s.disableStyle();
  sx=417;
  sy=150;
  
  File file = new File(sketchPath("")+"/result.txt");
  output = createWriter(file.getAbsolutePath());
  
  long start = System.currentTimeMillis();
  
  ArrayList<Pattern> chromosome = new ArrayList<Pattern>();
  String[] entah=child.toArray(new String [child.size()]);
  chromosome = setChromosome(entah); 
  output.println("chromosome "+chromosome);
  
  println("inisialisasi..");
  fp = initialization(chromosome,1);
  output.println("inisialisasi "+fp);
  
  //hasil
  for(int i=0;i<fp.size();i++){
    Pattern patt = best.get(i);
    pg[25].shape(patt.getShape(),patt.getX(),patt.getY());
  }
  pg[25].endDraw();
  
  image(pg[25], 2*width/3+20, pg[1].height+100);
  print("selesai");
}



public void imagePgs(){
  image(pg[1], 0, 0);
  image(pg[2], 0, pg[1].height);
  image(pg[3], width/3, pg[1].height);
  image(pg[10], 2*width/3, height-220);

  if (pgTex1)
    image(pg[4], 2*width/3, pg[1].height);
  else if (pgTex2)
    image(pg[5], 2*width/3, pg[1].height);
  //else if (pgTex3)
  //  image(pg[6], 2*width/3, pg[1].height);
  else if (pgAtasan)
    image(pg[12], 2*width/3, pg[1].height);
  else if (pgRok)
    image(pg[13], 2*width/3, pg[1].height);
  else if (pgGaun)
    image(pg[14], 2*width/3, pg[1].height);
  else if (pgCelana)
    image(pg[15], 2*width/3, pg[1].height);
  else if (pgAtasanLk)
    image(pg[16], 2*width/3, pg[1].height);
  else if (pgCelanaLk)
    image(pg[17], 2*width/3, pg[1].height);
  else if (pgLeher)
    image(pg[18], 2*width/3, pg[1].height);
  else if (pgLengan)
    image(pg[19], 2*width/3, pg[1].height);
  else if (pgLeherLk)
    image(pg[20], 2*width/3, pg[1].height);
  else if (pgLenganLk)
    image(pg[21], 2*width/3, pg[1].height);
  else if (pgUkuranW)
    image(pg[22], 2*width/3, pg[1].height); 
  else if (pgUkuranP)
    image(pg[23], 2*width/3, pg[1].height);  
    
  //davin
  else if(pgOpt){
    image(pg[24], 2*width/3, pg[1].height);
    image(pg[25], 2*width/3+20, pg[1].height+100);
  }
  
  else// if(pgTutor)
    image(pg[11], 2*width/3, pg[1].height);
}

public void defineMenus() {
  menuList[0] = new ClassOneDropDownMenu("File", 0); // 23 = x pos
  menuList[0].addNewLine("New", 0); // 0 = index
  menuList[0].addNewLine("Open", 1);
  menuList[0].addNewLine("Save", 2);
  menuList[0].addNewLine("Print", 3);
  menuList[0].addNewLine("Tutorial", 4);
  menuList[0].addNewLine("Close", 5);

  menuList[1] = new ClassOneDropDownMenu("Ukuran", 100);// x pos
  menuList[1].addNewLine("Small", 100);// 100 = index
  menuList[1].addNewLine("Medium", 101);// 100 = index
  menuList[1].addNewLine("Large", 102);
  
  menuList[6] = new ClassOneDropDownMenu("Informasi", 6*100);// x pos
  menuList[6].addNewLine("Wanita", 600);// 100 = index
  menuList[6].addNewLine("Pria", 601);// 100 = index
  menuList[6].addNewLine("Show Grid", 602);

  menuList[2] = new ClassOneDropDownMenu("Wanita", 2*100);// x pos
  menuList[2].addNewLine("Baju", 200);// index
  menuList[2].addNewLine("Kerah", 201);
  menuList[2].addNewLine("Lengan", 202);
  menuList[2].addNewLine("Rok", 203);
  menuList[2].addNewLine("Gaun", 204);
  menuList[2].addNewLine("Celana", 205);

  menuList[3] = new ClassOneDropDownMenu("Pria", 3*100);// x pos
  menuList[3].addNewLine("Baju", 300);// index
  menuList[3].addNewLine("Kerah", 301);
  menuList[3].addNewLine("Lengan", 302);
  menuList[3].addNewLine("Celana", 303);

  menuList[4] = new ClassOneDropDownMenu("Tekstur", 4*100);// x pos
  menuList[4].addNewLine("Tekstur 1", 400);// index //warna
  menuList[4].addNewLine("Tekstur 2", 401); //
  //menuList[4].addNewLine("Tekstur 3", 402);// kain
  
  //davin - aneh
  menuList[5] = new ClassOneDropDownMenu("Optimasi", 5*100);// x pos
  menuList[5].addNewLine("op", 500);
}

public void drawLines() {
  line(0, pg[1].height, width, pg[1].height);
  line(width/3, pg[1].height, width/3, height);
  line(2*width/3, pg[1].height, 2*width/3, height);
}

public void drawPola() {
  if (!newProject) {
    base();
    base1();
  }
}    
public void drawMenuBar() {
  for (int i=0; i<menuList.length; i++)
    menuList[i].display();
}

public void fileSelectedForSave(File selection) {
  if (selection == null)
    println("\nWindow was closed or the user hit cancel.");
  else {
    println("\nUser selected " + selection.getAbsolutePath());
    output = createWriter(selection.getAbsolutePath());
    if(size==1){
     output.println("size1"+TAB+TAB); 
    }
    else if(size==2){
     output.println("size2"+TAB+TAB); 
    }
    else if(size==3){
     output.println("size3"+TAB+TAB); 
    }
    if(templateAtasanlk==1){
      output.println("patasanlk1"+TAB+TAB); 
    }
    
    else if(templateAtasanlk==2){
      output.println("patasanlk2"+TAB+TAB); 
    }
    
    else if(templateAtasanlk==3){
      output.println("patasanlk3"+TAB+TAB); 
    }
    
    else if(templateAtasanlk==4){
      output.println("patasanlk4"+TAB+TAB); 
    }
    else if(templateAtasanlk==5){
      output.println("patasanlk5"+TAB+TAB); 
    }
    
    else if(templateAtasanlk==6){
      output.println("patasanlk6"+TAB+TAB); 
    }
    
    if(templateLeherlk==1){
      output.println("pleherlk1"+TAB+TAB); 
    }
    else if(templateLeherlk==2){
      output.println("pleherlk2"+TAB+TAB); 
    }
    else if(templateLeherlk==3){
      output.println("pleherlk3"+TAB+TAB); 
    }
    else if(templateLeherlk==4){
      output.println("pleherlk4"+TAB+TAB); 
    }
    else if(templateLeherlk==5){
      output.println("pleherlk5"+TAB+TAB); 
    }
    else if(templateLeherlk==7){
      output.println("pleherlk6"+TAB+TAB); 
    }
    else if(templateLeherlk==8){
      output.println("pleherlk7"+TAB+TAB); 
    }
    else if(templateLeherlk==9){
      output.println("pleherlk8"+TAB+TAB); 
    }
    else if(templateLeherlk==10){
      output.println("pleherlk9"+TAB+TAB); 
    }
    else if(templateLeherlk==11){
      output.println("pleherlk10"+TAB+TAB); 
    }
    else if(templateLeherlk==13){
      output.println("pleherlk11"+TAB+TAB); 
    }
    else if(templateLeherlk==14){
      output.println("pleherlk12"+TAB+TAB); 
    }
    else if(templateLeherlk==15){
      output.println("pleherlk13"+TAB+TAB); 
    }
    else if(templateLeherlk==16){
      output.println("pleherlk14"+TAB+TAB); 
    }
    else if(templateLeherlk==17){
      output.println("pleherlk15"+TAB+TAB); 
    }
   
   if(templateLenganlk==1){
      output.println("plenganlk1"+TAB+TAB); 
    }
    else if(templateLenganlk==2){
      output.println("plenganlk2"+TAB+TAB); 
    }
    else if(templateLenganlk==3){
      output.println("plenganlk3"+TAB+TAB); 
    }
    else if(templateLenganlk==4){
      output.println("plenganlk4"+TAB+TAB); 
    }
    else if(templateLenganlk==5){
      output.println("plenganlk5"+TAB+TAB); 
    }
    else if(templateLenganlk==6){
      output.println("plenganlk6"+TAB+TAB); 
    }
    else if(templateLenganlk==7){
      output.println("plenganlk7"+TAB+TAB); 
    }
    else if(templateLenganlk==8){
      output.println("plenganlk8"+TAB+TAB); 
    }
    else if(templateLenganlk==9){
      output.println("plenganlk9"+TAB+TAB); 
    }
    else if(templateLenganlk==10){
      output.println("plenganlk10"+TAB+TAB); 
    }
    else if(templateLenganlk==11){
      output.println("plenganlk11"+TAB+TAB); 
    }
    else if(templateLenganlk==12){
      output.println("plenganlk12"+TAB+TAB); 
    }
    
    if(templateCelanalk==1){
      output.println("pcelanalk1"+TAB+TAB); 
    }
      else if(templateCelanalk==2){
      output.println("pcelanalk2"+TAB+TAB); 
    }
      else if(templateCelanalk==3){
      output.println("pcelanalk3"+TAB+TAB); 
    }
      else if(templateCelanalk==4){
      output.println("pcelanalk6"+TAB+TAB); 
    }
      else if(templateCelanalk==5){
      output.println("pcelanalk5"+TAB+TAB); 
    }
      else if(templateCelanalk==6){
      output.println("pcelanak6"+TAB+TAB); 
    }
    if(text==1){
      output.println("tex1"+TAB+(urlTexture));
    }
    
     if(templateAtasan==1){
      output.println("patasan1"+TAB+TAB); 
    }
    
    else if(templateAtasan==2){
      output.println("patasan2"+TAB+TAB); 
    }
    
    else if(templateAtasan==3){
      output.println("patasan3"+TAB+TAB); 
    }
    
    else if(templateAtasan==4){
      output.println("patasan4"+TAB+TAB); 
    }
    else if(templateAtasan==5){
      output.println("patasan5"+TAB+TAB); 
    }
    
    else if(templateAtasan==6){
      output.println("patasan6"+TAB+TAB); 
    }
     else if(templateAtasan==7){
      output.println("patasan7"+TAB+TAB); 
    }
    else if(templateAtasan==8){
      output.println("patasan8"+TAB+TAB); 
    }
    
    else if(templateAtasan==9){
      output.println("patasan9"+TAB+TAB); 
    }
    
     if(templateLeher==1){
      output.println("pleher1"+TAB+TAB); 
    }
    else if(templateLeher==2){
      output.println("pleher2"+TAB+TAB); 
    }
    else if(templateLeher==3){
      output.println("pleher3"+TAB+TAB); 
    }
    else if(templateLeher==4){
      output.println("pleher4"+TAB+TAB); 
    }
    else if(templateLeher==5){
      output.println("pleher5"+TAB+TAB); 
    }
    else if(templateLeher==7){
      output.println("pleher6"+TAB+TAB); 
    }
    else if(templateLeher==8){
      output.println("pleher7"+TAB+TAB); 
    }
    else if(templateLeher==9){
      output.println("pleher8"+TAB+TAB); 
    }
    else if(templateLeher==10){
      output.println("pleher9"+TAB+TAB); 
    }
    else if(templateLeher==11){
      output.println("pleher10"+TAB+TAB); 
    }
    else if(templateLeher==13){
      output.println("pleher11"+TAB+TAB); 
    }
    else if(templateLeher==14){
      output.println("pleher12"+TAB+TAB); 
    }
    else if(templateLeher==15){
      output.println("pleher13"+TAB+TAB); 
    }
    else if(templateLeher==16){
      output.println("pleher14"+TAB+TAB); 
    }
    else if(templateLeher==17){
      output.println("pleher15"+TAB+TAB); 
    }
    
    if(templateLengan==1){
      output.println("plengan1"+TAB+TAB); 
    }
    else if(templateLengan==2){
      output.println("plengan2"+TAB+TAB); 
    }
    else if(templateLengan==3){
      output.println("plengan3"+TAB+TAB); 
    }
    else if(templateLengan==4){
      output.println("plengan4"+TAB+TAB); 
    }
    else if(templateLengan==5){
      output.println("plengan5"+TAB+TAB); 
    }
    else if(templateLengan==6){
      output.println("plengan6"+TAB+TAB); 
    }
    else if(templateLengan==7){
      output.println("plengan7"+TAB+TAB); 
    }
    else if(templateLengan==8){
      output.println("plengan8"+TAB+TAB); 
    }
    else if(templateLengan==9){
      output.println("plengan9"+TAB+TAB); 
    }
    else if(templateLengan==10){
      output.println("plengan10"+TAB+TAB); 
    }
    else if(templateLengan==11){
      output.println("plengan11"+TAB+TAB); 
    }
    else if(templateLengan==12){
      output.println("plengan12"+TAB+TAB); 
    }
    else if(templateLengan==13){
      output.println("plengan13"+TAB+TAB); 
    }
    else if(templateLengan==14){
      output.println("plengan14"+TAB+TAB); 
    }
    else if(templateLengan==15){
      output.println("plengan15"+TAB+TAB); 
    }
    else if(templateLengan==16){
      output.println("plengan12"+TAB+TAB); 
    }
    else if(templateLengan==17){
      output.println("plengan17"+TAB+TAB); 
    }
    else if(templateLengan==18){
      output.println("plengan18"+TAB+TAB); 
    }
    else if(templateLengan==19){
      output.println("plengan19"+TAB+TAB); 
    }
    else if(templateLengan==20){
      output.println("plengan20"+TAB+TAB); 
    }
    else if(templateLengan==21){
      output.println("plengan21"+TAB+TAB); 
    }
    else if(templateLengan==22){
      output.println("plengan22"+TAB+TAB); 
    }
    else if(templateLengan==23){
      output.println("plengan23"+TAB+TAB); 
    }
    else if(templateLengan==24){
      output.println("plengan24"+TAB+TAB); 
    }
    
    if(templateRok==1){
      output.println("prok1"+TAB+TAB); 
    }
    else if(templateRok==2){
      output.println("prok2"+TAB+TAB); 
    }
    else if(templateRok==3){
      output.println("prok3"+TAB+TAB); 
    }
    else if(templateRok==4){
      output.println("prok4"+TAB+TAB); 
    }
    else if(templateRok==5){
      output.println("prok5"+TAB+TAB); 
    }
    else if(templateRok==6){
      output.println("prok6"+TAB+TAB); 
    }
    else if(templateRok==7){
      output.println("prok7"+TAB+TAB); 
    }
    else if(templateRok==8){
      output.println("prok8"+TAB+TAB); 
    }
    else if(templateRok==9){
      output.println("prok9"+TAB+TAB); 
    }
    else if(templateRok==10){
      output.println("prok10"+TAB+TAB); 
    }
    else if(templateRok==11){
      output.println("prok11"+TAB+TAB); 
    }
    else if(templateRok==12){
      output.println("prok12"+TAB+TAB); 
    }
    else if(templateRok==13){
      output.println("prok13"+TAB+TAB); 
    }
    else if(templateRok==14){
      output.println("prok14"+TAB+TAB); 
    }
    else if(templateRok==15){
      output.println("prok15"+TAB+TAB); 
    }
    else if(templateRok==16){
      output.println("prok12"+TAB+TAB); 
    }
    else if(templateLengan==17){
      output.println("plengan17"+TAB+TAB); 
    }
    else if(templateLengan==18){
      output.println("plengan18"+TAB+TAB); 
    }
    
    if(templateGaun==1){
      output.println("pgaun1"+TAB); 
    }
    else if(templateGaun==2){
      output.println("pgaun2"+TAB); 
    }
    else if(templateGaun==3){
      output.println("pgaun3"+TAB); 
    }
    else if(templateGaun==4){
      output.println("pgaun4"+TAB); 
    }
    else if(templateGaun==5){
      output.println("pgaun5"+TAB); 
    }
    else if(templateGaun==6){
      output.println("pgaun6"+TAB); 
    }
    else if(templateGaun==7){
      output.println("pgaun7"+TAB); 
    }
    else if(templateGaun==8){
      output.println("pgaun8"+TAB); 
    }
    else if(templateGaun==9){
      output.println("pgaun9"+TAB); 
    }
    else if(templateGaun==10){
      output.println("pgaun10"+TAB); 
    }
    else if(templateGaun==11){
      output.println("pgaun11"+TAB); 
    }
    else if(templateGaun==12){
      output.println("pgaun12"+TAB); 
    }
    
    if(templateCelana==1){
      output.println("pcelana1"+TAB); 
    }
    else if(templateCelana==2){
      output.println("pcelana2"+TAB); 
    }
    else if(templateCelana==3){
      output.println("pcelana3"+TAB); 
    }
    else if(templateCelana==4){
      output.println("pcelana4"+TAB); 
    }
    else if(templateCelana==5){
      output.println("pcelana5"+TAB); 
    }
    else if(templateCelana==6){
      output.println("pcelana6"+TAB); 
    }
    else if(templateCelana==7){
      output.println("pcelana7"+TAB); 
    }
    else if(templateCelana==8){
      output.println("pcelana8"+TAB); 
    }
    
    output.flush();
    output.close();
  }
}

public void openProject() {
  File start = new File(sketchPath("")+"/Saved Projects"+"/*.txt");
  selectInput("Select a file to load:", "fileSelectedForLoad", start);
}

public void fileSelectedForLoad(File selection) {
  if (selection == null)
    println("\nWindow was closed or the user hit cancel.");
  else {
    println("\nUser selected " + selection.getAbsolutePath());
    newProject();
    parseFile(selection);
    newProject = false;
  }
}

public void parseFile(File selection) {
  BufferedReader reader = createReader(selection.getAbsolutePath());
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      String[] pieces = split(line,TAB);
      //println(pieces);
          //for(int i=0;i<6;i++){
      if(pieces[0].equals("size1")){
        size=1;
      }
      if(pieces[0].equals("size2")){
        size=2;
      }
      if(pieces[0].equals("size3")){
        size=3;
      }
      if (pieces[0].equals("patasanlk1"))
          {
          atasanlk=true;
          templateAtasanlk = 1;
          selectAtasanlk();
      }
      
      if (pieces[0].equals("patasanlk2"))
            {
          atasanlk=true;
          templateAtasanlk = 2;
          selectAtasanlk();
      }
      
      if (pieces[0].equals("patasanlk3"))
            {
          atasanlk=true;
          templateAtasanlk = 3;
          selectAtasanlk();
      }
      
      if (pieces[0].equals("patasanlk4"))
            {
          atasanlk=true;
          templateAtasanlk = 4;
          selectAtasanlk();
      } 
      
      if (pieces[0].equals("patasanlk5"))
            {
          atasanlk=true;
          templateAtasanlk = 5;
          selectAtasanlk();
      }
      
      if (pieces[0].equals("patasanlk6"))
            {
          atasanlk=true;
          templateAtasanlk = 6;
          selectAtasanlk();
      }  
      
      if (pieces[0].equals("pleherlk1"))
       {
          leherlk=true;
          templateLeherlk = 1;
          selectLeherLk();
      }
      
      if (pieces[0].equals("pleherlk2"))
         {
          leherlk=true;
          templateLeherlk = 2;
          selectLeherLk();
      }   
      
      if (pieces[0].equals("pleherlk3"))
         {
          leherlk=true;
          templateLeherlk = 3;
          selectLeherLk();
      } 
      
      if (pieces[0].equals("pleherlk4"))
          {
          leherlk=true;
          templateLeherlk = 4;
          selectLeherLk();
      }   
          
      if (pieces[0].equals("pleherlk5"))
            {
          leherlk=true;
          templateLeherlk = 5;
          selectLeherLk();
      }   
      
      if (pieces[0].equals("pleherlk6"))
            {
          leherlk=true;
          templateLeherlk = 7;
          selectLeherLk();
      }
      if (pieces[0].equals("pleherlk7"))
            {
          leherlk=true;
          templateLeherlk = 8;
          selectLeherLk();
      }
      if (pieces[0].equals("pleherlk8"))
            {
          leherlk=true;
          templateLeherlk = 9;
          selectLeherLk();
      }
      if (pieces[0].equals("pleherlk9"))
            {
          leherlk=true;
          templateLeherlk = 10;
          selectLeherLk();
      }
        if (pieces[0].equals("pleherlk10"))
            {
          leherlk=true;
          templateLeherlk = 11;
          selectLeherLk();
      }
      if (pieces[0].equals("pleherlk11"))
            {
          leherlk=true;
          templateLeherlk = 13;
          selectLeherLk();
      }
      if (pieces[0].equals("pleherlk12"))
            {
          leherlk=true;
          templateLeherlk = 14;
          selectLeherLk();
      }
      if (pieces[0].equals("pleherlk13"))
            {
          leherlk=true;
          templateLeherlk = 15;
          selectLeherLk();
      }
      if (pieces[0].equals("pleherlk14"))
            {
          leherlk=true;
          templateLeherlk = 16;
          selectLeherLk();
      }
      if (pieces[0].equals("pleherlk15"))
            {
          leherlk=true;
          templateLeherlk = 17;
          selectLeherLk();
       }
      
      if (pieces[0].equals("plenganlk1"))
     {
          lenganlk=true;
          templateLenganlk = 1;
          selectLenganLk();
      }  
      
      if (pieces[0].equals("plenganlk2"))
             {
          lenganlk=true;
          templateLenganlk = 2;
          selectLenganLk();
      }
      
      if (pieces[0].equals("plenganlk3"))
             {
          lenganlk=true;
          templateLenganlk = 3;
          selectLenganLk();
      } 
      
      if (pieces[0].equals("plenganlk4"))
              {
          lenganlk=true;
          templateLenganlk = 4;
          selectLenganLk();
      }  
      
      if (pieces[0].equals("plenganlk5"))
             {
          lenganlk=true;
          templateLenganlk = 5;
          selectLenganLk();
      }  
       if (pieces[0].equals("plenganlk6"))
     {
          lenganlk=true;
          templateLenganlk = 6;
          selectLenganLk();
      }  
      
       if (pieces[0].equals("plenganlk7"))
     {
          lenganlk=true;
          templateLenganlk = 7;
          selectLenganLk();
      }  
         if (pieces[0].equals("plenganlk8"))
     {
          lenganlk=true;
          templateLenganlk = 8;
          selectLenganLk();
      }  
         if (pieces[0].equals("plenganlk9"))
     {
          lenganlk=true;
          templateLenganlk = 9;
          selectLenganLk();
      }  
        if (pieces[0].equals("plenganlk10"))
     {
          lenganlk=true;
          templateLenganlk = 10;
          selectLenganLk();
      }  
        if (pieces[0].equals("plenganlk11"))
     {
          lenganlk=true;
          templateLenganlk = 11;
          selectLenganLk();
      }  
       if (pieces[0].equals("plenganlk12"))
     {
          lenganlk=true;
          templateLenganlk = 12;
          selectLenganLk();
      }       
        
      if (pieces[0].equals("pcelanalk1"))
             {
          celanalk=true;
          templateCelanalk = 1;
          selectCelanalk();
      }
     if (pieces[0].equals("pcelanalk2"))
             {
          celanalk=true;
          templateCelanalk = 2;
          selectCelanalk();
      }
      
      if (pieces[0].equals("pcelanalk3"))
              {
          celanalk=true;
          templateCelanalk = 3;
          selectCelanalk();
      }
      
      if (pieces[0].equals("pcelanalk4"))
             {
          celanalk=true;
          templateCelanalk = 4;
          selectCelanalk();
      }   
      
      if (pieces[0].equals("pcelanalk5"))
            {
          celanalk=true;
          templateCelanalk = 5;
          selectCelanalk();
      }
      
      if (pieces[0].equals("pcelanalk6"))
         {
          celanalk=true;
          templateCelanalk = 6;
          selectCelanalk();
      }  
      if(pieces[0].equals("tex1")){
        citraKain = true;
   
          imageTexture = loadImage(pieces[1]);
          urlTexture = pieces[1];
      }
       if (pieces[0].equals("patasan1"))
          {
          atasan=true;
          templateAtasan = 1;
          selectAtasan();
      }
      
      if (pieces[0].equals("patasan2"))
            {
          atasan=true;
          templateAtasan = 2;
          selectAtasan();
      }
      
      if (pieces[0].equals("patasan3"))
            {
          atasan=true;
          templateAtasan = 3;
          selectAtasan();
      }
      
      if (pieces[0].equals("patasan4"))
            {
          atasan=true;
          templateAtasan = 4;
          selectAtasan();
      } 
      
      if (pieces[0].equals("patasan5"))
            {
          atasan=true;
          templateAtasan = 5;
          selectAtasan();
      }
      
      if (pieces[0].equals("patasan6"))
            {
          atasan=true;
          templateAtasan = 6;
          selectAtasan();
      }  
      if (pieces[0].equals("patasan7"))
            {
          atasan=true;
          templateAtasan = 7;
          selectAtasan();
      } 
      if (pieces[0].equals("patasan8"))
            {
          atasan=true;
          templateAtasan = 8;
          selectAtasan();
      } 
      if (pieces[0].equals("patasan9"))
            {
          atasan=true;
          templateAtasan = 9;
          selectAtasan();
      } 
      
      if (pieces[0].equals("pleher1"))
       {
          leher=true;
          templateLeher= 1;
          selectLeher();
      }
      
      if (pieces[0].equals("pleher2"))
         {
          leher=true;
          templateLeher = 2;
          selectLeher();
      }   
      
      if (pieces[0].equals("pleher3"))
         {
          leher=true;
          templateLeher = 3;
          selectLeher();
      } 
      
      if (pieces[0].equals("pleher4"))
          {
          leher=true;
          templateLeher = 4;
          selectLeher();
      }   
          
      if (pieces[0].equals("pleher5"))
            {
          leher=true;
          templateLeher = 5;
          selectLeher();
      }   
      
      if (pieces[0].equals("pleher6"))
            {
          leher=true;
          templateLeher= 7;
          selectLeher();
      }
      if (pieces[0].equals("pleher7"))
            {
          leher=true;
          templateLeher = 8;
          selectLeher();
      }
      if (pieces[0].equals("pleher8"))
            {
          leher=true;
          templateLeher = 9;
          selectLeher();
      }
      if (pieces[0].equals("pleher9"))
            {
          leher=true;
          templateLeher = 10;
          selectLeher();
      }
        if (pieces[0].equals("pleher10"))
            {
          leher=true;
          templateLeher = 11;
          selectLeher();
      }
      if (pieces[0].equals("pleher11"))
            {
          leher=true;
          templateLeher = 13;
          selectLeher();
      }
      if (pieces[0].equals("pleher12"))
            {
          leher=true;
          templateLeher = 14;
          selectLeher();
      }
      if (pieces[0].equals("pleher13"))
            {
          leher=true;
          templateLeher = 15;
          selectLeher();
      }
      if (pieces[0].equals("pleher14"))
            {
          leher=true;
          templateLeher = 16;
          selectLeher();
      }
      if (pieces[0].equals("pleher15"))
            {
          leher=true;
          templateLeher = 17;
          selectLeher();
       }
       
         if (pieces[0].equals("plengan1"))
     {
          lengan=true;
          templateLengan = 1;
          selectLengan();
      }  
      
      if (pieces[0].equals("plengan2"))
             {
          lengan=true;
          templateLengan = 2;
          selectLengan();
      }
      
      if (pieces[0].equals("plengan3"))
             {
          lengan=true;
          templateLengan = 3;
          selectLengan();
      } 
      
      if (pieces[0].equals("plengan4"))
              {
          lengan=true;
          templateLengan = 4;
          selectLengan();
      }  
      
      if (pieces[0].equals("plengan5"))
             {
          lengan=true;
          templateLengan = 5;
          selectLengan();
      }  
       if (pieces[0].equals("plengan6"))
     {
          lengan=true;
          templateLengan = 6;
          selectLengan();
      }  
      
       if (pieces[0].equals("plengan7"))
     {
          lengan=true;
          templateLengan = 7;
          selectLengan();
      }  
         if (pieces[0].equals("plengan8"))
     {
          lengan=true;
          templateLengan = 8;
          selectLengan();
      }  
         if (pieces[0].equals("plengan9"))
     {
          lengan=true;
          templateLengan = 9;
          selectLengan();
      }  
        if (pieces[0].equals("plengan10"))
     {
          lengan=true;
          templateLengan = 10;
          selectLengan();
      }  
        if (pieces[0].equals("plengan11"))
     {
          lengan=true;
          templateLengan = 11;
          selectLengan();
      }  
       if (pieces[0].equals("plengan12"))
     {
          lengan=true;
          templateLengan = 12;
          selectLengan();
      }   
        if (pieces[0].equals("plengan13"))
     {
          lengan=true;
          templateLengan = 13;
          selectLengan();
      }  
        if (pieces[0].equals("plengan14"))
     {
          lengan=true;
          templateLengan = 14;
          selectLengan();
      }  
       if (pieces[0].equals("plengan15"))
     {
          lengan=true;
          templateLengan = 15;
          selectLengan();
      } 
        if (pieces[0].equals("plengan16"))
     {
          lengan=true;
          templateLengan = 16;
          selectLengan();
      }  
        if (pieces[0].equals("plengan16"))
     {
          lengan=true;
          templateLengan = 16;
          selectLengan();
      }  
       if (pieces[0].equals("plengan16"))
     {
          lengan=true;
          templateLengan = 16;
          selectLengan();
      } 
        if (pieces[0].equals("plengan17"))
     {
          lengan=true;
          templateLengan = 17;
          selectLengan();
      }  
        if (pieces[0].equals("plengan18"))
     {
          lengan=true;
          templateLengan = 18;
          selectLengan();
      }  
       if (pieces[0].equals("plengan19"))
     {
          lengan=true;
          templateLengan = 19;
          selectLengan();
      } 
        if (pieces[0].equals("plengan20"))
     {
          lengan=true;
          templateLengan = 20;
          selectLengan();
      }  
        if (pieces[0].equals("plengan21"))
     {
          lengan=true;
          templateLengan = 21;
          selectLengan();
      }  
       if (pieces[0].equals("plengan22"))
     {
          lengan=true;
          templateLengan = 22;
          selectLengan();
      } 
        if (pieces[0].equals("plengan23"))
     {
          lengan=true;
          templateLengan = 24;
          selectLengan();
      } 
      
         if (pieces[0].equals("prok1"))
     {
          rok=true;
          templateRok = 1;
          selectRok();
      } 
         if (pieces[0].equals("prok2"))
     {
          rok=true;
          templateRok = 2;
          selectRok();
      } 
         if (pieces[0].equals("prok3"))
     {
          rok=true;
          templateRok = 3;
          selectRok();
      } 
         if (pieces[0].equals("prok4"))
     {
          rok=true;
          templateRok = 4;
          selectRok();
      } 
         if (pieces[0].equals("prok5"))
     {
          rok=true;
          templateRok = 5;
          selectRok();
      } 
         if (pieces[0].equals("prok6"))
     {
          rok=true;
          templateRok = 6;
          selectRok();
      } 
         if (pieces[0].equals("prok7"))
     {
          rok=true;
          templateRok = 7;
          selectRok();
      } 
         if (pieces[0].equals("prok8"))
     {
          rok=true;
          templateRok = 8;
          selectRok();
      } 
         if (pieces[0].equals("prok9"))
     {
          rok=true;
          templateRok = 9;
          selectRok();
      } 
         if (pieces[0].equals("prok10"))
     {
          rok=true;
          templateRok = 10;
          selectRok();
      } 
         if (pieces[0].equals("prok11"))
     {
          rok=true;
          templateRok = 11;
          selectRok();
      } 
         if (pieces[0].equals("prok12"))
     {
          rok=true;
          templateRok = 12;
          selectRok();
      } 
         if (pieces[0].equals("prok13"))
     {
          rok=true;
          templateRok = 13;
          selectRok();
      } 
         if (pieces[0].equals("prok14"))
     {
          rok=true;
          templateRok = 14;
          selectRok();
      } 
         if (pieces[0].equals("prok15"))
     {
          rok=true;
          templateRok = 15;
          selectRok();
      } 
         if (pieces[0].equals("prok16"))
     {
          rok=true;
          templateRok = 16;
          selectRok();
      } 
         if (pieces[0].equals("prok17"))
     {
          rok=true;
          templateRok = 17;
          selectRok();
      } 
         if (pieces[0].equals("prok18"))
     {
          rok=true;
          templateRok = 18;
          selectRok();
      } 
      
         if (pieces[0].equals("pgaun1"))
     {
          gaun=true;
          templateGaun = 1;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun2"))
     {
          gaun=true;
          templateGaun = 2;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun3"))
     {
          gaun=true;
          templateGaun = 3;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun4"))
     {
          gaun=true;
          templateGaun = 4;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun5"))
     {
          gaun=true;
          templateGaun = 5;
          selectGaun();
      } 
     if (pieces[0].equals("pgaun6"))
     {
          gaun=true;
          templateGaun = 6;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun7"))
     {
          gaun=true;
          templateGaun = 7;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun8"))
     {
          gaun=true;
          templateGaun = 8;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun9"))
     {
          gaun=true;
          templateGaun = 9;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun10"))
     {
          gaun=true;
          templateGaun = 10;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun11"))
     {
          gaun=true;
          templateGaun = 11;
          selectGaun();
      } 
          if (pieces[0].equals("pgaun12"))
     {
          gaun=true;
          templateGaun = 12;
          selectGaun();
      } 
        if (pieces[0].equals("pcelana1"))
         {
          celana=true;
          templateCelana = 1;
          selectCelana();
          } 
        if (pieces[0].equals("pcelana2"))
         {
          celana=true;
          templateCelana = 2;
          selectCelana();
          } 
        if (pieces[0].equals("pcelana3"))
         {
          celana=true;
          templateCelana = 3;
          selectCelana();
          } 
        if (pieces[0].equals("pcelana4"))
         {
          celana=true;
          templateCelana = 4;
          selectCelana();
          } 
        if (pieces[0].equals("pcelana5"))
         {
          celana=true;
          templateCelana = 5;
          selectCelana();
          } 
        if (pieces[0].equals("pcelana6"))
         {
          celana=true;
          templateCelana = 6;
          selectCelana();
        } 
    }  
    reader.close();
    }
  
  catch(IOException e) {
    e.printStackTrace();
    }
}

//davin
import java.util.*;
import java.io.*;
import java.lang.Math; 

PShape s,ps;
PrintWriter outp;
PGraphics pgraph;
int sx,sy;
boolean end=false;
boolean stop=false;
int counter=0;

ArrayList<Individu> pop = new ArrayList<Individu>();
ArrayList<Individu> population = new ArrayList<Individu>();
ArrayList<Individu> fp = new ArrayList<Individu>();
ArrayList<Individu> max = new ArrayList<Individu>();
ArrayList<Individu> cov = new ArrayList<Individu>();
ArrayList<Individu> mut = new ArrayList<Individu>();
Individu better = new Individu();
Individu best = new Individu();

boolean firstrun=true;
int d=0;

ArrayList<Pattern> setChromosome(String[] gen){
  PShape chi;
  ArrayList<Pattern> c = new ArrayList<Pattern>();
  
  for(int i=0;i<gen.length;i++){
    String name = gen[i];
    chi = s.getChild(name);
    Pattern p = new Pattern(chi,name);
    c.add(p);
  }
  //Collections.shuffle(c);
  return c;
}

ArrayList<Individu> initialization(ArrayList<Pattern> chro, int n){
  ArrayList<Individu> p = new ArrayList<Individu>();
  
  for(int i=0;i<n;i++){
    ArrayList<Pattern> c = new ArrayList<Pattern>(chro);
    Individu z = new Individu();
    
    for(int j=0;j<c.size();j++){
      Random r = new Random();
      int id=r.nextInt(c.size());
      int[] ro={0,90,180,270};
      int rotasi=r.nextInt(ro.length);
      Pattern patt = new Pattern(c.get(id).getShape(),c.get(id).getId());
      //c.get(id).setR(ro[rotasi]);
      patt.setR(ro[rotasi]);
      z.add(patt);
      c.remove(c.get(id));
      j--;
    }
    
    boolean same=true;
    for(int j=0;j<p.size();j++){
      if(!p.get(j).checkDuplicate(z)){ //terduplikasi
        same=false;
        i--;
        break;
      }
    }
    
    if(same){
      p.add(z);
      evaluation(z);
    } 
  }
  
  return p;
}

Individu evaluation(Individu z){
  boolean stop = false;
  int pojok=0;
  
  for(int i=0;i<z.size();i++){
    z.get(i).setX(2*width/3+20);
    z.get(i).setY(125);
  }
  
  while(!stop) {
    pgraph=createGraphics(sx,sy);
    pgraph.beginDraw();
    pgraph.background(255);
    //pg.stroke(255,255,255,50);
    //pg.fill(0,0,0,50);
    
    for(int i=0;i<z.size();i++){
      boolean skip=true;
      Pattern patt = z.get(i);
      pgraph.shape(patt.getShape(),patt.getX(),patt.getY()); //draw translate - center point
      //println(patt.getX(),patt.getY());
      //println(patt);
      pgraph.endDraw();
      
      image(pgraph, 2*width/3+20, pg[1].height+100);
      pgraph.loadPixels();
      int min=0;
      int pos;
      //j<sx*sy diganti
      for(int j=width*124+(2*width/3+20); j<sx*sy; j++){
        color c=pgraph.pixels[j];
        pos = j%sx;
        //warna pixel paling ujung
        if(c<-1 && pos>pojok){
          pojok=pos;
        }
              
        //cari warna paling gelap
        if(min>c){
          min=c;
        }
              
        //pixel baris terakhir
        if(j>sx*sy-sx){
          if(c<-1){
            end=true;
          }
        }
      }
        
      //warna lebih gelap
      //if(min<-3289651){
      if(min<-3289651){
        //print("overlap");
        //gambar ga muat dibawah
        if(end){
          patt.resetY();
          patt.setUX(patt.getX()+1);
          end=false;
        }else{
          patt.setUY(patt.getY()+1);
        }
      }else{
        //print("separate");
        //print(xaxis);
        //print(yaxis);
        skip=false;
        if(i==z.size() - 1){
          stop=true;
        }
      }
      //println(z.get(0)+" "+z.get(1)+" "+z.get(2));
      z.setFit(pojok);
      //print("fitness: "+pojok);
      
      pgraph.beginDraw();
      if(skip){
        break;
      }
    }
    pgraph.endDraw();
  }
  
  return z;
}
