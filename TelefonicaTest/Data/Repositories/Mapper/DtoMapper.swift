//
//  DtoMapper.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct DtoMapper {
    func channelListDtoToChannelList(dto: ChannelListDto) -> [Channel] {
        dto.channels.map { channelDtoToChannel(dto: $0) }
    }

    func channelDtoToChannel(dto: ChannelDto) -> Channel {
        Channel(
            id: dto.id,
            logo: URL(string: dto.logo),
            name: dto.name,
            liveProgram: channelLiveProgramDtoToLiveProgram(dto: dto.channelLiveProgram)
        )
    }

    func channelLiveProgramDtoToLiveProgram(dto: ChannelLiveProgramDto) -> LiveProgram {
        LiveProgram(
            program: Program(
                id: dto.id,
                title: dto.title,
                category: .live
            ),
            start: Date(timeIntervalSince1970: TimeInterval((Int64(dto.start) ?? 0) / 1000)),
            end: Date(timeIntervalSince1970: TimeInterval((Int64(dto.end) ?? 0) / 1000))
        )
    }

    func liveProgramDtoToLiveProgram(dto: LiveProgramDto) -> LiveProgram {
        LiveProgram(
            program: Program(
                id: dto.id,
                title: dto.title,
                cover: URL(string: dto.cover),
                category: .live,
                description: dto.description
            ),
            start: Date(timeIntervalSince1970: TimeInterval((Int64(dto.start) ?? 0) / 1000)),
            end: Date(timeIntervalSince1970: TimeInterval((Int64(dto.end) ?? 0) / 1000))
        )
    }
}
