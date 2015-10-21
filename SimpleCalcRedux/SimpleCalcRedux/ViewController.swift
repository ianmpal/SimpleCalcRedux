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
    var firstNumber = 0
    var secondNumber = 0
    var operation = ""
    

    @IBOutlet weak var calculatorDisplay: UILabel!
    
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
        isTyping = false
        firstNumber = Int(calculatorDisplay.text!)!
        operation = (sender.currentTitle!)!
    }
    
    @IBAction func equalsTapped(sender: AnyObject) {
        isTyping = false
        var result = 0
        secondNumber = Int(calculatorDisplay.text!)!
        
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        }
        
        calculatorDisplay.text = "\(result)"
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

/*

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Double {
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
}

func count(input: [String]) -> Int {
    return (input.count)
}

func avg(input: [String]) -> Double {
    var total: Double = 0
    var count: Double = 0
    for number in input {
        total += Double(convert(number))
        count++
    }
    return total / count
}

func fact(input: [String]) -> Double {
    var inputNum = convert(input[0])
    var result = 1.0
    while (inputNum > 0) {
        result = result * inputNum
        inputNum--
    }
    return result
}


var keepCalculating = true
while keepCalculating {
    
    let input1 = input()
    var textArray = input1.characters.split{$0 == " "}.map(String.init)
    let lastIndex: String = textArray[textArray.count-1].lowercaseString
    
    if lastIndex.rangeOfString("count") != nil || lastIndex.rangeOfString("fact") != nil || lastIndex.rangeOfString("avg") != nil {
        
        textArray.removeAtIndex(textArray.count-1)
        if input1.lowercaseString.rangeOfString("count") != nil {
            print("There are \(count(textArray)) numbers total.")
        } else if input1.lowercaseString.rangeOfString("avg") != nil {
            print("The average is: \(avg(textArray))")
        } else if input1.lowercaseString.rangeOfString("fact") != nil {
            if textArray.count == 1 {
                print("The factorial of \(textArray[0]) = \(fact(textArray))")
            } else {
                print("A factorial operation can only take in one number at a time. Please try again.")
            }
        }
        
    } else {
        let num1 = convert(input1)
        
        print("Enter an operation")
        var operation = input()
        var validOperation = true
        while validOperation {
            if operation.rangeOfString("+") == nil && operation.rangeOfString("-") == nil && operation.rangeOfString("/") == nil && operation.rangeOfString("*") == nil && operation.rangeOfString("%") == nil {
                print("Please enter a valid operation (+ - / * %).")
                operation = input()
            } else {
                validOperation = false
            }
        }
        
        print("Enter a number")
        let num2 = convert(input())
        
        var result = 0.0
        var resultDouble: Double = 0
        
        if operation == "+" {
            result = num1 + num2
        } else if operation == "-" {
            result = num1 - num2
        } else if operation == "/" {
            resultDouble = Double(num1)/Double(num2)
        } else if operation == "*" {
            result = num1*num2
        } else if operation == "%" {
            result = num1%num2
        }
        
        if operation == "/" {
            print("The result of \(num1) \(operation) \(num2) =  \(resultDouble)")
        } else {
            print("The result of \(num1) \(operation) \(num2) =  \(result)")
        }
        
    }
    
    print("\n\n" + "Would you like to perform another calculation? Please enter \"y\" or \"n\".")
    if input().lowercaseString.rangeOfString("n") != nil {
        keepCalculating = false
    }
    
}

*/