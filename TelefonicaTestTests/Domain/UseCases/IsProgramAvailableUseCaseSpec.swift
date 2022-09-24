//
//  IsProgramAvailableUseCaseSpec.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 25/9/22.
//

import Combine
import Factory
import Foundation
import Nimble
import Quick

class IsProgramAvailableUseCaseSpec: QuickSpec {
    override func spec() {
        var useCase: IsProgramAvailableUseCase!

        describe("GIVEN a IsProgramAvailableUseCase") {
            context("WHEN execute with id 24677") {
                it("THEN publishs is available") {
                    useCase = Container.isProgramAvailableUseCase()

                    let isProgramAvailable = useCase.execute(programId: 24677)

                    expect(isProgramAvailable).toEventually(beTrue())
                }
            }

            context("WHEN execute with id different than 24677") {
                it("THEN publishs is not available") {
                    useCase = Container.isProgramAvailableUseCase()

                    let isProgramAvailable = useCase.execute(programId: 12304)

                    expect(isProgramAvailable).toEventually(beFalse())
                }
            }
        }
    }
}
