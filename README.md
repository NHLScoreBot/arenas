## NHL Arena Data ##

This repository provides both some data about NHL arenas (generated from Wikipedia's [pages](https://en.wikipedia.org/wiki/List_of_NHL_arenas) on the subject) and a script to generate the output data.

### Using ###

The generated data is just JSON, and can be used as you would use any data in that format. In `arenas.json`, keys are arena names, and the objects have `lat`, `long`, and `team` properties; the values of `lat` and `long` both are integers (South and West are negative), while `team` is a string.

Example arena record:

		"Consol Energy Center": {
			"lat":40.43944,
			"long":-79.98917,
			"team":"Pittsburgh Penguins"
		}

Meanwhile, the data in `teams.json` is similar, but the keys are team names (city and name), and the arena is an object in the entry.

Example team record:

		"Pittsburgh Penguins": {
			"arena":"Consol Energy Center",
			"lat":40.43944,
			"long":-79.98917
		}

### Fetching over HTTP ###

If you need the arena name as a key, just make a GET request to `https://raw.github.com/nhlscorebot/arenas/master/arenas.json`, parse the JSON, and go.

If you want keys to be the home team, make a GET request to `https://raw.github.com/nhlscorebot/arenas/master/teams.json` to get the data.

### Building the Data File ###

Simple! Just run `node fetchstadiums.js` and you've got shiny new `arenas.json` and `teams.json` files.

### Legal ###

`arenas.json` is hereby released into the public domain. Where this is not possible, `arenas.json` may be used and distributed completely freely, with no legal requirements whatsoever.

`teams.json` is hereby released into the public domain. Where this is not possible, `teams.json` may be used and distributed completely freely, with no legal requirements whatsoever.

`fetchstadiums.coffee` and `fetchstadiums.js`, part of [@NHLScoreBot](https://twitter.com/nhlscorebot), is provided to you under the following license:

	Copyright (c) 2013-2014, David Pearson
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

	Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
	Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.