//
//  MainViewController.swift
//  WeatherAstroTimer
//
//  Created by Vasiliy on 14.08.2022.
//

import UIKit
import Alamofire

class MainViewController: UIViewController{

    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var weatherPiker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTimer()
        weatherPiker.dataSource = self
        weatherPiker.delegate = self
    }

    private var astroTimer: [Timer] = []

    @IBAction func buttonPressed() {
        weatherLabel.text = astroTimer.description
    }
    // MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )

            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }

    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )

            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}
extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return astroTimer.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return astroTimer[row].dataseries[row].timepoint.description
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        weatherLabel.text = astroTimer.description
    }


}

extension MainViewController {
    private func fetchTimer() {
        NetworkManager.shared.fetchTimer(from: Link.timerURL.rawValue) { [weak self] result in
            switch result {
            case .success(let timer):
                self?.astroTimer.append(timer)
                self?.weatherPiker.reloadAllComponents()
                self?.successAlert()
                print(self?.astroTimer)
            case .failure(let error):
                print(error.localizedDescription)
                self?.failedAlert()

            }
        }
    }
}

