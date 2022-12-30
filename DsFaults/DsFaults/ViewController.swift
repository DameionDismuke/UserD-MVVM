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

        Label.text = defaults.string(forKey: "value")
                      
        
    }
    
    
    @IBAction func randomDoupleTapped(_ sender: Any) {
        option = 1
        let number = Double.random(in: 1...1000)
        defaults.set(number, forKey: "value")
        Label.text = "\(number)"
    }
    
    @IBAction func randomStringTapped(_ sender: Any) {

        let word = ["Miguel", "William", "Ahmed", "Muhammad", "Dereje", "Frederic", "Jamal", "Morris", "Dameion"]
        let randomElement = word.randomElement()!
        Label.text = randomElement
        defaults.set(randomElement, forKey: "value")
        print("random string")
        option = 2
    }
    
    @IBAction func randomArrayTapped(_ sender: Any) {


        let array2 = [Int.random(in: 0...5),Int.random(in: 0...5) ]
        Label.text = ("\(array2)")
        print(array2)
        defaults.set(array2, forKey: "value")
        let data2 = defaults.array(forKey: "value")
        print(data2 ?? 0)
        
        
    }
    
    @IBAction func randomBookTapped(_ sender: Any) {

        let page = BookOfLife(title: "IKaigi", authoName: "ABC", pageCount: 500)
        let page2 = BookOfLife(title: "Sunrise", authoName: "BBB", pageCount: 100)
        let page3 = BookOfLife(title: "Surprise", authoName: "NANA", pageCount: 1000)

        let choice = [page, page2, page3]
        let data = choice.randomElement()!
        UserDefaults.standard.setObject(data, forKey: "value")
        
        if let myLife = UserDefaults.standard.getObject(forKey: data.title, castTo: BookOfLife.self) {
            print(myLife)
            Label.text = "\(myLife)"
        }

        
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        defaults.removeObject(forKey: "value")
        Label.text = ""
        print("Reset")
    }
    

}

