//
//  MyMedicineTableViewController.swift
//  TrackYourMeds
//
//  Created by Akmal Nurmatov on 4/28/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

class MyMedicineTableViewController: UITableViewController {
    
    let medicationController = MedicationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self 
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medicationController.medications.count 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicineCell", for: indexPath) as! MedicineTableViewCell

        let medication = medicationController.medications[indexPath.row]
        
        cell.medication = medication
        cell.delegate = self
        medicationController.saveToPersistentStore()

        return cell
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMedicineModally" {
            guard let addMedicineVC = segue.destination as? AddNewMedicineViewController else { return }
            addMedicineVC.medicationController = medicationController
            addMedicineVC.delegate = self 
        } else {
            guard let medsDetailVC = segue.destination as? MedicineDetailViewController else { return }
            medsDetailVC.medicationController = medicationController
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            medicationController.medications.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
    
}

extension MyMedicineTableViewController: NewMedicationDelegate {
    func medicationWasAdded(medication: Medication) {
        medicationController.medications.append(medication)
        tableView.reloadData()
    }
    
}

extension MyMedicineTableViewController: MedicineTableViewCellDelegate {
    func presentAlert(medication: Medication) {
            let alert = UIAlertController(title: "Confirm", message: "You should take \(medication.dosage)mg of \(medication.medicationName)!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        }
    }
    


