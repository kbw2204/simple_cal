//
//  CalculatorBrain.swift
//  simple_cal
//
//  Created by 강병우 on 20/02/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

class CalculatorBrain{
    private var accumulator = 0.0
    func setOperand(operand: Double) {
        accumulator = operand
    }
    func performOperation(symbol: String) {
        switch symbol {
        case "π":
            accumulator = Double.pi
        case "√":
            accumulator = sqrt(accumulator)
        default: break
        }
    }
    var result: Double {
        get {
            return accumulator
        }
    }
}
