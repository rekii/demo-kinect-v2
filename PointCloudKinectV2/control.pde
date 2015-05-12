void setupGUI() {
    color activeColor = color(0,130,164);
    controlP5 = new ControlP5(this);    
    
    //customization on visual design
    controlP5.setColorActive(activeColor);
    controlP5.setColorBackground(color(170));
    controlP5.setColorForeground(color(50));
    controlP5.setColorLabel(color(50));
    controlP5.setColorValue(color(255));

    ControlGroup ctrl = controlP5.addGroup("menu",15,25,35);
    ctrl.setColorLabel(color(255));
    ctrl.close();

    sliders = new Slider[20];
    slider2Ds = new Slider2D[2];
    ranges = new Range[10];
    toggles = new Toggle[15];

    int left = 0;
    int top = 5;
    int len = 300;

    int si = 0;
    int ri = 0;
    int ti = 0;
    int s2di = 0;
    int posY = 0;

    sliders[si++] = controlP5.addSlider("Canvas_Color",0,255,left,top+posY+0,len,15).plugTo(this,"backgroundColor").setValue(backgroundColor);
    posY += 30;
    sliders[si++] = controlP5.addSlider("Point_Color",0,255,left,top+posY+0,len,15).plugTo(this,"agentBrightness").setValue(agentBrightness);
    posY += 30;
    
    ranges[ri++] = controlP5.addRange("Distance",1,6,minD,maxD,left,top+posY,len,15);
    posY += 30;
    //sliders[si++] = controlP5.addSlider("opacity",0,255,left,top+posY+0,len,15).plugTo(this,"agentAlpha").setValue(agentAlpha);
    //posY += 30;
    sliders[si++] = controlP5.addSlider("scale",100,400,left,top+posY+0,len,15).plugTo(this,"scaleVal").setValue(scaleVal);
    posY += 30;
    sliders[si++] = controlP5.addSlider("resolution",4,40,left,top+posY+0,len,15).plugTo(this,"stride").setValue(stride);
    posY += 30;
    sliders[si++] = controlP5.addSlider("point_Size",1,20,left,top+posY+0,len,15).plugTo(this,"pointSize").setValue(pointSize);
    //posY += 30;
    //sliders[si++] = controlP5.addSlider("speedThresh",1,1200,left,top+posY+0,len,15).plugTo(this,"speedThresh").setValue(speedThresh);
    //posY += 30;
    //sliders[si++] = controlP5.addSlider("slowness",1,20,left,top+posY+0,len,15).plugTo(this,"slowness").setValue(slowness);
    //noise
    posY += 30;
    sliders[si++] = controlP5.addSlider("noise_Scale",1,1000,left,top+posY+0,len,15).plugTo(this,"noiseScale").setValue(noiseScale);
    posY += 30;
    sliders[si++] = controlP5.addSlider("noise_Strength",0,100,left,top+posY+0,len,15).plugTo(this,"noiseStrength").setValue(noiseStrength);
    posY += 30;
    sliders[si++] = controlP5.addSlider("depth",500,3000,left,top+posY+0,len,15).plugTo(this,"spaceSizeZ").setValue(spaceSizeZ);

    
    
    //toggle
    posY += 30;
    toggles[ti++] = controlP5.addToggle("Debug",left, top+posY, 15,15).plugTo(this,"ifDebug").setValue(ifDebug);
    //toggles[ti++] = controlP5.addToggle("Track",left + 30, top+posY, 15,15).plugTo(this,"ifDepthmap").setValue(ifDepthmap);
    //toggles[ti++] = controlP5.addToggle("Cube",left + 60, top+posY, 15,15).plugTo(this,"ifCube").setValue(ifCube);
    //toggles[ti++] = controlP5.addToggle("Debug",left + 90, top+posY, 15,15).plugTo(this,"ifDebug").setValue(ifDebug);
    //toggles[ti++] = controlP5.addToggle("Noise",left + 120, top+posY, 15,15).plugTo(this,"ifNoise").setValue(ifNoise);
    //toggles[ti++] = controlP5.addToggle("RGB",left + 150, top+posY, 15,15).plugTo(this,"ifRGB").setValue(ifRGB);
    //toggles[ti++] = controlP5.addToggle("Fog",left + 180, top+posY, 15,15).plugTo(this,"ifFog").setValue(ifFog);
    //toggles[ti++] = controlP5.addToggle("Mov",left + 210, top+posY, 15,15).plugTo(this,"ifVideo").setValue(ifVideo);
    //toggles[ti++] = controlP5.addToggle("Black&White",left + 240, top+posY, 15,15).plugTo(this,"ifShowDepth").setValue(ifShowDepth);
    //toggles[ti++] = controlP5.addToggle("limit",left + 270, top+posY, 15,15).plugTo(this,"ifRestrict").setValue(ifRestrict);
    //toggles[ti++] = controlP5.addToggle("line",left + 300, top+posY, 15,15).plugTo(this,"ifConnect").setValue(ifConnect);
    //toggles[ti++] = controlP5.addToggle("rotate",left + 330, top+posY, 15,15).plugTo(this,"ifRotate").setValue(ifRotate);
    //toggles[ti++] = controlP5.addToggle("record",left + 330, top+posY, 15,15).plugTo(this,"ifRecord").setValue(ifRecord);


    //video position: depth
    //posY += 30;
    //sliders[si++] = controlP5.addSlider("moviePosZ",-1000,1000,left,top+posY+0,len,15).plugTo(parent,"moviePosZ").setValue(moviePosZ);

    posY += 30;
    //ranges[ri++] = controlP5.addRange("moviePos",0,30,moviePosX,moviePosY,left,top+posY,len,15);
    slider2Ds[s2di++] = controlP5.addSlider2D("motion")
         .setPosition(0,posY)
         .setSize(100,100)
         .setArrayValue(new float[] {100, 1000});

    for (int i = 0; i < si; i++) {
      sliders[i].setGroup(ctrl);
      sliders[i].setId(i);
      sliders[i].captionLabel().toUpperCase(true);
      sliders[i].captionLabel().style().padding(4,0,1,3);
      sliders[i].captionLabel().style().marginTop = -4;
      sliders[i].captionLabel().style().marginLeft = 0;
      sliders[i].captionLabel().style().marginRight = -14;
      sliders[i].captionLabel().setColorBackground(0x99ffffff);
    }
    for (int i = 0; i < ri; i++) {
      ranges[i].setGroup(ctrl);
      ranges[i].setId(i);
      ranges[i].captionLabel().toUpperCase(true);
      ranges[i].captionLabel().style().padding(4,0,1,3);
      ranges[i].captionLabel().style().marginTop = -4;
      ranges[i].captionLabel().setColorBackground(0x99ffffff);
    }
    for (int i = 0; i < ti; i++) {
      toggles[i].setGroup(ctrl);
      //ranges[i].setId(i);
      toggles[i].captionLabel().toUpperCase(true);
      toggles[i].captionLabel().style().padding(4,0,1,3);
      toggles[i].captionLabel().style().marginTop = -4;
      toggles[i].captionLabel().setColorBackground(0x99ffffff);
    }
    for (int i = 0; i < s2di; i++) {
      slider2Ds[i].setGroup(ctrl);
      slider2Ds[i].setId(i);
      slider2Ds[i].captionLabel().toUpperCase(true);
      slider2Ds[i].captionLabel().style().padding(4,0,1,3);
      slider2Ds[i].captionLabel().style().marginTop = -4;
      slider2Ds[i].captionLabel().setColorBackground(0x99ffffff);
    }
    
}

  void drawGUI() {
    controlP5.show();
    controlP5.draw();
    
    //pushStyle();
    //textSize(20);
    //fill(150);
    //text("FRAMERATE: " + (int)frameRateDisplay, 150, 20);
    //popStyle();
}

  
void controlEvent(ControlEvent theControlEvent) {
    //println("got a control event from controller with id "+theEvent.controller().id());
    
    if(theControlEvent.controller().name().equals("Distance")) {
      float[] f = theControlEvent.controller().arrayValue();
      minD = f[0];
      maxD = f[1];
    }
    
}














