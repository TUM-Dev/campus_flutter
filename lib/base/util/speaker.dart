class Speaker {
  static String getSpeakerName(String speakerString) {
    final speakers = speakerString.split(", ");
    final mainSpeaker = speakers.first.split(" [L]");
    return mainSpeaker.first.split(" (").first;
  }
}
