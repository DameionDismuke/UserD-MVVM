//
//  ViewController.swift
//  UserD2mvvm
//
//
//
//  Created by Dameion Dismuke on 12/29/22.
//HW-1: Use any open source api and utilize it in your app, use URLSession networking to fetch data and parse it and show this
//  in your app. Use Swift and MVVM for this tasks.
//HW-2: Create an application which will use the UserDefaults to save and retrieve the data. Use different buttons and by
//  tapping on these buttons different data should be printed on a label and after killing and reopening the application it
//  should retrieve the same data in label field.

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private let tableView : UITableView = {
        let table = UITableView()
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private var viewModel = DameListVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        self.tableView.frame = view.bounds
        self.tableView.dataSource = self
        
        viewModel.dames.bind { [weak self] damesTVCVMList in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        fetchData()
    }
    
    
    //THIS CONTROLS THE NUMBER OF ROWS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dames.value?.count ?? 0
    }
    
    
    //THIS IS THE CELL
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.dames.value?[indexPath.row].name
        return cell
    }
    
    func fetchData() { //THIS IS THE API THAT I AM BRINGING IN
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let damesModel = try JSONDecoder().decode([UserDames].self, from: data)
                self.viewModel.dames.value = damesModel.compactMap({
                    UserDameTCellVM(name: $0.username, company: $0.company)
                })
                
                //just to show a simple example that how message binding works...
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) { [weak self] in
                    let _ = damesModel.map ({
                        self?.viewModel.dames.value?.append(UserDameTCellVM(name: $0.username, company: $0.company))
                    })
                }
                
            } catch {
                
            }
        }
        task.resume()
    }
    
    
}


