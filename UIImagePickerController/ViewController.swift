//
//  ViewController.swift
//  UIImagePickerController
//
//  Created by Shrawan Shinde on 24/01/17.
//  Copyright © 2017 Shrawan Shinde. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate   {
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupImagePickerButton()
        
        setSelectedImage()
    }
    
    func setupImagePickerButton()
    {
        let selectImageButton = UIButton(type: UIButtonType.system) as UIButton
    
        
        selectImageButton.frame = CGRect(x: 50, y: 50, width: 200, height: 50)
        
        selectImageButton.backgroundColor = UIColor.gray
        selectImageButton.setTitle("Select Image from Gallery", for: UIControlState.normal)
        selectImageButton.tintColor = UIColor.black
        selectImageButton.addTarget(self, action: #selector(ViewController.displayImagePickerButtonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(selectImageButton)
    }
    
    func setSelectedImage()
    {
  
        imageView.frame = CGRect(x: 20, y: 100, width: 320, height: 320)
        
        self.view.addSubview(imageView)
    }

    
    func displayImagePickerButtonTapped(_ sender:UIButton!) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

