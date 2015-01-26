//
//  ViewController.swift
//  UiKeyboardDismiss
//
//  Created by Christina Moulton on 2015-01-26.
//  Copyright (c) 2015 Teak Mobile Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var keyboardDismissTapGesture: UIGestureRecognizer?
  var textfield: UITextField?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textfield = UITextField(frame: CGRect(x: 20, y: 20, width: self.view.frame.size.width - 40, height: 40))
    textfield!.borderStyle = UITextBorderStyle.Line
    self.view.addSubview(textfield!)
  }

  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)

  }
  
  func keyboardWillShow(notification: NSNotification) {
    if keyboardDismissTapGesture == nil
    {
      keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard:"))
      self.view.addGestureRecognizer(keyboardDismissTapGesture!)
    }
  }
  
  func keyboardWillHide(notification: NSNotification) {
    if keyboardDismissTapGesture != nil
    {
      self.view.removeGestureRecognizer(keyboardDismissTapGesture!)
      keyboardDismissTapGesture = nil
    }
  }
  
  func dismissKeyboard(sender: AnyObject) {
    textfield?.resignFirstResponder()
  }
}

