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
