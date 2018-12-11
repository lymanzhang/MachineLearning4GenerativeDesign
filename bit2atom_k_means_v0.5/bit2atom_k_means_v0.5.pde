/*
* K-Means clustering
 * by Lyman ZHANG
 * 12-09-2018
 */

import controlP5.*;

ControlP5 cp;
samplePoint[] sp;
clusterPoint[] spk; //CENTER POINTS OF CLUSTERS
color[] spkColor; //COLOR OF CLUSTERS

Table clusterTable;

int k = 6;
int kTmp = 6;
int SampleTotalNum = 50;
int clusterIndex = 0;
float precision = 1000;

boolean clustering = false;
boolean displayConnections = false;
boolean displaySampleIndex = false;
boolean finished = false;
boolean saveClusterTable = false;

void setup() {
  //frameRate(1);
  size(800, 800);
  UI();
  initiateData(); //generate data
}

void initiateData() {
  generateSampleData();
  randomkpoint();
  generateColorTag();
}

void draw() {
  background(255);
  if (clustering) {
    clustergroup(spk);
    updateClusterGroup();
  }

  displayData();
  println("precision02: "+precision);

  if (precision == 0) {
    clustering = false;
    finished = true;
  }

  if (finished) {
    saveClusterTable = true;
  }

  if (saveClusterTable) {
    saveClusterTable();
    saveClusterTable = false;
  }

  //if (displayConnections && (clustering || finished)) {
  if (displayConnections) {
    drawConnections();
  }

  trackUpdate();
}

void displayData() {
  for (int i = 0; i < sp.length; i ++) {
    sp[i].run();
  }

  for (int i = 0; i < spk.length; i ++) {
    spk[i].run();
  }
}

void keyPressed() {
  if (key == 'a') {
    initiateData();
    clustering = false;
    finished = false;
    precision = 1000;
    clusterIndex = 0;
  }
  if (key == 'c') {
    if (!clustering) {
      clustering = true;
    } else {
      clustering = false;
    }
  }
  if (key == 'l') {
    if (!displayConnections) {
      displayConnections = true;
    } else {
      displayConnections = false;
    }
  }
  if (key == 'i') {
    if (!displaySampleIndex) {
      displaySampleIndex = true;
    } else {
      displaySampleIndex = false;
    }
  }
}

void generateColorTag() {
  spkColor = new color[spk.length];
  for (int i = 0; i < spkColor.length; i ++) {
    spkColor[i] = color(random(255), random(255), random(255));
  }
}

void trackUpdate() {
  if (kTmp != k) {
    k = kTmp;
    randomkpoint();
    clustering = false;
    finished = false;
    precision = 1000;
    generateColorTag();
  }
}
