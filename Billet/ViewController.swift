//
//  ViewController.swift
//  Lights
//
//  Created by CSPrasad on 22/01/21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var circleView: UIButton!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var capsuleView: UIView!
    @IBOutlet weak var circleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var LightImage: UIImageView!
    @IBOutlet weak var lblLightState: UILabel!
    
    private var gradientLayer = CAGradientLayer()
    private var capsuleCorner: CGFloat = 16
    private var contentViewCorner: CGFloat = 16
    private var switchCorner = 20
    private var isSwitchOn: Bool = false
    private var animationDuration = 1.0
    private var animationDelay = 1.0
    
    @IBOutlet weak var contentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupView()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor, UIColor.red.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.95)
        gradientLayer.endPoint = CGPoint(x: 0.50, y: 0.05)
        self.gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.white.cgColor]
        view.layer.addSublayer(gradientLayer)
        view.bringSubviewToFront(contentView)
    }
    
    @IBAction func LightsOffActions(_ sender: UIButton) {
        isSwitchOn = !isSwitchOn
        isSwitchOn == true ? switchOn() : switchOff()
    }
    
    func switchOn() {
        UIView.animate(withDuration: animationDuration) {
            self.LightImage.image = UIImage(named: "LightOn")
            self.lblLightState.text = "On"
            self.circleView.backgroundColor = .black
            self.lineView.backgroundColor = .black
            self.contentView.backgroundColor = .clear
            self.gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
            self.circleTopConstraint.constant = 108
        }
    }
    
    func switchOff() {
        
        UIView.animate(withDuration: animationDuration) {
            self.LightImage.image = UIImage(named: "LightOffBlack")
            self.lblLightState.text = "Off"
            self.circleView.backgroundColor = .gray
            self.lineView.backgroundColor = .gray
            self.contentView.backgroundColor = .clear
            self.gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.white.cgColor]
            self.circleTopConstraint.constant = 10
        }
    }
    
    func SetupView() {
        contentView.layer.cornerRadius = contentViewCorner
        capsuleView.layer.cornerRadius = capsuleCorner
        circleView.layer.cornerRadius = circleView.frame.height / 2
    }
    
    
    @IBAction func ContentResizeSliderAction(_ sender: UISlider) {
        contentViewTopConstraint.constant = CGFloat(sender.value)
        contentViewBottomConstraint.constant = CGFloat(sender.value)
    }
    
    @IBAction func VolumeSliderAction(_ sender: UISlider) {
        
    }
    
}
