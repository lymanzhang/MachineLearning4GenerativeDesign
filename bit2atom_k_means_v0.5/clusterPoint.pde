class clusterPoint {
  PVector spLoc;
  int index; //index of sample / data sample
  int clusterGroup; //level of cluster
  int clusterclass;

  clusterPoint(PVector spLoc_, int index_, int clusterGroup_, int clusterclass_) {
    spLoc = spLoc_;
    index = index_;
    clusterGroup = clusterGroup_;
    clusterclass = clusterclass_;
  }

  void run() {
    display();
  }

  void display() {
    stroke(spkColor[index]); //255/(clusterGroup+1)*clusterGroup);
    strokeWeight(10);
    fill(0);
    ellipse(spLoc.x, spLoc.y, 15, 15);
    fill(0);
    text("Cluster_"+index, spLoc.x + 10, spLoc.y + 5);
  }
}
