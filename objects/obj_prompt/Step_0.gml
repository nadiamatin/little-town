/// @description Effects and animation

// bob up and down
y += shift;

// fade effects
switch fadeMe {
	// fade in
	case "fadeIn": {
		if (image_alpha < 1) {
			image_alpha += fadeSpeed;
		}
		if (image_alpha >= 1) {
			fadeMe = "fadeVisible";
		}
	}; break;
	// fade out
	case "fadeOut": {
		if (image_alpha > 0) {
			image_alpha -= fadeSpeed;
		}
		if (image_alpha <= 0) {
			fadeMe = "fadeDone";
			alarm[0] = 2; // queue up destroy
		}
	}; break;
}