//
//  UiModelMapper.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation

struct UiModelMapper {
    func mapChannelToChannelUiModel(channel: Channel, currentTime: Date) -> ChannelUiModel {
        let progress = calculateProgress(
            start: channel.liveProgram.start,
            end: channel.liveProgram.end,
            currentTime: currentTime
        )
        return ChannelUiModel(
            id: channel.id,
            name: channel.name,
            logo: channel.logo,
            liveProgramName: channel.liveProgram.program.title,
            liveProgramProgress: progress
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
