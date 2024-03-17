protocol AudioEngine {
    func start()
    func stop()
}

final class CustomAudioEngine: AudioEngine {
    private enum InitializationError: Error {
        case microphoneCanNotBeUsed
    }
    
    private let anyPropertyOne: Any
    private let anyPropertyTwo: Any
    
    init() throws {
        let isMicrophoneCanBeUsed = Bool.random()
        guard isMicrophoneCanBeUsed else {
            throw InitializationError.microphoneCanNotBeUsed
        }
        
        anyPropertyOne = 0
        anyPropertyTwo = true
        print("CustomAudioEngine is initialized successfully")
    }
    
    func start() {
        print("Start the engine using \(anyPropertyOne)")
    }
    
    func stop() {
        print("Stop the engine using \(anyPropertyTwo)")
    }
}
