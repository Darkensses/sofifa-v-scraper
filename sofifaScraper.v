import http

fn main() {
    base_url := "https://sofifa.com"
    mut array_leagues := []string

	html := http.get_text(base_url + "/leagues")  
	mut pos := 0
	for {
		pos = html.index_after('/league/', pos + 1)
		if pos == -1 {
			break
		}
		end := html.index_after('">', pos)
		//println(html.substr(pos, end))
        array_leagues << html.substr(pos, end)
	}

    pos = 0
    for i, url in array_leagues {
        pos = html.index_after(url, pos + 1)
        if pos == -1 {
			break
		}
		end := html.index_after('<', pos)
		println( i.str() + ": " + html.substr(pos + url.len + 2, end))
    }

    //println(array_leagues)
}