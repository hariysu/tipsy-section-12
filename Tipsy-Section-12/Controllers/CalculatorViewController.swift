//
//  ViewController.swift
//  Tipsy-Section-12
//
//  Created by Abdurahman on 5.10.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var chosenTip: Float?
    
    var result: String = ""
    var numberOfPeople: String = ""
    var chosenPercentage: String = ""

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        chosenPercentage = sender.currentTitle!
        chosenTip = (Float(chosenPercentage.dropLast(1)) ?? 0) / 100
        
        //Dismiss the keyboard when user choose any tip button
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != "" {
            let totalValue = Float(billTextField.text!)! * (1 + chosenTip!)
            result = String(format: "%.2f", totalValue / Float(splitNumberLabel.text!)!)
            
            // To go to ResultsViewController
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = result
            destinationVC.numberOfPeople = splitNumberLabel.text ?? ""
            destinationVC.tipPercentage = chosenPercentage
        }
    }
}

