//
//  ShowViewController.swift
//  WeatherAstroTimer
//
//  Created by Vasiliy on 14.08.2022.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = "Показывает какой будет прогноз \n через время, которое выбрали"
    }

}
