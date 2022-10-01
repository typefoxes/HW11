
import Foundation

enum ValidatorResult: Equatable {
    case empty
    case valid
    case error(message: String)
    
}
protocol Validator {
    func check(inputIsValid input: String) -> ValidatorResult
}

struct EmailValidator: Validator {
    func check(inputIsValid input: String) -> ValidatorResult {
        if input.isEmpty { return .empty }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        if predicate.evaluate(with: input) {
            return .valid
        } else {
            return .error(message: "Проверьте правильность ввода почты")
        }
    }
}

struct PasswordValidator: Validator {
    func check(inputIsValid input: String) -> ValidatorResult {
        if input.isEmpty { return .empty }
        if input.count < 6 {
            return .error(message: "Пароль должен содержать не менее 6 символов")
        } else if !input.containsDigit() {
            return .error(message: "Пароль должен содержать минимум одну цифру")
        } else if !input.containsLowercase() {
            return .error(message: "Пароль должен содержать минимум одну букву в нижнем регистре")
        } else if !input.containsUppercase() {
            return .error(message: "Пароль должен содержать минимум одну заглавную букву")
        }
        return .valid
    }
}


private extension String {
    func containsDigit() -> Bool {
        for char in self {
            if char.isNumber { return true }
        }
        return false
    }
    func containsLowercase() -> Bool {
        for char in self {
            if char.isLowercase { return true }
        }
        return false
    }
    func containsUppercase() -> Bool {
        for char in self {
            if char.isUppercase { return true }
        }
        return false
    }
}
