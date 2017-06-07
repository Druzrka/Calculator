//
//  ViewController.swift
//  calculator
//
//  Created by Захар on 06.06.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func applyOperation(operation: Int) {
        
        let divideButton = 13
        let multiplyButton = 14
        let minusButton = 15
        let plusButton = 16
        
        switch operation {
        case divideButton:
            label.text = String(previousNumber / numberOnScreen)
            break
            
        case multiplyButton:
            label.text = String(previousNumber * numberOnScreen)
            break
            
        case minusButton:
            label.text = String(previousNumber - numberOnScreen)
            break
            
        case plusButton:
            label.text = String(previousNumber + numberOnScreen)
            break
            
        default:
            break
        }
        
    }
    
    func clearAll() {
        
        label.text = ""
        performingMath = false
        previousNumber = 0
        numberOnScreen = 0
        operation = 0
    }
    
    func nubmerToPrecent() {
        
        numberOnScreen *= 0.01
        label.text = String(numberOnScreen)
    }
    
    func switchNubmerSign() {
        
        numberOnScreen *= -1
        label.text = String(numberOnScreen)
    }
    
    func addDotToNumber() {
        
        if !(label.text?.contains("."))! {
            label.text?.append(".")
        }
    }
    
    func getOperation(tag: Int) {
        
        operation = tag
        previousNumber = Double(label.text!)!
        performingMath = true
    }
    
    let clearButton = 10
    let negativeButton = 11
    let percentButton = 12
    let equallyButton = 17
    let dotButton = 18
    let maxQuantityOfDigitsInLabel = 7
    
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!

    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            label.text = String(sender.tag)
            numberOnScreen = Double(label.text!)!
            performingMath = false
            
        } else {
            label.text = label.text! + String(sender.tag)
            numberOnScreen = Double(label.text!)!
        }
        
        if (label.text?.characters.count)! > maxQuantityOfDigitsInLabel {
            label.font = label.font.withSize(40)
        } else {
            label.font = label.font.withSize(70)
        }
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        if !(label.text?.isEmpty)! {
          
            switch sender.tag {
            case clearButton:
                clearAll()
                break
            
            case percentButton:
                nubmerToPrecent()
                break
            
            case negativeButton:
                switchNubmerSign()
                break
            
            case dotButton:
                addDotToNumber()
                break
            
            case equallyButton:
            applyOperation(operation: operation)
            break
            
            default:
                getOperation(tag: sender.tag)
                break
            }
        
            if label.text?.characters.last == "0" {
                numberOnScreen = Double(label.text!)!
                label.text = String(Int(numberOnScreen))
            }
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
