//
//  MedicineDetailViewController.swift
//  TrackYourMeds
//
//  Created by Akmal Nurmatov on 4/28/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

class MedicineDetailViewController: UIViewController {

    
    @IBOutlet weak var medicineNameLabel: UILabel!
    @IBOutlet weak var pillDosageLabel: UILabel!
    @IBOutlet weak var nextDoseLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButton(_ sender: Any) {
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
