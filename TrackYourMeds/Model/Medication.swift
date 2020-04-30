//
//  File.swift
//  TrackYourMeds
//
//  Created by Akmal Nurmatov on 4/28/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import Foundation

struct Medication: Codable, Equatable {
    var medicationName: String
    var numberOfPills: Int
    var dosage: String
    var numberOfTimesPerDay: Int 
    var taken: Bool 
}
