//
//  AudioPlayerViewController.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Tue 15 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayerViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var progressSlider: UISlider!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var elapsedTimeLabel: UILabel!
    @IBOutlet private weak var remainingTimeLabel: UILabel!
    @IBOutlet private weak var playButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var previousButton: UIButton!
    
    // MARK: - Private Properties
    
    private let presenter: AudioPlayerPresenterProtocol
    private let autoPlay: Bool
    private var audioPlayer: AVAudioPlayer? = nil
    private var progressUpdater: CADisplayLink? = nil
    
    // MARK: - init
    
    init(presenter: AudioPlayerPresenterProtocol, autoPlay: Bool = true) {
        self.presenter = presenter
        self.autoPlay = autoPlay
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("use init(presenter: <#T##AudioPlayerPresenterProtocol#>)")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.prepareToPlay()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopPlaying()
    }
    
    // MARK: - Private Methods
    
    private func play(media file: FileContentRepresentable) {
        titleLabel.text = file.name
        do {
            try initPlayer(with: file)
            updateUI()
            startTime()
        } catch let error {
            print(error)
        }
    }
    
    private func initPlayer(with file: FileContentRepresentable) throws {
        let fileURL = URL(fileURLWithPath: file.path)
        audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        audioPlayer?.delegate = self
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
    
    private func updateUI() {
        updateTimeLabels()
        updatePlayPauseButtonState()
        updateNavigationButtons()
        setProgressSliderValues()
    }
    
    private func startTime() {
        progressUpdater?.invalidate()
        progressUpdater = CADisplayLink(target: self, selector: #selector(updateProgress))
        progressUpdater?.add(to: .current, forMode: .common)
    }
    
    private func setProgressSliderValues() {
        progressSlider.minimumValue = 0
        progressSlider.maximumValue = Float(audioPlayer?.duration ?? 0)
    }
    
    private func updateNavigationButtons() {
        nextButton.isEnabled = presenter.hasNext
        previousButton.isEnabled = presenter.hasPrevious
    }
    
    private func updatePlayPauseButtonState() {
        let isPlaying = audioPlayer?.isPlaying ?? false
        let imageName = isPlaying ? "pause.fill" : "play.fill"
        playButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    private func updateTimeLabels() {
        let elapsedTime = Time((audioPlayer?.currentTime ?? 0) / 3600)
        let remainingTime = Time(((audioPlayer?.duration ?? 0) - (audioPlayer?.currentTime ?? 0)) / 3600)
        
        elapsedTimeLabel.text = "\(elapsedTime)"
        remainingTimeLabel.text = "-\(remainingTime)"
    }
    
    private func stopPlaying() {
        progressUpdater?.invalidate()
        progressUpdater = nil
        audioPlayer = nil
        updateUI()
    }
    
    // MARK: - Actions
    
    @objc private func updateProgress()  {
        progressSlider.value = Float(audioPlayer?.currentTime ?? 0)
        updateTimeLabels()
    }
    
    @IBAction private func playPauseButtonDidTapped(_ sender: UIButton) {
        guard let isPlaying = audioPlayer?.isPlaying else {
            presenter.prepareToPlay()
            return
        }
        if isPlaying {
            audioPlayer?.pause()
        } else {
            audioPlayer?.play()
        }
        updatePlayPauseButtonState()
    }
    
    @IBAction private func nextButtonDidTapped(_ sender: UIButton) {
        presenter.getNext()
    }
    
    @IBAction private func previousButtonDidTapped(_ sender: UIButton) {
        presenter.getPrevious()
    }
    
    @IBAction private func progressSliderValueDidChanged(_ sender: UISlider) {
        audioPlayer?.play(atTime: TimeInterval(sender.value))
    }
}

// MARK: - AudioPlayerViewProtocol

extension AudioPlayerViewController: AudioPlayerViewProtocol {
    
    func audioPlayerView(didRecive mediaFile: FileContentRepresentable) {
        play(media: mediaFile)
    }
}

// MARK: - AudioPlayerViewController

extension AudioPlayerViewController: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stopPlaying()
        if autoPlay {
            presenter.getNext()
        }
    }
}
