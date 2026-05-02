import AVFoundation
import Foundation

final class SidetonePlayer {
  private let engine = AVAudioEngine()
  private let format: AVAudioFormat
  private lazy var sourceNode: AVAudioSourceNode = { [unowned self] in
    let sampleRate = format.sampleRate
    return AVAudioSourceNode { [weak self] _, _, frameCount, audioBufferList -> OSStatus in
      guard let self else { return noErr }
      let ablPointer = UnsafeMutableAudioBufferListPointer(audioBufferList)
      let theta = 2 * Float.pi * frequency / Float(sampleRate)
      for frame in 0 ..< Int(frameCount) {
        let sample = isToneOn ? sinf(phase) * volume : 0
        phase += theta
        if phase >= 2 * Float.pi { phase -= 2 * Float.pi }
        for buffer in ablPointer {
          let channel = buffer.mData?.assumingMemoryBound(to: Float.self)
          channel?[frame] = sample
        }
      }
      return noErr
    }
  }()

  private var phase: Float = 0
  private var isToneOn = false

  var frequency: Float = 600
  var volume: Float = 0.25

  init() {
    // Derive format from engine's output sample rate to avoid mismatches
    let outputFormat = engine.outputNode.outputFormat(forBus: 0)
    format = AVAudioFormat(standardFormatWithSampleRate: outputFormat.sampleRate, channels: 1)!

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
