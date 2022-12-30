//
//  ViewController.swift
//  UserD_Dame
//
//  Created by Dameion Dismuke on 12/29/22.
//HW-1: Use any open source api and utilize it in your app, use URLSession networking to fetch data and parse it and show this
//  in your app. Use Swift and MVVM for this tasks.
//HW-2: Create an application which will use the UserDefaults to save and retrieve the data. Use different buttons and by
//  tapping on these buttons different data should be printed on a label and after killing and reopening the application it
//  should retrieve the same data in label field.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var workerTableView: UITableView!
    
    var workerViewModel : WorkerViewModel!
    
    var dataSource : WorkerTableViewDataSource<WorkerTableViewCell,WorkerData>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        callToViewModelForUIUpdate()


    }
    
    func callToViewModelForUIUpdate(){
        
        
        self.workerViewModel = WorkerViewModel()
        self.workerViewModel.bindWorkerViewModelToController = {
            self.updateDataSource()
        }
        
        
    }
    
    func updateDataSource(){
        
        self.dataSource = WorkerTableViewDataSource(cellIdentifier: "WorkerTableViewCell", items: self.workerViewModel.wrkData.data, configureCell: { (cell, evm) in
                    cell.workerIdLabel.text = evm.id
                    cell.workerNameLabel.text = evm.workerName
                })
                
                DispatchQueue.main.async {
                    self.workerTableView.dataSource = self.dataSource
                    self.workerTableView.reloadData()
                }
            }
    }




