//
//  Validation.swift
//  RealTimeReviews
//
//  Created by Zaptech on 9/30/16.
//
//
import UIKit
import Foundation

struct Validation{
    
    
    func isEmpty(txtField: Any) -> Bool {
        let value: String = (txtField as AnyObject).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if (value.count ) == 0 {
            return true
        }
        return false
    }
    
    func isValidateFirstName(fname: String) -> Bool {
        let nameRegex = "^[A-Za-z]+[a-zA-Z0-9'_.-@#]*${5,}"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return nameTest.evaluate(with: fname)
    }
    
    func isPasswordValidate(value: String) -> Bool {
        
        let PWD_REGEX = "^[A-Za-z]+[a-zA-Z0-9'_.-@#]*${5,}"
        let pwd = NSPredicate(format: "SELF MATCHES %@", PWD_REGEX)
        let result =  pwd.evaluate(with: value)
        return result
    }
    func isValidateFullName(fname: String) -> Bool {
        let nameRegex = "^[A-Za-z][a-zA-Z0-9-\\'\\-]{0,}(?: [A-Za-z0-9][a-zA-Z0-9-\\'\\-]*)$"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return nameTest.evaluate(with: fname)
    }
    
    func isEmailValidate(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    func checkMinAndMaxLength(txtField: String, withMinLimit minLen: Int, withMaxLimit maxLen: Int) -> Bool {
        if (txtField.count ) >= minLen && (txtField.count ) <= maxLen {
            return true
        }
        return false
    }
    func isPasswordLength(password: String) -> Bool {
        if (password.count >= 8 && password.count <= 15) {
            return true
        }
        else{
            return false
        }
    }
    
    func isPhonenumberLength(phone: String) -> Bool {
        if (phone.count > 9) {
            return true
        }
        else{
            return false
        }
    }
    func isZipcode(phone: String) -> Bool {
        if (phone.count > 6) {
            return true
        }
        else{
            return false
        }
    }
    func validate(value: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789.").inverted
        let components = value.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        return value == filtered
    }
    
    func isNull(_ object: NSObject) -> Bool {
        if (object is String) {
            return ((object as? String) == "") || ((object as? String) == "null") || ((object as? String) == "nil") || ((object as? String) == "(null)") || ((object as? String) == "<null>")
        }
        else if object == NSNull() {
            return true
        }
        
        return false
    }
    
    func isUserNameValidate(_ stringName:String) -> Bool {
        var sepcialChar = false
        var temp = false
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        if stringName.rangeOfCharacter(from: characterset.inverted) != nil {
            sepcialChar = true
        }
        else {
            temp = true
        }
        let phone = stringName.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        if phone != "" || sepcialChar == true {
            temp = false
            for chr in stringName {
                if ((chr >= "a" && chr <= "z") || (chr >= "A" && chr <= "Z") ) {
                    temp = true
                    break
                }
            }
        }
        if temp == true {
            return true
        }
        else {
            return false
        }
    }
    
    
}


