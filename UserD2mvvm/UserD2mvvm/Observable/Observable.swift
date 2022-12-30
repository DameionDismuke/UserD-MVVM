//
//  Observable.swift
//  UserD2mvvm
//
//  Created by Dameion on 12/30/22.
//

import Foundation

class Observable<T> {
    var value :T? {
        didSet{
            listener?(value)
        }
    }
    
    init(_ value : T?) {
        self.value = value
    }
    
    private var listener : ((T?) -> ())?
    
    func bind(_ listener: @escaping (T?) -> ()) {
        listener(value)
        self.listener = listener
    }
}
