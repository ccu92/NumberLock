//
//  ViewController.swift
//  NumberLock
//
//  Created by 曹炎平 on 2018/1/14.
//  Copyright © 2018年 TSAOYP. All rights reserved.
//

import UIKit
import GameKit
class ViewController: UIViewController {
    //取亂數的方法
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    var maxNumber = 100
    var minNumber = 1
        var isEnd = false
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
        
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    @IBOutlet weak var background: UIImageView!
    @IBAction func makeAGuess(_ sender: UIButton) {
        if isEnd == false{
            //play game
            
            
            print(answer)
            
            //把使用者輸入的文字拿出來
            let inputText = inputTextField.text!
            //猜完之後清除輸入的答案
            
            inputTextField.text = ""
            
            let inputNumber = Int(inputText)
            if inputNumber == nil{
                //wrong input
                messageLabel.text = "No input, please guess a number \(minNumber) ~ \(maxNumber)"
            }else{
                // input ok
                if inputNumber! > maxNumber{
                    //輸入過大值
                    messageLabel.text = "too big, please guess a number \(minNumber) ~ \(maxNumber)"
                }else if inputNumber! < minNumber{
                    //輸入過小值
                    messageLabel.text = "too small, please guess a number \(minNumber) ~ \(maxNumber)"
                }else if inputNumber! == answer{
                    //正確答案
                    messageLabel.text = "right, press guess to play again"
                    isEnd = true
                    background.image = UIImage(named: "Finish")
                }else{
                    //not right answer
                    if inputNumber! > answer{
                        //大過答案
                        maxNumber = inputNumber!
                        
                    }else{
                        //小過答案
                        minNumber = inputNumber!
                    }
                    messageLabel.text = "please guess \(minNumber) ~ \(maxNumber)"
                }
            }
        }else{
            
            // play end
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "please guess \(minNumber) ~ \(maxNumber)"
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            isEnd = false
             background.image = UIImage(named: "BG")
        }
     
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //push the keyboard up
        inputTextField.becomeFirstResponder()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

