//
//  ViewModel.swift
//  Kadai4-MVVM
//
//  Created by 近藤米功 on 2022/10/07.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

// MARK: Inputs
protocol ViewModelInputs {
    var countUpButtonObservable: Observable<Void> { get }
    var countClearButton: Observable<Void> { get }
}

// MARK: Outputs
protocol ViewModelOutputs {
    var countLabelPublishRelay: PublishRelay<String> { get }
}

class ViewModel {
    
}
