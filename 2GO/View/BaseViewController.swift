//
//  BaseViewController.swift
//  2GO
//
//  Created by Tatiana Rico on 26/10/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class BaseViewController: UIViewController{
    
    var animacaoLoadingView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func showLoading(){
        self.animacaoLoadingView = AnimationView()
        
        self.animacaoLoadingView?.frame = self.view.frame
         
        let pulseLoading = Animation.named("animacao")
        animacaoLoadingView?.animation = pulseLoading
        
        self.view.addSubview(self.animacaoLoadingView ?? UIView())
        
        animacaoLoadingView?.play()
    }
    func hiddenLoading(){
        animacaoLoadingView?.removeFromSuperview()
        self.animacaoLoadingView?.stop()
    }
}

