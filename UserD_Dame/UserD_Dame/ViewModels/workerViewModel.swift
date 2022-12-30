//
//  workerViewModel.swift
//  UserD_Dame
//
//  Created by Dameion Dismuke on 12/29/22.
//

import Foundation



class WorkerViewModel : NSObject {
    
    var apiService : APIService!
    
    
    //MVVM Bindings
    private(set) var wrkData : Workers! {
            didSet {
                self.bindWorkerViewModelToController()
            }
        }
        
        var bindWorkerViewModelToController : (() -> ()) = {}
    
    
    
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetWrkData()
        
    }
    
    
    func callFuncToGetWrkData() {
        self.apiService.apiToGetWorkerData { (wrkData) in
            print(wrkData)
        }
    }
}
