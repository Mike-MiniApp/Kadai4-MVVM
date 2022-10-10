//
//  ViewController.swift
//  Kadai4-MVVM
//
//  Created by 近藤米功 on 2022/10/07.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class ViewController: UIViewController {
    // MARK: - UI Parts
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var countUpButton: UIButton!
    @IBOutlet private weak var countClearButton: UIButton!

    // MARK: - ViewModel Connect
    private lazy var viewModel = ViewModel(countUpButtonObservable: countUpButton.rx.tap.asObservable(), countClearButtonObservable: countClearButton.rx.tap.asObservable())

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        viewModel.outputs.countLabelPublishRelay.bind(to: countLabel.rx.text).disposed(by: disposeBag)
    }


}

