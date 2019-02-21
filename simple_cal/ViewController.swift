//
//  ViewController.swift
//  simple_cal
//
//  Created by 강병우 on 2019. 2. 19..
//  Copyright © 2019년 강병우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private  weak var display: UILabel!
    private var userIsInTheMiddleOfTyping = false
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
        
    }
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    // swift 파일 임포터
    private var brain = CalculatorBrain()
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    

}

