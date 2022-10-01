import Foundation
import RxSwift
import RxCocoa

struct SignupViewModel {
    let email    = BehaviorRelay(value: "")
    let password = BehaviorRelay(value: "")
    
    
    lazy var emailState: Observable<ValidatorResult> = {
        email.map { [self] emailText in
            return self.emailValidator.check(inputIsValid: emailText)
        }
    }()
    lazy var passwordState: Observable<ValidatorResult> = {
        password.map { [self] passwordText in
            return self.passwordValidator.check(inputIsValid: passwordText)
        }
    }()
    lazy var complete: Observable<Bool> = {
        Observable.combineLatest(emailState, passwordState) { state1, state2 in
            switch (state1, state2) {
            case (.valid, .valid):
                return true
            default:
                return false
            }
        }
    }()
    
    private let passwordValidator: Validator = PasswordValidator()
    private let emailValidator: Validator = EmailValidator()
    
}
