//: Playground - noun: a place where people can play

import UIKit

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
    var description: String {
        return "name is \(name)"
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String,director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name:String,artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        movieCount++
    } else if item is Song {
        songCount++
    }
}
movieCount
songCount

for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name),dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}



let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]

for object in someObjects {
    let movie = object as! Movie
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}

for movie in someObjects as! [Movie] {
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}

var anyobjects = [AnyObject]()

anyobjects.append(12)
anyobjects.append(Movie(name: "die speed", director: "Meidu"))
anyobjects

