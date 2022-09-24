//
//  UiModelMapper.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation

struct UIModelMapper {
    func mapChannelToChannelUiModel(channel: Channel, currentTime: Date) -> ChannelUIModel {
        let progress = calculateProgress(
            start: channel.liveProgram.start,
            end: channel.liveProgram.end,
            currentTime: currentTime
        )
        return ChannelUIModel(
            id: channel.id,
            name: channel.name,
            logo: channel.logo,
            liveProgramId: channel.liveProgram.program.id,
            liveProgramTitle: channel.liveProgram.program.title,
            liveProgramProgress: progress
        )
    }

    func mapLiveProgramToLiveProgramUIModel(liveProgram: LiveProgram, currentTime: Date) -> LiveProgramUIModel {
        let progress = calculateProgress(
            start: liveProgram.start,
            end: liveProgram.end,
            currentTime: currentTime
        )

        return LiveProgramUIModel(
            id: liveProgram.program.id,
            cover: liveProgram.program.cover,
            title: liveProgram.program.title,
            description: liveProgram.program.description ?? "",
            start: liveProgram.start.onlyTime,
            end: liveProgram.end.onlyTime,
            progress: progress
        )
    }

    func calculateProgress(start: Date, end: Date, currentTime: Date) -> Double {
        let duration = end.timeIntervalSince1970 - start.timeIntervalSince1970
        let elapsedTime = end.timeIntervalSince1970 - currentTime.timeIntervalSince1970

        if duration < 0 || elapsedTime < 0 {
            return 0.0
        } else {
            return elapsedTime / duration
        }
    }
}
