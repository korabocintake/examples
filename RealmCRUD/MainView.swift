//
//  MainView.swift
//  RealmCRUD
//
//  Created by MHR1611−02−04 on 2017/05/19.
//  Copyright © 2017年 HJSD. All rights reserved.
//

import Foundation
import UIKit

/// Main view for this app
@IBDesignable
class MainView: UIView {
    
    // for IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
        self.setup()
    }
    
    // for code
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        self.setup()
    }

    // MARK: - Private Methods
    // xibからカスタムViewを読み込んで準備する
    private func commonInit() {
        // MyCustomView.xib からカスタムViewをロードする
        // Bundle は 自分のクラスに対応したものを使う
        let bundle = Bundle(for: type(of: self))
        let clzName = MetaUtil.findClassName(self)
        let nib = UINib(nibName: clzName, bundle: bundle)
        for cmp in nib.instantiate(withOwner: self, options: nil) {
            switch cmp.self{
            case is UIView:
                prepareView(view: cmp as! UIView)
            default:
                break
            }
        }
        self.setup()
    }
    
    private func prepareView(view: UIView){
        // カスタムViewのサイズを自分自身と同じサイズにする
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                      metrics:nil,
                                                      views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                      metrics:nil,
                                                      views: bindings))
    }

}
