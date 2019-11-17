//
//  timerViewController.swift
//  TimerApp
//
//  Created by Tianshi Wang on 11/17/19.
//  Copyright © 2019 Tianshi Wang. All rights reserved.
//

import UIKit

class timerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var senderButton: UIButton!
    @IBAction func sender(_ sender: UIButton) {
        isCounting = true
    }
    
    @IBOutlet weak var timerLable: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    var remainingSeconds: Int = 0 {
        willSet {
            //print("!!")
            // sendButton.setTitle("验证码已发送(\(newValue)秒后重新获取)", forState: .Normal)
            timerLable.text = "Sent! Wait for (\(newValue))"
            senderButton.setTitle("Sent! Wait for (\(newValue))", for: .normal)
            if newValue <= 0 {
                countdownTimer.invalidate()
                senderButton.setTitle("Send Again?", for: .normal)
                timerLable.text = "You can send Again!"
                isCounting = false
            }
        }
    }
    var countdownTimer = Timer()
    
    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
                
                remainingSeconds = 10
                
            } else {

            }
            senderButton.isEnabled = !newValue
        }
    }
    @objc func updateTime(timer: Timer) {
        // 计时开始时，逐秒减少remainingSeconds的值
        remainingSeconds -= 1
    }

    
    
    
}
