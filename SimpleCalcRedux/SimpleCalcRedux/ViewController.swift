//
//  ViewController.swift
//  SimpleCalcRedux
//
//  Created by Ian Palmgren on 10/20/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isTyping = false
    var firstNumber = 0.0
    var secondNumber = 0.0
    var operation = ""
    var resultsArray = [Double]()
    

    @IBOutlet weak var calculatorDisplay: UILabel!
    
    func fact(n: Double) -> Double {
        if n == 0 {
            return 1
        } else {
            return n * fact(n-1)
        }
    }
    
    @IBAction func clearButton(sender: UIButton) {
        isTyping = false
        calculatorDisplay!.text = "0.0"
        resultsArray = []
    }
    
    @IBAction func buttonOne(sender: UIButton) {
        let number = sender.currentTitle
        if isTyping {
            calculatorDisplay!.text = calculatorDisplay!.text! + number!
        } else {
            calculatorDisplay.text = number
            isTyping = true
        }
    }
    

    @IBAction func calculationTapped(sender: AnyObject) {
        operation = (sender.currentTitle!)!
        isTyping = false
        firstNumber = Double(calculatorDisplay.text!)!
    }
    
    @IBAction func equalsTapped(sender: AnyObject) {
        isTyping = false
        var result = 0.0
        
        
        switch operation {
        case "+":
            isTyping = false
            secondNumber = Double(calculatorDisplay.text!)!
            result = firstNumber + secondNumber
        case "-":
            isTyping = false
            secondNumber = Double(calculatorDisplay.text!)!
            result = firstNumber - secondNumber
        case "*":
            isTyping = false
            secondNumber = Double(calculatorDisplay.text!)!
            result = firstNumber * secondNumber
        case "/":
            isTyping = false
            secondNumber = Double(calculatorDisplay.text!)!
            result = firstNumber / secondNumber
        case "%":
            isTyping = false
            secondNumber = Double(calculatorDisplay.text!)!
            result = firstNumber % secondNumber
        case "count":
            resultsArray.append(Double(calculatorDisplay.text!)!)
            result = Double(resultsArray.count)
        case "avg":
            resultsArray.append(Double(calculatorDisplay.text!)!)
            var sum = 0.0
            for num in resultsArray {
                sum += num
            }
            result = sum / Double(resultsArray.count)
        default:
            calculatorDisplay.text = "\(result)"

        }
        calculatorDisplay.text = "\(result)"
        
    }
    
    
    
    
    @IBAction func operandButton(sender: UIButton) {
        isTyping = false
        operation = (sender.currentTitle!)
        var result = 0.0
        firstNumber = Double(calculatorDisplay.text!)!
        
       
        switch operation {
        case "count":
            resultsArray.append(firstNumber)
        case "fact":
            result = fact(firstNumber)
            calculatorDisplay.text = "\(result)"
        case "avg":
            resultsArray.append(firstNumber)
        default:
            calculatorDisplay.text = "\(result)"
            
        }
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