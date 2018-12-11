void UI() {
  cp = new ControlP5(this);
  cp.addSlider("kTmp")
    .setPosition(50, 20)
    .setSize(200, 20)
    .setRange(1, 50)
    .setLabel("ClusterNumber")
    .setColorLabel(0)
    .setColorValue(0)
    ;
}
