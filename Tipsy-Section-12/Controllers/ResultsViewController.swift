//
//  ResultsViewController.swift
//  Tipsy-Section-12
//
//  Created by Abdurahman on 5.10.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result: String = "0.0"
    var numberOfPeople: String = ""
    var tipPercentage: String = ""

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        settingsLabel.text = "Split between \(numberOfPeople ) people, with \(tipPercentage ) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        // To return back
        self.dismiss(animated: true)
    }
    
}
