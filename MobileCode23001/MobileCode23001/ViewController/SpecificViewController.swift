//
//  SpecificViewController.swift
//  MobileCode23001
//
//  Created by Nilar Win on 12/11/2024.
//

import Foundation
import UIKit

class SpecificViewController : UIViewController {
    
    @IBOutlet weak var nextBtn: UIButton!
    var userHealthData : UserHealthData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 7
        if let data = userHealthData {
            print("Health Concerns: \(data.healthConcerns)")
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        vc.modalPresentationStyle = .fullScreen
        vc.userHealthData = userHealthData
        self.present(vc, animated: true, completion: nil)
    }
}
