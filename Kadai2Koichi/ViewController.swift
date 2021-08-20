//
//  ViewController.swift
//  Kadai2Koichi
//
//  Created by KS on 2021/08/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var textFields: [UITextField]!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var selectCalcSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        textFields[0].keyboardType = .numberPad
        textFields[1].keyboardType = .numberPad
    }

    @IBAction func showResultButton(_ sender: Any) {
        caluculateNumber()
        view.endEditing(true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    private func caluculateNumber() {

        guard let num1 = Double(textFields[0].text!),
              let num2 = Double(textFields[1].text!) else {
            return
        }

        switch selectCalcSegment.selectedSegmentIndex {
        case 0:
            let plusResult = num1 + num2
            resultLabel.text = "\(plusResult)"
        case 1:
            let minusResult = num1 - num2
            resultLabel.text = String(minusResult)
        case 2:
            let multipleResult = num1 * num2
            resultLabel.text = "\(multipleResult)"
        case 3:
            if num2 == 0 {
                resultLabel.text = "割る数には0以外を入力してください"
                return
            } else {
                let dividResult = num1 / num2
                resultLabel.text = String(dividResult)
            }
        default:break
        }
    }

}
