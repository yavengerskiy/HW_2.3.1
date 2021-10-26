//
//  ViewController.swift
//  HW_2.3
//
//  Created by Beelab_ on 26/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func showAlert (title : String, message: String, textButton: String){
        let forgotUserNameAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        forgotUserNameAlert.addAction(UIAlertAction(title: textButton, style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(forgotUserNameAlert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let mainViewafterLogInVC = segue.destination as? MainViewAfterLoginViewController else { return }
        mainViewafterLogInVC.welcomeLabelText = "Welcome, \(usernameInput.text ?? "")!"
        }
        
    @IBAction func unwind(for segue: UIStoryboardSegue) {
            usernameInput.text = ""
            passwordInput.text = ""
        }

    @IBAction func loginButtonPressed() {
        if usernameInput.text != "User" &&
            passwordInput.text != "Password" {
            
            passwordInput.text = ""
            showAlert(title: "Incorrect User name or Password! 🤬 ",
                      message: "Please, enter correct Username or password",
                      textButton: "OK")
        }
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        // create the alert
        showAlert(title: "Ooops!",
                  message: "Your name is User 😉 ",
                  textButton: "OK")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Ooops!",
                  message: "Your password is Password 🥴",
                  textButton: "OK")
    }
}

