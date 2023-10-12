//
//  ViewController.swift
//  Tipsy-Section-12
//
//  Created by Abdurahman on 5.10.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var result: String = ""
    var calculatorLogic = CalculatorLogic()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: 
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        calculatorLogic.chosenPercentage = sender.currentTitle!
        //Dismiss the keyboard when user choose any tip button
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        calculatorLogic.peopleCount = String(format: "%.0f", sender.value)
        splitNumberLabel.text = calculatorLogic.peopleCount
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != "" {
            result = calculatorLogic.calculate(billText: billTextField.text!)

            // To go to ResultsViewController
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = result
            destinationVC.numberOfPeople = calculatorLogic.peopleCount
            destinationVC.tipPercentage = calculatorLogic.chosenPercentage
        }
    }
}

