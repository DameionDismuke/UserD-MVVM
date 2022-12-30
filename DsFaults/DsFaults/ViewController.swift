//
//  ViewController.swift
//  DsFaults
//
//  Created by Dameion Dismuke on 12/30/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Label: UILabel!
    
    let defaults = UserDefaults.standard

    var option =  0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Label?.text = defaults.string(forKey: "value")
                      
        
    }
    
    
    @IBAction func randomDoubleTapped(_ sender: Any) {
        option = 1
        let number = Double.random(in: 1...1000)
        defaults.set(number, forKey: "value")
        Label.text = "\(number)"
    }
    
    @IBAction func randomStringTapped(_ sender: Any) {

        let word = ["Akali", "Wukong", "Zed", "Ezreal", "Qiyana", "Fiora", "Lucian", "Elise", "Akshan"]
        let randomElement = word.randomElement()!
        Label.text = randomElement
        defaults.set(randomElement, forKey: "value")
        print("random string")
        option = 2
    }
    
    @IBAction func randomArrayTapped(_ sender: Any) {


        let array2 = [Int.random(in: 0...5),Int.random(in: 0...5) ]
        Label.text = ("\(array2)")
        //print(array2)
        defaults.set("\(array2)", forKey: "value")
        
        
        //let data2 = defaults.array(forKey: "value")
        //print(data2 ?? 0)
        
        
    }
    
    @IBAction func randomBookTapped(_ sender: Any) {

        let page = BookOfLife(title: "Bible", authoName: "JBC", dayCount: 500)
        let page2 = BookOfLife(title: "MonkeyKing", authoName: "DLD", dayCount: 100)
        let page3 = BookOfLife(title: "JourneyToTheWest", authoName: "SAD", dayCount: 1000)

        let choice = [page, page2, page3]
        let data = choice.randomElement()!
        defaults.set("\(data)", forKey: "value")
        Label.text =  "\(data)"
        /*
        if let myLife = defaults.getObject(forKey: "value", castTo: String.self) {
            print(myLife)
            Label.text = "\(myLife)"
        }
         */

        
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        defaults.removeObject(forKey: "value")
        Label.text = ""
        print("Reset")
    }
    

}

