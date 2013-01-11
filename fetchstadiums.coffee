###
	Copyright 2013 David Pearson.
	All rights reserved.
###

fs=require "fs"
http=require "http"

connect=(host, path, cb) ->
	req=http.request {method:"GET", host:host, path:path, headers:"User-Agent":"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.A.B.C Safari/525.13"}, (res) ->
		body=""

		res.on "data", (chunk) ->
			body+=chunk

		res.on "end", ->
			cb body, path

	req.end()

stadiums={}

connect "en.wikipedia.org", "/wiki/List_of_NHL_arenas", (body, path) ->
	lines=body.toString().replace(/\n/g, "").split("</a></td><td><b><a href=\"")

	outdoors=lines[lines.length-1].split("Reference</th>")[9].split("</a></th><td><a href=\"").slice(1)
	for item in outdoors
		lines.push item.split("</td></tr></table>")[0]

	i=1
	done=0

	while i<lines.length
		url=lines[i].split("\" title=\"")[0]

		connect "en.wikipedia.org", url, (body, path) =>
			name=path.split("/wiki/")[1].replace(/_/g, " ").replace(/%26/g, "&").replace(/\s*\([A-z0-9\s]*\)/g, "")
			coords=body.toString().split("<span class=\"geo\">")[1].split("</span>")[0].split("; ")

			parts=body.toString().replace(/\n/g, "").split("</a> (<a href=\"/wiki/National_Hockey_League\" title=\"National Hockey League\">NHL</a>)")
			team=""
			if parts.length>1
				team=parts[0].substring(parts[0].lastIndexOf(">")+1)

			stadiums[name]={"lat":parseFloat(coords[0]), "long":parseFloat(coords[1]), "team":team}

			done++
			if done==lines.length-1
				teams={}
				for s of stadiums
					t=stadiums[s].team
					if t!=""
						teams[t]={"arena":s, "lat":stadiums[s].lat, "long":stadiums[s].long}

				fs.writeFileSync "arenas.json", JSON.stringify(stadiums)
				fs.writeFileSync "teams.json", JSON.stringify(teams)
		i++