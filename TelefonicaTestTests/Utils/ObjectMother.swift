//
//  ObjectMother.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation

// swiftlint:disable line_length
// swiftlint:disable trailing_comma

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
                    start: Date(timeIntervalSince1970: TimeInterval(1659335400)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659342600))
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
                    start: Date(timeIntervalSince1970: TimeInterval(1659338100)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659344400))
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
                    start: Date(timeIntervalSince1970: TimeInterval(1659338100)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659350700))
                )
            ),
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
                    start: Date(timeIntervalSince1970: TimeInterval(1659338100)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659344400))
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
                    start: Date(timeIntervalSince1970: TimeInterval(1659335400)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659342600))
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
                    start: Date(timeIntervalSince1970: TimeInterval(1659338100)),
                    end: Date(timeIntervalSince1970: TimeInterval(1659350700))
                )
            ),
        ]
    }

    static var channelUIModelList: [ChannelUIModel] {
        [
            ChannelUIModel(
                id: 1,
                name: "TVE",
                logo: URL(string: "http://www.movistarplus.es/recorte/m-DP/mux/TVE.png"),
                liveProgramId: 12304,
                liveProgramTitle: "Mundial FÃºtbol Femenino: EspaÃ±a - Italia",
                liveProgramProgress: 0.91
            ),
            ChannelUIModel(
                id: 3,
                name: "Antena 3",
                logo: URL(string: "http://www.movistarplus.es/recorte/m-DP/mux/A3.png"),
                liveProgramId: 24677,
                liveProgramTitle: "Espejo PÃºblico",
                liveProgramProgress: 0.54625
            ),
            ChannelUIModel(
                id: 6,
                name: "La Sexta",
                logo: URL(string: "http://www.movistarplus.es/recorte/m-DP/mux/SEXTA.png"),
                liveProgramId: 12332,
                liveProgramTitle: "Al Rojo Vivo",
                liveProgramProgress: 0.955
            ),
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
            start: Date(timeIntervalSince1970: TimeInterval(1659335400)),
            end: Date(timeIntervalSince1970: TimeInterval(1659342600))
        )
    }

    static var liveProgramUIModel: LiveProgramUIModel {
        LiveProgramUIModel(
            id: 24677,
            cover: URL(string: "https://imagenes.atresplayer.com/atp/clipping/cmsimages02/2021/09/02/B5277B5E-077F-41BA-8D73-399D2ECF12AC//1280x720.jpg"),
            title: "Espejo Pulico",
            description: "Espejo Publico es el magacn informativo matinal de Antena3 producido por Antena3 Noticias y presentado por Susanna Griso",
            start: "06:30",
            end: "08:30",
            progress: 0.54625
        )
    }

    static var currentTime: Date {
        Date(timeIntervalSince1970: TimeInterval(1659338667990 / 1000))
    }

    static var currentTimeDto: CurrentTimeDto {
        CurrentTimeDto(currentTime: 1659338667990)
    }

    static var liveProgramDto: LiveProgramDto {
        LiveProgramDto(
            id: 24677,
            title: "Espejo Pulico",
            cover: "https://imagenes.atresplayer.com/atp/clipping/cmsimages02/2021/09/02/B5277B5E-077F-41BA-8D73-399D2ECF12AC//1280x720.jpg",
            category: "live",
            description: "Espejo Publico es el magacn informativo matinal de Antena3 producido por Antena3 Noticias y presentado por Susanna Griso",
            start: "1659335400000",
            end: "1659342600000"
        )
    }

    static var channelListDto: ChannelListDto {
        ChannelListDto(
            channels: [
                ChannelDto(
                    id: 3,
                    logo: "http://www.movistarplus.es/recorte/m-DP/mux/A3.png",
                    name: "Antena 3",
                    channelLiveProgram: ChannelLiveProgramDto(
                        id: 24677,
                        title: "Espejo PÃºblico",
                        start: "1659335400000",
                        end: "1659342600000"
                    )
                ),
                ChannelDto(
                    id: 1,
                    logo: "http://www.movistarplus.es/recorte/m-DP/mux/TVE.png",
                    name: "TVE",
                    channelLiveProgram: ChannelLiveProgramDto(
                        id: 12304,
                        title: "Mundial FÃºtbol Femenino: EspaÃ±a - Italia",
                        start: "1659338100000",
                        end: "1659344400000"
                    )
                ),
                ChannelDto(
                    id: 6,
                    logo: "http://www.movistarplus.es/recorte/m-DP/mux/SEXTA.png",
                    name: "La Sexta",
                    channelLiveProgram: ChannelLiveProgramDto(
                        id: 12332,
                        title: "Al Rojo Vivo",
                        start: "1659338100000",
                        end: "1659350700000"
                    )
                ),
            ]
        )
    }
}

// swiftlint:enable line_length
// swiftlint:enable trailing_comma
