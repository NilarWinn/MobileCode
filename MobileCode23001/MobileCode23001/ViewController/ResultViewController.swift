//
//  ResultViewController.swift
//  MobileCode23001
//
//  Created by Nilar Win on 12/11/2024.
//

import Foundation
import UIKit

class ResultViewController : UIViewController {
    
    @IBOutlet weak var alcoholic5: UIButton!
    @IBOutlet weak var alcoholic2: UIButton!
    @IBOutlet weak var alcoholic0: UIButton!
    @IBOutlet weak var tobaccoNo: UIButton!
    @IBOutlet weak var tobaccoYes: UIButton!
    @IBOutlet weak var dailyExposureNo: UIButton!
    @IBOutlet weak var dailyExposureYes: UIButton!
    
    @IBOutlet weak var resultBtn: UIButton!
    var userHealthData : UserHealthData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultBtn.layer.cornerRadius = 7
        
    }
    @IBAction func dailyExposureBtnYes(_ sender: Any) {
        checkDailyExposure()
    }
    
    
    @IBAction func dailyExposureBtnNo(_ sender: Any) {
        checkDailyExposure()
    }
    
    func checkDailyExposure() {
        if userHealthData?.isDailyExposure == true {
            userHealthData?.isDailyExposure = false
            dailyExposureYes.setImage(UIImage(named: "checkmark.circle"), for: .highlighted)
            dailyExposureNo.setImage(UIImage(named: "checkmark.circle.fill"), for: .highlighted)
        }else{
            userHealthData?.isDailyExposure = true
            dailyExposureYes.setImage(UIImage(named: "checkmark.circle.fill"), for: .highlighted)
            dailyExposureNo.setImage(UIImage(named: "checkmark.circle"), for: .highlighted)
        }
    }
    @IBAction func tobaccoBtnYes(_ sender: Any) {
        checkTobacco()
    }
    
    @IBAction func tobaccoBtnNo(_ sender: Any) {
        checkTobacco()
    }
    
    func checkTobacco() {
        if userHealthData?.isSmoke == true {
            userHealthData?.isSmoke = false
            tobaccoYes.setImage(UIImage(named: "checkmark.circle"), for: .highlighted)
            tobaccoNo.setImage(UIImage(named: "checkmark.circle.fill"), for: .highlighted)
        }else{
            userHealthData?.isSmoke = true
            tobaccoYes.setImage(UIImage(named: "checkmark.circle.fill"), for: .highlighted)
            tobaccoNo.setImage(UIImage(named: "checkmark.circle"), for: .highlighted)
        }
    }
    
    @IBAction func alcoholic0(_ sender: Any) {
    }
    @IBAction func alcoholic2(_ sender: Any) {
    }
    @IBAction func alcoholic5(_ sender: Any) {
    }
    
    
    func checkAlcoholic() {
        if userHealthData?.isSmoke == true {
            userHealthData?.isSmoke = false
            tobaccoYes.setImage(UIImage(named: "checkmark.circle"), for: .highlighted)
            tobaccoNo.setImage(UIImage(named: "checkmark.circle.fill"), for: .highlighted)
        }else{
            userHealthData?.isSmoke = true
            tobaccoYes.setImage(UIImage(named: "checkmark.circle.fill"), for: .highlighted)
            tobaccoNo.setImage(UIImage(named: "checkmark.circle"), for: .highlighted)
        }
    }
    
    @IBAction func result(_ sender: Any) {
        let alert = UIAlertController(title: "Result", message: "Get Your Personalized Vitamin", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        if let data = userHealthData {
            print("Health Concerns: \(data.healthConcerns)")
        }
    }
}
