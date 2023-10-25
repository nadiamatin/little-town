/// @description Variables and Setup

// textbox variables

textToShow = "Sample text";
textWidth = 450;
lineHeight = 28;
fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;

global.playerControl = false;

// play UI sound
audio_play_sound(snd_pop01, 1, 0);

// dismiss any visible prompts
scr_dismissPrompt(obj_prompt, 0);
