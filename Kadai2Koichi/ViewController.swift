//
//  ViewController.swift
//  Kadai2Koichi
//
//  Created by KS on 2021/08/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var selectCalcSegment: UISegmentedControl!

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

        if textFields[0].text?.isEmpty == true || textFields[1].text?.isEmpty == true {
            return
        }

        if selectCalcSegment.selectedSegmentIndex == 0 {

            let plusResult = Double(textFields[0].text!)! + Double(textFields[1].text!)!
            resultLabel.text = String(plusResult)

        } else if selectCalcSegment.selectedSegmentIndex == 1 {
            let minusResult = Double(textFields[0].text!)! - Double(textFields[1].text!)!
            resultLabel.text = String(minusResult)

        } else if selectCalcSegment.selectedSegmentIndex == 2 {

            let multipleResult = Double(textFields[0].text!)! * Double(textFields[1].text!)!
            resultLabel.text = String(multipleResult)

        } else if selectCalcSegment.selectedSegmentIndex == 3 {

            if textFields[1].text == "0"{
                resultLabel.text = "割る数には0以外を入力してください"
                return
            }

            let dividResult = Double(textFields[0].text!)! / Double(textFields[1].text!)!
            resultLabel.text = String(dividResult)
        }
    }
}
