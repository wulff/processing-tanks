// Sound effects from: http://www.freesfx.co.uk/
// TODO: use a HashMap for the audio players

class Audio {
  AudioPlayer audioShot;
  AudioPlayer audioBlast;

  Audio() {
    audioShot = minim.loadFile("shot.mp3");
    audioBlast = minim.loadFile("blast.mp3");
  }

  void shot() {
    audioShot.rewind();
    audioShot.play();
  }

  void blast() {
    audioBlast.rewind();
    audioBlast.play();
  }
}

