//
//  MedicationController.swift
//  TrackYourMeds
//
//  Created by Akmal Nurmatov on 4/28/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import Foundation


class MedicationController {
    var medications: [Medication] = []
    
    init() {
        loadFromPersistentStore() 
    }
    
    func addMedication(medicationName: String, dosage: String, numberOfPills: Int, taken: Bool) {
        let medication = Medication(medicationName: medicationName, numberOfPills: numberOfPills, dosage: dosage, taken: taken)
        medications.append(medication)
        
    }
    
    func deleteMedication(medication: Medication) {
        guard let index = medications.firstIndex(of: medication) else { return }
        medications.remove(at: index) 
    }
    
    var takenMeds: [Medication] {
        return medications.filter({ $0.taken == true })
    }
    
    var untakenMeds: [Medication] {
        return medications.filter({ $0.taken == false })
    }
    
    var medicationListURL: URL? {
        let fileManager = FileManager.default
        
        let documentDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let medicationsURL = documentDir?.appendingPathComponent("Medications.plist")
        
        return medicationsURL
    }
    
    func saveToPersistentStore() {
        do {
            let encoder = PropertyListEncoder()
            
            let medicationData = try encoder.encode(medications)
            
            guard let medicationListURL = medicationListURL else { return }
            
            try medicationData.write(to: medicationListURL)
            
        } catch {
            print("Error saving medication: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let medicationListURL = medicationListURL else { return }
            
            let decoder = PropertyListDecoder()
            
            let medicationPlist = try Data(contentsOf: medicationListURL)
            
            let medications = try decoder.decode([Medication].self, from: medicationPlist)
            
            self.medications = medications
        } catch {
            print("Error decoding our books: \(error)")
        }
    }
    
}
