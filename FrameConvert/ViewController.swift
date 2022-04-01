//
//  ViewController.swift
//  FrameConvert
//
//  Created by Seunghun Yang on 2022/04/01.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let someView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let anotherView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let anchorView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someView)
        someView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(120)
        }
        
        someView.addSubview(anotherView)
        anotherView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        view.addSubview(anchorView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        anchorView.frame = anotherView.convert(anotherView.bounds, to: view)
    }
}

