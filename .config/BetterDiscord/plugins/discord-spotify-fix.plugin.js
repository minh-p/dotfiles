//META{"name":"SpotifyFixer"}*//

class SpotifyFixer {
    getName() {
    	return "Spotify Pause Blocker";
    }

    getDescription() {
    	return "Keeps Discord from pausing your Spotify after 30 secconds of constant mic input.";
    }

    getVersion() {
    	return "0.0.1";
    }

    getAuthor() {
    	return "Noah Cardoza (MacHacker#7322)";
    }

    start() {
    	// save the orignial open function
      XMLHttpRequest.prototype.realOpen = XMLHttpRequest.prototype.open;
      
      // create a new function to filter out certain urls 
      var myOpen = function(method, url, async, user, password) {
      	// redirects the /pause to /play (which will do nothing since Spotify is already playing)
        if (url == "https://api.spotify.com/v1/me/player/pause") {
          url = "https://api.spotify.com/v1/me/player/play";
        }
        this.realOpen (method, url, async, user, password);
      }
      
      // overwrite the original open with our modded version
      XMLHttpRequest.prototype.open = myOpen;
    }

    stop() {
    	XMLHttpRequest.prototype.open = XMLHttpRequest.prototype.realOpen;
    }
}
