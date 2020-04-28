//
//  MedicineTableViewCell.swift
//  TrackYourMeds
//
//  Created by Akmal Nurmatov on 4/28/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

protocol MedicineTableViewCellDelegate {
    func toggleHasTaken(for cell: MedicineTableViewCell)
}

class MedicineTableViewCell: UITableViewCell {

    @IBOutlet weak var medicineNameLabel: UILabel!
    @IBOutlet weak var numberOfTimesPerDayLabel: UILabel!
    
    var medication: Medication? {
        didSet{
            updateViews()
        }
    }
    
    var delegate: MedicineTableViewCellDelegate?

    @IBAction func takenUntakenButton(_ sender: Any) {
        medication!.taken = !medication!.taken
        delegate?.toggleHasTaken(for: self) 
    }
    
    func updateViews() {
        guard let medication = medication else { return }
        
        medicineNameLabel.text = medication.medicationName
    }
    
}
