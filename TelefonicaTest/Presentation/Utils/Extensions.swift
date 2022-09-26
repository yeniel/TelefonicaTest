//
//  Extensions.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation
import Factory

extension Date {
    var onlyTime: String {
        let dateFormatter = Container.dateFormatter()

        dateFormatter.dateFormat = "HH:mm"

        return dateFormatter.string(from: self)
    }
}
