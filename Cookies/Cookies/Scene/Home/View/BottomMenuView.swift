//
//  BottomMenuView.swift
//  Cookies
//
//  Created by gabriel.jeong on 2022/09/03.
//

import UIKit
import RxSwift
import RxCocoa

final class BottomMenuView: UIView {
    
    @IBOutlet fileprivate weak var homeImageView: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet fileprivate weak var writeButton: UIButton!
    @IBOutlet fileprivate weak var madeListButton: UIButton!
    @IBOutlet fileprivate weak var collectedListButton: UIButton!
    
    static func loadView() -> BottomMenuView {
        return Bundle.main.loadNibNamed(BottomMenuView.className,
                                        owner: self,
                                        options: nil)?.first as! BottomMenuView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.cornerRadius = 20.0
        self.containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        UIView.animate(withDuration: 1) {
            self.homeImageView.transform = CGAffineTransform(scaleX: 3, y: 3)
        }
        self.layoutIfNeeded()
    }
}

extension Reactive where Base: BottomMenuView {
    var tappedWrite: ControlEvent<Void> {
        return ControlEvent(events: base
            .writeButton.rx.tap
            .withUnretained(base)
            .do(onNext: { base, _ in
                UIView.animate(withDuration: 1) {
                    base.homeImageView.transform = CGAffineTransform(scaleX: 3, y: 3)
                }
            }).map { $0.1 }
        )
    }
    
    var tappedShowMadeList: ControlEvent<Void> {
        return ControlEvent(events: base
            .madeListButton.rx.tap
            .withUnretained(base)
            .do(onNext: { base, _ in
                UIView.animate(withDuration: 1) {
                    base.homeImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }).map { $0.1 }
        )
    }
    
    var tappedShowCollectedList: ControlEvent<Void> {
        return ControlEvent(events: base
            .collectedListButton.rx.tap
            .withUnretained(base)
            .do(onNext: { base, _ in
                UIView.animate(withDuration: 1) {
                    base.homeImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }).map { $0.1 }
        )
    }
}
