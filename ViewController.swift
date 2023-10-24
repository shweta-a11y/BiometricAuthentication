//
//  ViewController.swift
//  Biometric
//
//  Created by Shweta on 06/09/22.
//
import LocalAuthentication
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button=UIButton(frame: CGRect(x:0,y:0,width:200,height:50))
        view.addSubview(button)
        button.center=view.center
        button.setTitle("Authorize", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton(){
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Please use Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){[weak self] success,error in
                DispatchQueue.main.async {
                    guard success,error == nil
                    else{
                        let alert=UIAlertController(title: "Failed to Authenticate", message: "Please try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                        self?.present(alert, animated: true)
                        print("id")
                        return
                }
                
                
                let vc = UIViewController()
                vc.title = "Welcome!"
                vc.view.backgroundColor = .systemBlue
                self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
                }
        }
        }
        else{
            let alert=UIAlertController(title: "Dismiss", message: "Please Setup Biometric", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
        
    }

}


