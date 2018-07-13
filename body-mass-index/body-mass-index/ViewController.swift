//
//  ViewController.swift
//  body-mass-index
//
//  Created by Indra Aristya on 7/13/18.
//  Copyright © 2018 Indra Aristya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputWeight: UITextField!
    @IBOutlet weak var inputHeight: UITextField!
    
    @IBOutlet weak var bmiResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculatePressed(_ sender: UIButton) {
        if (checkFill() == true) {
            bmiResult.text = String(calcBMI()) + "\n" + bmiCondition(bmi: calcBMI())
        } else {
            bmiResult.text = "Fill your weight and height"
        }
        
    }
    
    func calcBMI() -> Float {
        let _weight : Float = Float(inputWeight.text!)!
        let _height : Float = Float(inputHeight.text!)! / 100
        
        let bmiRes : Float = (_weight / (_height*_height))
        return bmiRes
    }
    
    func bmiCondition(bmi: Float) -> String {
        var cond : String = ""
        if (bmi > 25) {
            cond = "You are OVERWEIGHT! \n Lose some weight"
        } else if (bmi < 18.5) {
            cond = "You are UNDERWEIGHT! \n Gain some weight"
        } else {
            cond = "You are NORMAL! \n Keep maintain your weight"
        }
        return cond
    }
    
    func checkFill() -> Bool {
        var valid : Bool = false
        if (inputHeight.text! == "") || (inputWeight.text! == "") {
            valid = false
        } else if (inputHeight.text! == " ") || (inputWeight.text! == " ") {
            valid = false
        } else {
            valid = true
        }
        return valid
        
    }
}

