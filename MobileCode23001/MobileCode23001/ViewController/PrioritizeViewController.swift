//
//  PrioritizeViewController.swift
//  MobileCode23001
//
//  Created by Nilar Win on 12/11/2024.
//

import Foundation
import UIKit
import Alamofire

class PrioritizeViewController : UIViewController {
    
    @IBOutlet weak var TagView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    
    private let tagCollectionView = TagCollectionView()
    var data = [String]()
    
    var vitaminList: [VitaminCategory] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTB()
        setupTagView()
        nextBtn.layer.cornerRadius = 7
    }
    
    func setupTB() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PrioritizeCell", bundle: nil), forCellReuseIdentifier: "PrioritizeCell")
    }
    
    func setupTagView() {
        TagView.addSubview(tagCollectionView)
        TagView.backgroundColor = .clear
        tagCollectionView.translatesAutoresizingMaskIntoConstraints = false
        tagCollectionView.backgroundColor = .clear
        tagCollectionView.allowsMultipleSelection = true
        tagCollectionView.tagDelegate = self
        
        NSLayoutConstraint.activate([
            tagCollectionView.leadingAnchor.constraint(equalTo: TagView.leadingAnchor, constant: 0),
            tagCollectionView.trailingAnchor.constraint(equalTo: TagView.trailingAnchor, constant: 0),
            tagCollectionView.topAnchor.constraint(equalTo: TagView.safeAreaLayoutGuide.topAnchor, constant: 0),
            tagCollectionView.bottomAnchor.constraint(equalTo: TagView.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        fetchVitaminCategories()
    }
    
    func fetchVitaminCategories() {
        if let filePath = Bundle.main.url(forResource: "VitaminCategories", withExtension: "json") {
            // Alamofire request using the local file URL
            AF.request(filePath).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let responseData = try decoder.decode(ResponseData.self, from: data)
                        self.vitaminList = responseData.data
                        var vitaminNameList = [String]()
                        for category in self.vitaminList {
                            vitaminNameList.append(category.name)
                        }
                        self.tagCollectionView.tags = vitaminNameList
                        self.tagCollectionView.reloadData()
                    } catch {
                        print("Decoding error: \(error)")
                    }
                case .failure(let error):
                    print("Failed to fetch file: \(error)")
                }
            }
        } else {
            print("File not found.")
        }
    }

    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DietsViewController") as! DietsViewController
        vc.modalPresentationStyle = .fullScreen
        var healthConcerns =  [HealthConcern]()
        for (index, category) in self.data.enumerated() {
            healthConcerns.append(HealthConcern(id: index + 1, name: category, priority: 1))
        }
        vc.userHealthData?.healthConcerns = healthConcerns
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension PrioritizeViewController : UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrioritizeCell", for: indexPath) as! PrioritizeCell
        if data.count > indexPath.row {
            cell.selectedData.text = data[indexPath.row] as! String
        }
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods (Optional)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected item: \(data[indexPath.row])")
        
        // Deselect the row after selection
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}


extension PrioritizeViewController : TagCollectionViewDelegate {
    func didSelectItem(at indexPath: IndexPath) {
        data.append(vitaminList[indexPath.row].name)
        tableView.reloadData()
    }
    
    func didDeselectItem(at indexPath: IndexPath) {
        var stringArray = data
        let valueToRemove = vitaminList[indexPath.row].name
        stringArray = stringArray.filter { $0 != valueToRemove }
        data = stringArray
        tableView.reloadData()
    }
    
}
