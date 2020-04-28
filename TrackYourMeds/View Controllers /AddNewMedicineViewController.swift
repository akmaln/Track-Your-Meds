//
//  AddNewMedicineViewController.swift
//  TrackYourMeds
//
//  Created by Akmal Nurmatov on 4/28/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

class AddNewMedicineViewController: UIViewController {

    @IBOutlet weak var medicineNameTextField: UITextField!
    @IBOutlet weak var medicineDoseTextField: UITextField!
    @IBOutlet weak var numberOfTimesTextField: UITextField!
    @IBOutlet weak var numberOfPillsTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButton(_ sender: Any) {
    }
    @IBAction func cancelButton(_ sender: Any) {
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
