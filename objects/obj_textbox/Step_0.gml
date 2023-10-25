/// @description Animation and effects

// fade effects
switch fadeMe {
	// fade in 
	case 0: {
		if (image_alpha < 1) {
			image_alpha += fadeSpeed;
		}
		if (image_alpha == 1) {
			fadeMe = 1;
		}
	}; break;
		//fade out
	case 2: {
		if (image_alpha > 0) {
			image_alpha -= fadeSpeed;
		}
		if (image_alpha == 0) {
			fadeMe = 3;
			//queue up destroy
			alarm[0] = 2;
		}
	}; break;

}