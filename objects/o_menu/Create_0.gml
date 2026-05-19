// Check if the music is ALREADY playing first!
if (!audio_is_playing(snd_soundtrack)) {
    
    // If it is NOT playing, start it and set loop to true!
    audio_play_sound(snd_soundtrack, 10, true);
    
}

options = ["Play", "Settings", "Quit"];
index = 0;