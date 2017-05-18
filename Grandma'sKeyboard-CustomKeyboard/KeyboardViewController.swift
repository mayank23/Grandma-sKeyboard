//
//  KeyboardViewController.swift
//  Grandma'sKeyboard-CustomKeyboard
//
//  Created by Mayank Jethva on 5/18/17.
//  Copyright © 2017 Mayank Jethva. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var pickerView: UIPickerView!
    
    var keyboardTexts = [
        "Hello",
        "How are you?",
        "Kem Cho?",
        "Maja Ma",
        "Jai Shree Krishna",
        "Jai Mataji",
        "Jai Sai Baba",
        "Jai Umbe",
        "I'm fine",
        "Happy Anniversary!",
        "Happy Birthday!",
        "Happy New Year!",
        "Nice",
        "Nice Photos",
        "Nice Family",
        "Very Nice",
        "Very Good!",
        "Wow Beautiful!",
        "You are welcome",
        "😀",
        "😍",
        "😘",
        "😂",
        "😇",
        "😜",
        "🙏",
        "👌"

    ]
    var pickerRowSelected = 0;
    @IBAction func clearButtonPressed(_ sender: Any){
        var currentlySelected = keyboardTexts[pickerRowSelected] + " ";
        for _ in currentlySelected.characters {
            self.textDocumentProxy.deleteBackward();
        }
        
    }
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        self.textDocumentProxy.insertText(keyboardTexts[pickerRowSelected] + " ");
        
    }
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return keyboardTexts.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keyboardTexts[row]
    }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.pickerRowSelected = row;
        
    }
    
    
}
