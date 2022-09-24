//
//  ObjectMother.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation

// swiftlint:disable line_length

struct ObjectMother {
    static var channelList: [Channel] {
        [
            Channel(
                id: 3,
                logo: URL(string: "http://www.movistarplus.es/recorte/m-DP/mux/A3.png"),
                name: "Antena 3",
                liveProgram: LiveProgram(
                    program: Program(
                        id: 24677,
                        title: "Espejo PÃºblico",
                        category: .live
                    ),
                    start: Date(timeIntervalSince1970: TimeInterval(1659342600)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659335400))
                )
            ),
            Channel(
                id: 1,
                logo: URL(string: "http://www.movistarplus.es/recorte/m-DP/mux/TVE.png"),
                name: "TVE",
                liveProgram: LiveProgram(
                    program: Program(
                        id: 12304,
                        title: "Mundial FÃºtbol Femenino: EspaÃ±a - Italia",
                        category: .live
                    ),
                    start: Date(timeIntervalSince1970: TimeInterval(1659344400)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659338100))
                )
            ),
            Channel(
                id: 6,
                logo: URL(string: "http://www.movistarplus.es/recorte/m-DP/mux/SEXTA.png"),
                name: "La Sexta",
                liveProgram: LiveProgram(
                    program: Program(
                        id: 12332,
                        title: "Al Rojo Vivo",
                        category: .live
                    ),
                    start: Date(timeIntervalSince1970: TimeInterval(1659350700)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659338100))
                )
            )
        ]
    }

    static var channelListSortedById: [Channel] {
        [
            Channel(
                id: 1,
                logo: URL(string: "http://www.movistarplus.es/recorte/m-DP/mux/TVE.png"),
                name: "TVE",
                liveProgram: LiveProgram(
                    program: Program(
                        id: 12304,
                        title: "Mundial FÃºtbol Femenino: EspaÃ±a - Italia",
                        category: .live
                    ),
                    start: Date(timeIntervalSince1970: TimeInterval(1659344400)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659338100))
                )
            ),
            Channel(
                id: 3,
                logo: URL(string: "http://www.movistarplus.es/recorte/m-DP/mux/A3.png"),
                name: "Antena 3",
                liveProgram: LiveProgram(
                    program: Program(
                        id: 24677,
                        title: "Espejo PÃºblico",
                        category: .live
                    ),
                    start: Date(timeIntervalSince1970: TimeInterval(1659342600)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659335400))
                )
            ),
            Channel(
                id: 6,
                logo: URL(string: "http://www.movistarplus.es/recorte/m-DP/mux/SEXTA.png"),
                name: "La Sexta",
                liveProgram: LiveProgram(
                    program: Program(
                        id: 12332,
                        title: "Al Rojo Vivo",
                        category: .live
                    ),
                    start: Date(timeIntervalSince1970: TimeInterval(1659350700)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659338100))
                )
            )
        ]
    }

    static var liveProgram: LiveProgram {
        LiveProgram(
            program: Program(
                id: 24677,
                title: "Espejo Pulico",
                cover: URL(string: "https://imagenes.atresplayer.com/atp/clipping/cmsimages02/2021/09/02/B5277B5E-077F-41BA-8D73-399D2ECF12AC//1280x720.jpg"),
                category: .live,
                description: "Espejo Publico es el magacn informativo matinal de Antena3 producido por Antena3 Noticias y presentado por Susanna Griso"
            ),
            start: Date(timeIntervalSince1970: TimeInterval(1659342600)),
            end: Date(timeIntervalSince1970: TimeInterval(1659335400))
        )
    }

    static var currentTime: Date {
        Date(timeIntervalSince1970: TimeInterval(1659338667))
    }
}

// swiftlint:enable line_length
