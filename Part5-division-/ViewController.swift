//
//  ViewController.swift
//  Part5-division-
//
//  Created by 山本ののか on 2020/11/28.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var dividendTextField: UITextField!
    @IBOutlet private weak var divisorTextField: UITextField!
    @IBOutlet private weak var answerLabel: UILabel!

    @IBAction private func calculate(_ sender: Any) {
        guard let dividend = Float(dividendTextField.text ?? "") else {
            Alert.setAlert(vc: self, title: .task5, message: .inputDividend)
            return
        }
        guard let divisor = Float(divisorTextField.text ?? "") else {
            Alert.setAlert(vc: self, title: .task5, message: .inputDivisor)
            return
        }
        guard divisor != 0 else {
            Alert.setAlert(vc: self, title: .task5, message: .doNotInputZeroForDivisor)
            return
        }

        let answer = dividend / divisor
        let remainder = dividend.truncatingRemainder(dividingBy: divisor)
        if remainder == 0 {
            answerLabel.text = String(answer)
        } else {
            answerLabel.text = String(format: "%.5f", answer)
        }
    }
}



// 改善点

// Alertのtitleとして使うものとボタンのtitleとして使うものは同列にしない
// Alertのenumはswitchしたい訳ではないので、やるとしてもstatic let
//enum Message {
//    static let inputDividend = "割られる数を入力してください"
//    static let inputDivisor = "割る数を入力してください"
//    static let doNotInputZeroForDivisor = "割る数には0を入力しないで下さい"
//}
// Message.まで入れると入力補完されるのでcaseと同じメリットを享受できる
// 文言をまとめたいという観点で言うと、NSLocalizedStringに書くことが多い（ローカライズ対応する為）
// .rawValueを書かなくてよくなる
// 現状だとlet message = Alert.MessageType(rawValue: "割られる数を入力してください")の様なコードが書けるが
// これが有用なケースはあまり無さそう

// 解答例

// チェック項目を1箇所にまとめる
//enum ValidationResult {
//    case valid
//    case invalid(String)
//}
//
//@IBAction func calcButton(_ sender: Any) {
//    switch validate() {
//    case .valid:
//        break // 何もしないで次の処理へ
//    case let .invalid(message):
//        alert(message: message)
//        return // ここで終了
//    }
//}
//
//func alert(message:String){
//    let alert = UIAlertController(title: "課題5", message: message, preferredStyle: .alert)
//    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
//    alert.addAction(ok)
//    present(alert,animated:true ,completion: nil)
//}
//
//private func validate() -> ValidationResult {
//    if textField1.text == "" {
//        return .invalid("割られる数を入力してください")
//    } else if textFiled2.text == "" {
//        return .invalid("割る数を入力してください")
//    } else {
//        if Float(textFiled2.text ?? "") == 0 {
//            return .invalid("割る数には0を入力しないでください")
//        } else {
//            return .valid
//        }
//    }
//}
