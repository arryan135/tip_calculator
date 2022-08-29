//
//  ViewController.swift
//  prework
//
//  Created by Aryan Malik on 8/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var runningNum = ""

    @IBAction func numberPressed(_ sender: KeyPad) {
        runningNum += "\(sender.tag)"
        billAmountTextField.text = runningNum
        calculateTip(KeyPad())
    }
    
    
    @IBAction func dotPressed(_ sender: KeyPad) {
        runningNum += "."
        billAmountTextField.text = runningNum
        calculateTip(KeyPad())
    }
    
    @IBAction func clearPressed(_ sender: KeyPad) {
        if billAmountTextField.text?.isEmpty == false {
            billAmountTextField.text?.removeLast()
        }
        runningNum = billAmountTextField.text ?? ""
        calculateTip(KeyPad())
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}
