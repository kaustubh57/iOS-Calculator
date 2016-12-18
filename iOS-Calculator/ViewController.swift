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
    var lastAction: CalculatorAction = CalculatorAction.RESET
    var lastOperationAction: CalculatorAction = CalculatorAction.RESET
    
    func updateOutputLabel() {
        outputLabel.text = "\(displayOutputValue)"
    }
    
    func resetDataAndOutputValue() {
        updateLastAction(action: CalculatorAction.RESET)
        updateLastOperationAction(action: CalculatorAction.RESET)
        storePreviousValue = 0
        displayOutputValue = 0
        updateOutputLabel()
    }
    
    func updateOutputValueOnPressOfNumber(currentValue: Int) {
        displayOutputValue = Int("\(displayOutputValue)" + "\(currentValue)")!;
        updateOutputLabel()
        updateLastAction(action: CalculatorAction.CALCULATION)
    }
    
    func updateOutputValueOnPressOfAction(action: CalculatorAction) {
        if (CalculatorAction.CALCULATION == lastAction) {
            if (CalculatorAction.ADDITION == lastOperationAction) {
                storePreviousValue = storePreviousValue + displayOutputValue
            } else if (CalculatorAction.SUBTRACTION == lastOperationAction) {
                storePreviousValue = storePreviousValue - displayOutputValue
            } else {
                storePreviousValue = displayOutputValue
            }
        }
        displayOutputValue = 0
        updateOutputLabel()
        
        updateLastAction(action: action)
        updateLastOperationAction(action: action)
    }
    
    func updateOutputValueOnEquals() {
        if (CalculatorAction.ADDITION == lastOperationAction) {
            storePreviousValue = storePreviousValue + displayOutputValue
        } else if (CalculatorAction.SUBTRACTION == lastOperationAction) {
            storePreviousValue = storePreviousValue - displayOutputValue
        }
        displayOutputValue = storePreviousValue
        updateOutputLabel()
        updateLastAction(action: CalculatorAction.EQUALS)
    }
    
    func updateLastAction(action: CalculatorAction) {
        lastAction = action
    }
    
    func updateLastOperationAction(action: CalculatorAction) {
        lastOperationAction = action
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

