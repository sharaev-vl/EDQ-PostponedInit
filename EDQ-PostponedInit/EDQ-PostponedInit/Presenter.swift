class Presenter {
    private let onCreateAudioEngine: () -> Result<AudioEngine, Error>
    private var audioEngine: AudioEngine?
    
    init(onCreateAudioEngine: @escaping () -> Result<AudioEngine, Error>) {
        self.onCreateAudioEngine = onCreateAudioEngine
    }
    
    func allowMicPermissionButtonTapped() {
        let result = onCreateAudioEngine()
        
        switch result {
        case .success(let audioEngine):
            self.audioEngine = audioEngine
            
        case .failure(let error):
            print(error)
            self.audioEngine = nil
        }
    }
    
    func startButtonTapped() {
        audioEngine?.start()
    }
    
    func stopButtonTapped() {
        audioEngine?.stop()
    }
}
