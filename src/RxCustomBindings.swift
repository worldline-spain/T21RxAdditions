//
//  RxCustomBindings.swift
//  t21_rxadditions_ios
//
//  Created by Eloi Guzmán Cerón on 07/06/2017.
//  Copyright © 2017 Worldline. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

infix operator <->

infix operator =>

//MARK: Bidirectional bindings

public func <-> <T>(property: ControlProperty<T>?, behaviorRelay: BehaviorRelay<T>) -> Disposable {
    return bidirectionalBinding(property: property, behaviorRelay: behaviorRelay)
}

public func bidirectionalBinding<T>(property: ControlProperty<T>?, behaviorRelay: BehaviorRelay<T>) -> Disposable {
    if let p = property {
        let bindToUIDisposable = behaviorRelay => p
        let bindToBehaviorRelay = p.asDriver().asObservable().subscribe(onNext: { n in
            behaviorRelay.accept(n)
        }, onCompleted:  {
            bindToUIDisposable.dispose()
        })
        return CompositeDisposable(bindToUIDisposable, bindToBehaviorRelay)
    }
    return Disposables.create()
}

//MARK: Directional binding to ControlProperty

public func bindToProperty<T>(behaviorRelay: BehaviorRelay<T>, property: ControlProperty<T>?) -> Disposable {
    if let p = property {
        let bindToUIDisposable = behaviorRelay.asDriver().asObservable().bind(to: p)
        return bindToUIDisposable
    }
    return Disposables.create()
}

public func => <T>(behaviorRelay: BehaviorRelay<T>, property: ControlProperty<T>?) -> Disposable {
    if let p = property {
        return bindToProperty(behaviorRelay: behaviorRelay, property: p)
    }
    return Disposables.create()
}

//MARK: Directional binding to Observer

public func bindToObserver<O,T> (behaviorRelay: BehaviorRelay<T>, observer: O?, disposeBag: DisposeBag) where O : ObserverType, O.E == T? {
    if let obs = observer {
        behaviorRelay.asDriver().asObservable().bind(to: obs).disposed(by: disposeBag)
    }
}

public func bindToObserver<O,T> (behaviorRelay: BehaviorRelay<T>, observer: O?, disposeBag: DisposeBag) where O : ObserverType, O.E == T {
    if let obs = observer {
        behaviorRelay.asDriver().asObservable().bind(to: obs).disposed(by: disposeBag)
    }
}

public func bindToObserver<O,T> (behaviorRelay: BehaviorRelay<T>, observer: O?) where O : ObserverType, O.E == T {
    if let obs = observer {
        _ = behaviorRelay.asDriver().asObservable().bind(to: obs)
    }
}

public func bindToObserver<O,T> (behaviorRelay: BehaviorRelay<T>, observer: O?) where O : ObserverType, O.E == T? {
    if let obs = observer {
        _ = behaviorRelay.asDriver().asObservable().bind(to: obs)
    }
}

public func => <O,T>(behaviorRelay: BehaviorRelay<T>, observer: O?) where O : ObserverType, O.E == T {
    bindToObserver(behaviorRelay: behaviorRelay,observer: observer)
}

public func => <O,T>(behaviorRelay: BehaviorRelay<T>, observer: O?) where O : ObserverType, O.E == T? {
    bindToObserver(behaviorRelay: behaviorRelay,observer: observer)
}

//MARK: Directional binding onNext closure

public func bindOnNext<T>( _ behaviorRelay: BehaviorRelay<T>, _ onNext: @escaping (T) -> (Void)) {
    _ = behaviorRelay.asDriver().asObservable().bind(onNext: onNext)
}
