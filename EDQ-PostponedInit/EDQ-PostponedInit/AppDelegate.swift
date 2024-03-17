import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    lazy var viewController: ViewController = {
        let storyboardName = String(describing: ViewController.self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let presenter = Presenter(onCreateAudioEngine: createAudioEngine)
        
        return storyboard.instantiateInitialViewController { coder in
            ViewController(coder: coder, presenter: presenter)
        }!
    }()
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        configureWindow()
        
        return true
    }
    
    func configureWindow() {
        self.window = UIWindow()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    func createAudioEngine() -> Result<AudioEngine, Error> {
        do {
            let audioEngine = try CustomAudioEngine()
            return .success(audioEngine)
        } catch {
            return .failure(error)
        }
    }
}
