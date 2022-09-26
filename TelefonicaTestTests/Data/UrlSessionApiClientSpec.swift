//
//  UrlSessionApiClient.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 26/9/22.
//

import Combine
import Factory
import Foundation
import Nimble
import OHHTTPStubs
import OHHTTPStubsSwift
import Quick

// swiftlint:disable function_body_length

class UrlSessionApiClientSpec: QuickSpec {
    override func spec() {
        var cancellables = Set<AnyCancellable>()
        var channelListDto: ChannelListDto?
        var liveProgramDto: LiveProgramDto?
        var error: TelefonicaError?

        beforeEach {
            channelListDto = nil
            liveProgramDto = nil
            error = nil
            self.setupStubs()
        }

        afterEach {
            // OHHTTPStubs.removeAllStubs()
        }

        describe("GIVEN a UrlSessionApiClient") {
            context("WHEN request a channel list") {
                it("THEN publishs a channel list dto") {
                    let apiClient = UrlSessionApiClient()
                    let path = "f5552c061b8cf68cffa0"

                    apiClient.get(path: path)
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { channelListDto = $0 }
                        )
                        .store(in: &cancellables)

                    expect(channelListDto).toEventually(equal(ObjectMother.channelListDto))
                }
            }

            context("WHEN request a live program") {
                it("THEN publishs a live program dto") {
                    let apiClient = UrlSessionApiClient()
                    let path = "f3c6446abeb1c5a82079"

                    apiClient.get(path: path)
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { liveProgramDto = $0 }
                        )
                        .store(in: &cancellables)

                    expect(liveProgramDto).toEventually(equal(ObjectMother.liveProgramDto))
                }
            }

            context("WHEN request and receive an error") {
                it("THEN publishs a TelefonicaError.networkError") {
                    stub(condition: isHost("api.npoint.io")) { _ in
                        let notConnectedError = NSError(
                            domain: NSURLErrorDomain,
                            code: URLError.notConnectedToInternet.rawValue
                        )
                        return HTTPStubsResponse(error: notConnectedError)
                    }

                    let apiClient = UrlSessionApiClient()
                    let path = "f3c6446abeb1c5a82079"

                    apiClient.get(path: path)
                        .catch { errorCatched -> AnyPublisher<LiveProgramDto, TelefonicaError> in
                            error = errorCatched
                            return Fail(error: errorCatched).eraseToAnyPublisher()
                        }
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { liveProgramDto = $0 }
                        )
                        .store(in: &cancellables)

                    expect(liveProgramDto).toEventually(beNil())
                    expect(error).toEventually(equal(.networkError))
                }
            }
        }
    }

    func setupStubs() {
        stub(condition: isHost("api.npoint.io")
            && isPath("/f5552c061b8cf68cffa0")
            && isMethodGET()
        ) { _ in
            let stubPath = OHPathForFile("channel_list.json", type(of: self))

            return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }

        stub(condition: isHost("api.npoint.io")
            && isPath("/f3c6446abeb1c5a82079")
            && isMethodGET()
        ) { _ in
            let stubPath = OHPathForFile("live_program.json", type(of: self))

            return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }
    }
}

// swiftlint:enable function_body_length
