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
    
    var medicationController: MedicationController?
    var medication: Medication?
    
    func updateViews() {
        guard let medication = medication else { return }
        medicineNameLabel.text = medication.medicationName
        pillDosageLabel.text = medication.dosage
        nextDoseLabel.text = String(medication.numberOfTimesPerDay)
        quantityLabel.text = String(medication.numberOfPills) 
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func doneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil) 
    }
}
