//
//  LiveProgramDataSource.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine

protocol LiveProgramDataSource {
    func getLiveProgram(id: Int) -> AnyPublisher<LiveProgramDto, TelefonicaError>
}
