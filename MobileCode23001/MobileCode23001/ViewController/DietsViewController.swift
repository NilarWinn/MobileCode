//
//  DietsViewController.swift
//  MobileCode23001
//
//  Created by Nilar Win on 12/11/2024.
//

import Foundation
import UIKit

class DietsViewController : UIViewController {
    
    @IBOutlet weak var vegetarianImage: UIImageView!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var ketogenicImage: UIImageView!
    @IBOutlet weak var strictImage: UIImageView!
    @IBOutlet weak var pescaterianImage: UIImageView!
    @IBOutlet weak var veganImage: UIImageView!
    @IBOutlet weak var noneImage: UIImageView!
    
    @IBOutlet weak var nextBtn: UIButton!
    var imageList = [UIImageView]()
    var imageName = ["None", "Vegan", "Vegetarian", "Pescaterian", "Strict Paleo", "Ketogenic", "Plant based"]
    var userHealthData : UserHealthData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.layer.cornerRadius = 7
        
        imageClickAction(imageView: noneImage, tapIndex: 0)
        imageClickAction(imageView: veganImage, tapIndex: 1)
        imageClickAction(imageView: vegetarianImage, tapIndex: 2)
        imageClickAction(imageView: pescaterianImage, tapIndex: 3)
        imageClickAction(imageView: strictImage, tapIndex: 4)
        imageClickAction(imageView: ketogenicImage, tapIndex: 5)
        imageClickAction(imageView: plantImage, tapIndex: 6)
        imageList = [noneImage, veganImage, pescaterianImage, strictImage, ketogenicImage, plantImage]
        
        if let data = userHealthData {
            print("Health Concerns: \(data.healthConcerns)")
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SpecificViewController") as! SpecificViewController
        vc.modalPresentationStyle = .fullScreen
        var diets = [String]()
        for (index, image) in imageList.enumerated() {
            if image.image == UIImage(systemName: "checkmark.square.fill"), index != 0 {
                diets.append(imageName[index])
            }else{
                image.image = UIImage(systemName: "checkmark.square.fill")
            }
        }
        userHealthData?.diets = diets
        vc.userHealthData = userHealthData
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func imageClickAction(imageView: UIImageView, tapIndex: Int) {
        imageView.isUserInteractionEnabled = true
        imageView.tag = tapIndex
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        print("Image tapped!")
        if let tappedImageView = sender.view as? UIImageView {
            let index = tappedImageView.tag
            print("Image at index \(index) tapped")
            
            switch index {
            case 0:
                changeImageView(image: noneImage)
            case 1:
                changeImageView(image: veganImage)
            case 2:
                changeImageView(image: pescaterianImage)
            case 3:
                changeImageView(image: strictImage)
            case 4:
                changeImageView(image: ketogenicImage)
            case 5:
                changeImageView(image: plantImage)
            default:
                changeImageView(image: ketogenicImage)
            }
        }
    }
    
    func changeImageView(image: UIImageView){
        if image.image == UIImage(systemName: "checkmark.square.fill") {
            image.image = UIImage(systemName: "checkmark.square")
        }else{
            image.image = UIImage(systemName: "checkmark.square.fill")
        }
    }
    
}
