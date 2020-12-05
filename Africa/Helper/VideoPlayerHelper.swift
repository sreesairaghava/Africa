//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 01/12/20.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName:String ,fileFormat:String) ->AVPlayer{
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil{
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
