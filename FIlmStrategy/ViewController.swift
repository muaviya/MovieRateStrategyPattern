//
//  ViewController.swift
//  FIlmStrategy
//
//  Created by ios_dev717 on 01.12.2020.
//

import UIKit

class ViewController: UIViewController {
    enum RatingService: Int {
        case  IBMd = 0, KinoPoisk, Ivi, none
    }
    
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var reviewLbl: UILabel!
    @IBOutlet weak var segment: UISegmentedControl! {
        didSet {
            segment.selectedSegmentIndex = UISegmentedControl.noSegment
        }
    }
    
    var ratingService: RatingService = .none
    
    // Ссылка на интерфейс MovieRatingStrategy
    // позволяет автоматически переключаться между конкретными реализациями
    // (другими словами, это выбор конкретной стратегии).
    private var movieRatingStrategy: MovieRatingStrategy?
    
    // Метод для установки стратегии.
    // Служит для смены стратегии во время выполнения.
    func setStrategy(movieRatingStrategy: MovieRatingStrategy) {
        self.movieRatingStrategy = movieRatingStrategy
    }

    @IBAction func segmentChanges(_ sender: UISegmentedControl) {
        ratingService = RatingService(rawValue: sender.selectedSegmentIndex) ?? .none
        switch  ratingService {
        case .IBMd:
            // Устанавливаем первую стратегию
            setStrategy(movieRatingStrategy: IMDb())
        case .KinoPoisk:
            // Заменяем в контексте первую стратегию второй.
            setStrategy(movieRatingStrategy: KinoPoisk())
        case .Ivi:
            // Заменяем в контексте первую стратегию второй.
            setStrategy(movieRatingStrategy: Ivi())
        case .none:
            print("сервис не выбран")
        }
        
        // Выполняем операцию контекста, которая использует текущую стратегию.
        updateUI()
    }
    
    // Некоторая функциональность контекста, которая выбирает
    //стратегию и использует её для решения своей задачи.
    fileprivate func updateUI() {
        guard let movieRatingStrategy = movieRatingStrategy else {
            return
        }
        let strategy = movieRatingStrategy.getRatingAlgorithm()
        rateLbl.text = strategy.rating
        reviewLbl.text = strategy.review
    }
}

