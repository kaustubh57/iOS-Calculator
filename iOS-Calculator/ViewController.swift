//
//  ViewController.swift
//  iOS-Calculator
//
//  Created by Kaustubh Kesarkar on 12/16/16.
//  Copyright © 2016 com.devkau. All rights reserved.
//

import UIKit

enum CalculatorAction {
    case ADDITION
    case SUBTRACTION
    case EQUALS
    case RESET
    case CALCULATION
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    var storePreviousValue:Int = 0
    var displayOutputValue:Int = 0
    var currentAction: CalculatorAction = CalculatorAction.RESET
    
    func updateOutputLabel() {
        outputLabel.text = "\(displayOutputValue)"
    }
    
    func resetDataAndOutputValue() {
        updateCurrentAction(action: CalculatorAction.RESET)
        storePreviousValue = 0
        displayOutputValue = 0
        updateOutputLabel()
    }
    
    func updateOutputValueOnPressOfNumber(currentValue: Int) {
        if (CalculatorAction.ADDITION == currentAction) {
            storePreviousValue = storePreviousValue + currentValue
        } else if (CalculatorAction.SUBTRACTION == currentAction) {
            storePreviousValue = storePreviousValue - currentValue
        } else if (CalculatorAction.RESET == currentAction) {
            storePreviousValue = currentValue
        } else if (CalculatorAction.CALCULATION == currentAction) {
            //TODO: implement here to append number and display
        }
        
        displayOutputValue = currentValue;
        updateOutputLabel()
        updateCurrentAction(action: CalculatorAction.CALCULATION)
    }
    
    func updateOutputValueOnPressOfAction(action: CalculatorAction) {
        updateCurrentAction(action: action)
        displayOutputValue = 0
        updateOutputLabel()
    }
    
    func updateOutputValueOnEquals() {
        updateCurrentAction(action: CalculatorAction.EQUALS)
        displayOutputValue = storePreviousValue
        updateOutputLabel()
    }
    
    func updateCurrentAction(action: CalculatorAction) {
        currentAction = action
    }
    
    @IBAction func press9(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 9)
    }
    @IBAction func press8(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 8)
    }
    
    @IBAction func press7(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 7)
    }
    
    @IBAction func press6(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 6)
    }
    
    @IBAction func press5(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 5)
    }
    
    @IBAction func press4(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 4)
    }
    
    @IBAction func press3(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 3)
    }
    
    @IBAction func press2(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 2)
    }
    
    @IBAction func press1(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 1)
    }
    
    @IBAction func press0(_ sender: Any) {
        updateOutputValueOnPressOfNumber(currentValue: 0)
    }
    
    @IBAction func pressMinus(_ sender: Any) {
        updateOutputValueOnPressOfAction(action: CalculatorAction.SUBTRACTION)
    }
    
    @IBAction func pressPlus(_ sender: Any) {
        updateOutputValueOnPressOfAction(action: CalculatorAction.ADDITION)
    }
    
    @IBAction func pressEquals(_ sender: Any) {
        updateOutputValueOnEquals()
    }
    
    @IBAction func pressReset(_ sender: Any) {
        resetDataAndOutputValue();
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

