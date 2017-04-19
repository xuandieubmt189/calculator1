

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lb_Text: UILabel!
    @IBOutlet weak var lb_operator: UILabel!
    
    var result : Double = 0
    var numberOnLabel : Double = 0
    var currentOper : String = "+"
    var start : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lb_Text.text = ""
        lb_operator.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func number_Click(_ sender: UIButton) {
        if (lb_Text.text?.characters.count)! < 13 {
            if sender.tag != 11 {
                if start {
                    lb_Text.text = ""
                }
                
                lb_Text.text = lb_Text.text! + String(sender.tag - 1)
                start = false
            } else {
                if (lb_Text.text?.isEmpty)! {
                    lb_Text.text = "0."
                } else {
                    let countdots = lb_Text.text!.components(separatedBy:".").count - 1
                    if countdots == 0 {
                        lb_Text.text = lb_Text.text! + "."
                    }
                }
            }
        }
    }
    
    @IBAction func cal_Action(_ sender: UIButton) {
        if sender.tag == 16 {
            if start {
                lb_operator.text = "="
                lb_Text.text = String(result)
            } else {
                lb_operator.text = "="
                if lb_Text.text != "" {
                    TinhToan()
                    lb_Text.text = String(result)
                    numberOnLabel = 0;
                    currentOper = "+"
                    start = true
                }
            }
        } else if sender.tag == 15 {
            TinhToan()
            
            lb_Text.text = String(result)
            start = true
            numberOnLabel = 0;
            currentOper = "+"
            lb_operator.text = "+"
        } else if sender.tag == 14 {
            TinhToan()
            
            lb_Text.text = String(result)
            start = true
            numberOnLabel = 0;
            currentOper = "-"
            lb_operator.text = "-"
        } else if sender.tag == 13 {
            TinhToan()
            
            lb_Text.text = String(result)
            start = true
            numberOnLabel = 0;
            currentOper = "*"
            lb_operator.text = "*"
        } else if sender.tag == 12 {
            TinhToan()
            
            lb_Text.text = String(result)
            start = true
            numberOnLabel = 0;
            currentOper = "/"
            lb_operator.text = "/"
        } else {
            if currentOper == "*" || currentOper == "/" {
                TinhToan()
                
                result = result / 100
                currentOper = "+"
                numberOnLabel = 0
                lb_operator.text = ""
                lb_Text.text = String(result)
            } else {
                numberOnLabel = Double(lb_Text.text!)!
                numberOnLabel = numberOnLabel / 100
                
                lb_Text.text = String(numberOnLabel)
            }
        }
    }
    
    @IBAction func clear_Action(_ sender: UIButton) {
        if sender.tag == 18 {
            lb_Text.text = ""
            lb_operator.text = ""
            currentOper = "+"
            
            start = true
            
            numberOnLabel = 0
            result = 0
        }
        if sender.tag == 17 {
            if start {
                lb_Text.text = ""
                currentOper = "+"
                lb_operator.text = ""
                
                start = true
                
                numberOnLabel = 0
                result = 0
            } else {
                let tempString : String = lb_Text.text!
                lb_Text.text = String(tempString.substring(to: tempString.index(before: tempString.endIndex)))
                
                if (lb_Text.text?.isEmpty)! {
                    start = true
                }
            }
        }
    }
    
    func TinhToan() {
        if !start {
            numberOnLabel = Double(lb_Text.text!)!
        }
        if currentOper == "+" {
            result += numberOnLabel
        } else if currentOper == "-" {
            result -= numberOnLabel
        } else if currentOper == "*" {
            result *= numberOnLabel
        } else {
            result /= numberOnLabel
        }
    }
}

