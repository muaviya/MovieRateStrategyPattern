//
//  MovieRatingStrategy.swift
//  FIlmStrategy
//
//  Created by ios_dev717 on 02.12.2020.
//

//Опредилим структуру для упрощения.
struct RatingAlgorithm {
    var ratingServiceName: String
    var rating: String
    var review: String
}

// Классы (KinoPoisk, IMDb, Ivi) реализующие конкретную
// стратегию, должны наследовать этому интерфейсу(он же протокол)

// Класс контекста (ViewController) использует этот
// интерфейс для вызова конкретной стратегии
protocol MovieRatingStrategy {
    func getRatingAlgorithm() -> RatingAlgorithm
}

// Первая конкретная реализация-стратегия.
class KinoPoisk: MovieRatingStrategy {
    func getRatingAlgorithm() -> RatingAlgorithm {
         RatingAlgorithm(ratingServiceName: "KinoPoisk",
                         rating: "6/10",
                         review: "На один раз")
    }
}

// Вторая конкретная реализация-стратегия.
class IMDb: MovieRatingStrategy {
    func getRatingAlgorithm() -> RatingAlgorithm {
         RatingAlgorithm(ratingServiceName: "IMDb",
                         rating: "95%",
                         review: "Отличный фильм")
    }
}

// Третья конкретная реализация-стратегия.
// Реализаций может быть сколько угодно много.
class Ivi: MovieRatingStrategy {
    func getRatingAlgorithm() -> RatingAlgorithm {
         RatingAlgorithm(ratingServiceName: "Ivi",
                         rating: "9/10",
                         review: "Всем советую")
    }
}

