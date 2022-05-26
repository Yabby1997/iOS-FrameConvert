//
//  ViewController.swift
//  FrameConvert
//
//  Created by Seunghun Yang on 2022/04/01.
//

import UIKit
import SnapKit

class WrappingView: UIView {
    private let targetView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()

    var targetViewFrame: CGRect { targetView.frame }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.backgroundColor = .blue

        addSubview(targetView)
        targetView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
}

class ViewController: UIViewController {

    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        return view
    }()

    private let contentView = UIView()

    private let wrappingView = WrappingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(view)
            make.height.equalTo(1200)
        }

        contentView.addSubview(wrappingView)
        wrappingView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(800)
            make.leading.equalToSuperview().offset(100)
            make.height.width.equalTo(100)
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let converted = wrappingView.convert(wrappingView.targetViewFrame, to: contentView)
        let converted2 = contentView.convert(converted, to: scrollView)
        let converted3 = scrollView.convert(converted2, to: view)

        print(scrollView.contentOffset, converted3)
    }
}
