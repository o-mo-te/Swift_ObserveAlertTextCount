//
//  ViewController.swift
//  Swift_ObserveAlertTextCount
//
//  Created by hidetomo on 2020/12/13.
//  Copyright © 2020 Hidetomo Masuda. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var alert = UIAlertController()
    let maxTextLength = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func tappedButton(_ sender: UIButton) {
        showAlert()
    }
}

private extension ViewController {
        
    private func showAlert() {
        alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        alert.addTextField {  [weak self] (textField)  in
            textField.delegate = self
        }
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let textFieldText = (textField.text ?? "") as NSString
        if textFieldText.length >= maxTextLength {
            alert.dismiss(animated: true, completion: nil)
        }
        return true
    }
}
