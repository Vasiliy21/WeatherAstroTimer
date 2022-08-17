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
        fetchTimerAF()
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
        return astroTimer.description
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        weatherLabel.text = astroTimer.description
    }


}

extension MainViewController {
    private func fetchTimerAF() {
        AF.request(Link.timerURL.rawValue)
            .validate()
            .responseJSON { [weak self] dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let timersData = value as? [[String: Any]] else { return }
                    for timerData in timersData {
                        let timer = Timer(
                            product: timerData["product"] as? String ?? "",
                            dataseries: timerData["dataseries"] as? [DataSeries] ?? [DataSeries(timepoint: 0, cloudcover: 0, seeing: 0, wind10m: WindSpeed.init(direction: "", speed: 0), temp2m: 0)]
                        )
                        self?.astroTimer.append(timer)
                        print(self?.astroTimer ?? "")
                    }
                    self?.successAlert()
                case .failure(let error):
                    print(error)
                }
                self?.failedAlert()
            }
    }
}

