//
//  AddNewMedicineViewController.swift
//  TrackYourMeds
//
//  Created by Akmal Nurmatov on 4/28/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

protocol NewMedicationDelegate {
    func medicationWasAdded(medication: Medication)
}

class AddNewMedicineViewController: UIViewController {

    @IBOutlet weak var medicineNameTextField: UITextField!
    @IBOutlet weak var medicineDoseTextField: UITextField!
    @IBOutlet weak var numberOfTimesTextField: UITextField!
    @IBOutlet weak var numberOfPillsTextField: UITextField!
    
    
    var medicationController: MedicationController?
    var medication: Medication?
    var delegate: NewMedicationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func saveButton(_ sender: Any) {
        guard let medicineNameTextField = medicineNameTextField.text, let medicineDoseTextField = medicineDoseTextField.text, let numberOfTimesTextField = numberOfTimesTextField.text, let numberOfPillsTextField = numberOfPillsTextField.text else { return }
          
        let medication = Medication(medicationName: medicineNameTextField, numberOfPills: Int(numberOfPillsTextField)!, dosage: medicineDoseTextField, numberOfTimesPerDay: Int(numberOfTimesTextField)!, taken: false)
        
        delegate?.medicationWasAdded(medication: medication)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    
}
