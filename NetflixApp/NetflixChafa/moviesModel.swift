//
//  moviesModel.swift
//  NetflixChafa
//
//  Created by Diplomado on 04/11/23.
//

import Foundation

enum Genre:String{
    case miedo
    case scifi
    case accion
}
struct Movie {
    var title: String
    var image: String
    var genre: Genre
}
struct MoviesGenre {
    var movies: [Movie]
    var genre: Genre
}

var scaryMovies = MoviesGenre(movies: [
    Movie(title: "El Exorcista 1", image: "exorcista", genre: .miedo),
    Movie(title: "Scary Movie", image: "ScaryMovie", genre: .miedo),
    Movie(title: "Anabel", image: "Anabel", genre: .miedo),
    Movie(title: "El Exorcista 4", image: "exorcista", genre: .miedo),
], genre: .miedo)
var actionMovies = MoviesGenre(movies: [
    Movie(title: "Harry Potter 1", image: "harry", genre: .accion),
    Movie(title: "Harry Potter 2", image: "harry", genre: .accion),
    Movie(title: "Harry Potter 3", image: "harry", genre: .accion),
    Movie(title: "Harry Potter 4", image: "harry", genre: .accion),
], genre: .accion)
var scifiMovies = MoviesGenre(movies: [
    Movie(title: "Rambo 1", image: "rambo", genre: .scifi),
    Movie(title: "Rambo 2", image: "rambo", genre: .scifi),
    Movie(title: "Rambo 3", image: "rambo", genre: .scifi),
    Movie(title: "Rambo 4", image: "rambo", genre: .scifi),
], genre: .scifi)

var moviesData = [scaryMovies, actionMovies, scifiMovies]

class movieCollectionViewModel {
    var movies: [Movie]
    init(movies: [Movie]) {
        self.movies = movies
    }
    
    func getMovieCount()->Int {movies.count}
    func getMovieTitle(at index: IndexPath) -> String { movies[index.row].title}
    func getMovieImage(at index: IndexPath) -> String {movies[index.row].image}
    func getMovieGenre(at index: IndexPath) -> Genre {movies[index.row].genre}
}

class movieTableViewModel {
    var moviesPerGenre: [MoviesGenre]
    init(moviesPerGenre: [MoviesGenre]) {
        self.moviesPerGenre = moviesPerGenre
    }
    
    func getSectionsPerGenre() -> Int {moviesPerGenre.count}
    func getSectionTitle(at index: Int) -> String { moviesPerGenre[index].genre.rawValue }
}
