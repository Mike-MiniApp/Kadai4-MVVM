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

// MARK: - Inputs
protocol ViewModelInputs {
    var countUpButtonObservable: Observable<Void> { get }
    var countClearButtonObservable: Observable<Void> { get }
}

// MARK: - Outputs
protocol ViewModelOutputs {
    var countLabelPublishRelay: PublishRelay<String> { get }
}

// MARK: - Type
protocol ViewModelType {
    var inputs: ViewModelInputs { get }
    var outputs: ViewModelOutputs { get }
}

class ViewModel: ViewModelInputs, ViewModelOutputs{
    // MARK: - Inputs
    var countUpButtonObservable: RxSwift.Observable<Void>
    var countClearButtonObservable: RxSwift.Observable<Void>

    // MARK: - Outputs
    var countLabelPublishRelay = RxRelay.PublishRelay<String>()

    // MARK: - Model Connect
    private let calculator = Calculator()

    private let disposeBag = DisposeBag()

    private var number = 0

    // MARK: - Initializer
    init(countUpButtonObservable: Observable<Void>,countClearButtonObservable: Observable<Void>){
        self.countUpButtonObservable = countUpButtonObservable
        self.countClearButtonObservable = countClearButtonObservable
        setupBindings()
    }

    // MARK: - SetupBindings
    private func setupBindings() {
        countUpButtonObservable.subscribe (onNext: {
            self.number = self.calculator.plus(number: self.number)
            self.countLabelPublishRelay.accept(String(self.number))
        }).disposed(by: disposeBag)

        countClearButtonObservable.subscribe (onNext: {
            self.number = self.calculator.reset()
            self.countLabelPublishRelay.accept(String(self.number))
        }).disposed(by: disposeBag)
    }

    
}

extension ViewModel: ViewModelType {
    var inputs: ViewModelInputs { return self }

    var outputs: ViewModelOutputs { return self }
}
