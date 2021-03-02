//
//  ViewController.swift
//  BMICalculator
//
//  Created by 林佩柔 on 2021/3/1.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var BMICategoriesLabel: UILabel!
    var bmi: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // hide keyboard
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // Calculating BMI value
    // 於輸入身高體重當下同時計算BMI
    @IBAction func calculatingBMI(_ sender: Any) {
        let height = Double(heightTextField.text!) ?? 0
        let weight = Double(weightTextField.text!) ?? 0
        bmi = weight / ((height / 100) * (height / 100))
        if heightTextField.text == "" || weightTextField.text == "" {
            BMILabel.text = "Calculating..."
        } else {
            BMILabel.text = String(format: "%.2f", bmi)
        }
    }
    
    // 當重新輸入身高或體重時,重置BMI值於"正在計算中(Calculating...)"
    @IBAction func resetBMI(_ sender: Any) {
        BMILabel.text = "Calculating..."
        BMICategoriesLabel.text = ""
    }
    
    // 顯示BMI值的衡量標準
    // 於輸入完整的身高體重後，輕點非編輯區域結束編輯時
    @IBAction func calculateBMICategories(_ sender: Any) {
        if heightTextField.text == "" || weightTextField.text == "" {
            BMICategoriesLabel.text = ""
        } else {
            BMICategoriesLabel.textColor = UIColor(red: 255/255, green: 53/255, blue: 31/255, alpha: 0.8)
            if bmi < 18.5 {
                BMICategoriesLabel.text = "Underweight"
            } else if bmi > 18.5, bmi < 24.9 {
                BMICategoriesLabel.textColor = UIColor.black
                BMICategoriesLabel.text = "Normal weight"
            } else if bmi > 25, bmi < 29.9 {
                BMICategoriesLabel.text = "Overweight"
            } else {
                BMICategoriesLabel.text = "Obesity"
            }
            
        }
        
    }
    
}

