//
//  ViewController.swift
//  Question
//
//  Created by s20181106115 on 2019/11/27.
//  Copyright © 2019 imnu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var s = 0
    var q = 1
    var cnt = 0
    let ques = ["数据结构很难",
                "猫吃鱼狗吃肉奥特曼打小怪兽",
                "天上有云就会下雨",
                "1 + 1 = 2",
                "程序员的头发掉得更快",
                "师范大学毕业的学生都是老师",
                "爱看动画片的都是小盆友",
                "所有人都要睡觉",
                "光速无穷大",
                "小羊爱吃肉",
                "宇宙正在膨胀",
                "西区12号楼的面很好吃",
                "师大食堂的🍚很香"]
    let ans = [1,1,0,1,1,0,0,1,0,0,1,1,0]
    @IBOutlet weak var Qnum: UILabel!
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var jd: UIProgressView!
    func next()
    {
        cnt += 1
        if cnt > 12
        {
            cnt = 0
        }
        Question.text = ques[cnt]
        
    }
    @IBAction func TandF(_ sender: UIButton) {
        let alert = UIAlertController(title: "Tips", message: "You got it!", preferredStyle: .alert)
        let alert1 = UIAlertController(title: "Tips", message: "You are wrong!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert2 = UIAlertController(title: "Tips", message: "Your score is \(s + 1), do you want to try again?", preferredStyle: .alert)
        let alert3 = UIAlertController(title: "Tips", message: "Your score is \(s), do you want to try again?", preferredStyle: .alert)
        let ok1 = UIAlertAction(title: "OK", style: .default, handler: {
            ACTION in
            self.s = 0
            self.q = 1
            self.cnt = 0
            self.jd.progress = 0.077
            self.Qnum.text = "\(self.q)/13"
            self.score.text = "总得分：\(self.s)"
        })
        alert.addAction(ok)
        alert1.addAction(ok)
        if q < 13
        {
            if (sender.tag == 1 && ans[cnt] == 1) || (sender.tag == 0 && ans[cnt] == 0)
            {
                self.present(alert, animated:true, completion:nil)
                s += 1
                score.text = "总得分：\(s)"
            }
            else{
                self.present(alert1, animated:true, completion:nil)
            }
            q += 1
            jd.progress += 1/13
            Qnum.text = "\(q)/13"
        }
        else
        {
            if (sender.tag == 1 && ans[cnt] == 1) || (sender.tag == 0 && ans[cnt] == 0)
            {
                s += 1
                score.text = "总得分：\(s)"
                alert2.addAction(ok1)
                self.present(alert2, animated:true, completion:nil)
                
                print(q)
            }
            else
            {
                alert3.addAction(ok1)
                self.present(alert3, animated:true, completion:nil)
            }
            
        }
        next()

    }
    override func viewDidLoad() {
        Question.text = ques[0]
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

