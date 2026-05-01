import AVFoundation
import Foundation

final class SidetonePlayer {
  private let engine = AVAudioEngine()
  private let sourceNode: AVAudioSourceNode
  private let format: AVAudioFormat

  private var phase: Float = 0
  private var isToneOn = false

  var frequency: Float = 600
  var volume: Float = 0.25

  init() {
    let sampleRate = 44_100.0
    format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)!

    sourceNode = AVAudioSourceNode { [weak self] _, _, frameCount, audioBufferList -> OSStatus in
      guard let self else { return noErr }

      let ablPointer = UnsafeMutableAudioBufferListPointer(audioBufferList)
      let theta = 2 * Float.pi * self.frequency / Float(sampleRate)

      for frame in 0 ..< Int(frameCount) {
        let sample = self.isToneOn ? sinf(self.phase) * self.volume : 0
        self.phase += theta
        if self.phase >= 2 * Float.pi { self.phase -= 2 * Float.pi }

        for buffer in ablPointer {
          let channel = buffer.mData?.assumingMemoryBound(to: Float.self)
          channel?[frame] = sample
        }
      }

      return noErr
    }

    engine.attach(sourceNode)
    engine.connect(sourceNode, to: engine.mainMixerNode, format: format)

    let session = AVAudioSession.sharedInstance()
    try? session.setCategory(.playback, mode: .default, options: [.mixWithOthers])
    try? session.setActive(true)

    try? engine.start()
  }

  func toneOn() {
    isToneOn = true
  }

  func toneOff() {
    isToneOn = false
  }
}
