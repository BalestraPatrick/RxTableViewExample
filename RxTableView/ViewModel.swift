//
//  ViewModel.swift
//  RxTableView
//
//  Created by Patrick Balestra on 2/7/16.
//  Copyright © 2016 Patrick Balestra. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class ViewModel {
    
    func getUsers() -> Observable<[SectionModel<String, User>]> {
        return Observable.create { (observer) -> Disposable in
            
            let users = [User(followersCount: 1005, followingCount: 495, screenName: "BalestraPatrick"),
                         User(followersCount: 380, followingCount: 5, screenName: "RxSwiftLang"),
                         User(followersCount: 36069, followingCount: 0, screenName: "SwiftLang")]
            let section = [SectionModel(model: "", items: users)]
            observer.onNext(section)
            observer.onCompleted()
            
            return AnonymousDisposable{}
        }
    }
}
