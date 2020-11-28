//
//  Alert.swift
//  Part5-division-
//
//  Created by 山本ののか on 2020/11/28.
//

import Foundation
import UIKit

enum Alert {

    enum TitleType: String {
        case task5 = "課題5"
        case ok = "OK"
    }

    enum MessageType: String {
        case inputDividend = "割られる数を入力してください"
        case inputDivisor = "割る数を入力してください"
        case doNotInputZeroForDivisor = "割る数には0を入力しないで下さい"
    }

    static func setAlert(vc: UIViewController, title: TitleType, message: MessageType) {
        let alertController = UIAlertController(title: title.rawValue,
                                                message: message.rawValue,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: TitleType.ok.rawValue,
                                                style: .default,
                                                handler: nil))
        vc.present(alertController, animated: true, completion: nil)
    }
}
