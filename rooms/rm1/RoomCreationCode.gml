if (!audio_is_playing(snd_background_crowd)) {
    audio_play_sound(snd_background_crowd, 10, true);
	
	audio_sound_gain(snd_background_crowd, 0.2, 0);
}