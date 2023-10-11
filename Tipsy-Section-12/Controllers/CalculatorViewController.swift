//
//  ViewController.swift
//  Tipsy-Section-12
//
//  Created by Abdurahman on 5.10.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var chosenTip: Float?

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
        
        let chosenText = sender.currentTitle!
        chosenTip = Float(chosenText.dropLast(1))! / 100
        
        //Dismiss the keyboard when user choose any tip button
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != "" {
            let totalValue = Float(billTextField.text!)! * (1 + chosenTip!)
            print(String(format: "%.2f", totalValue / Float(splitNumberLabel.text!)!))
        }
        
    }
}

