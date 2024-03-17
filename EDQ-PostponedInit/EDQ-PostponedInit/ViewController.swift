import UIKit

class ViewController: UIViewController {
    let presenter: Presenter
    
    init?(coder: NSCoder, presenter: Presenter) {
        self.presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func allowMicPermissionButtonTapped() {
        presenter.allowMicPermissionButtonTapped()
    }
    
    @IBAction func startButtonTapped() {
        presenter.startButtonTapped()
    }
    
    @IBAction func stopButtonTapped() {
        presenter.stopButtonTapped()
    }
}

