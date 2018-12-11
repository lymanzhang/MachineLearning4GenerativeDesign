class samplePoint {
  PVector spLoc;
  int index; //index of sample / data sample
  int clusterGroup; //level of cluster
  int clusterclass;

  samplePoint(PVector spLoc_, int index_, int clusterGroup_, int clusterclass_) {
    spLoc = spLoc_;
    index = index_;
    clusterGroup = clusterGroup_;
    clusterclass = clusterclass_;
  }

  void run() {
    display();
  }

  void display() {
    if (!clustering) {
      stroke(0);
    } else{
      stroke(spkColor[clusterGroup]); //(255/(clusterGroup+1)*clusterGroup);
    }
    strokeWeight(5);
    point(spLoc.x, spLoc.y);
    if (displaySampleIndex) {
      fill(0, 50);
      text(index + ":" + clusterGroup, spLoc.x + 5, spLoc.y + 5);
    }
  }
}
