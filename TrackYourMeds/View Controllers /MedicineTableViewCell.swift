//
//  MedicineTableViewCell.swift
//  TrackYourMeds
//
//  Created by Akmal Nurmatov on 4/28/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

protocol MedicineTableViewCellDelegate {
    func presentAlert(medication: Medication)
}

class MedicineTableViewCell: UITableViewCell {

    @IBOutlet weak var medicineNameLabel: UILabel!
    @IBOutlet weak var medicationDoseLabel: UILabel!
    
    var medication: Medication? {
        didSet{
            updateViews()
        }
    }
    
    var delegate: MedicineTableViewCellDelegate?

    @IBAction func takeMedicineButton(_ sender: Any) {
        guard let medication = medication else { return }
        delegate?.presentAlert(medication: medication)
        
    }
    
    
    
    func updateViews() {
        guard let medication = medication else { return }
        
        medicineNameLabel.text = medication.medicationName
        medicationDoseLabel.text = medication.dosage
    }
    
}
