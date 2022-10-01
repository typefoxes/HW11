import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorMessage: UILabel!
    @IBOutlet weak var emailErrorMessage: UILabel!
    
    private var bag = DisposeBag()
    var viewModel: SignupViewModel = SignupViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.rx.text
            .compactMap{ $0 }
            .bind(to: viewModel.email)
            .disposed(by: bag)
        
        passwordTextField.rx.text
            .compactMap { $0 }
            .bind(to: viewModel.password)
            .disposed(by: bag)
        
        viewModel.complete.bind(to: signupButton.rx.isEnabled).disposed(by: bag)
        
        viewModel.emailState.map({ (state) -> String in
            switch state {
            case .empty, .valid:
                return ""
            case let .error(message):
                return message
            }
        })
            .bind(to: emailErrorMessage.rx.text)
            .disposed(by: bag)
        
        viewModel.passwordState.map({ (state) -> String in
            switch state {
            case .empty, .valid:
                return ""
            case let .error(message):
                return message
            }
        }).bind(to: passwordErrorMessage.rx.text)
            .disposed(by: bag)
    }
    
    @IBAction func signUp(_ sender: UIButton) {  performSegue(withIdentifier: "SignupSegue", sender: sender) }
    
}
