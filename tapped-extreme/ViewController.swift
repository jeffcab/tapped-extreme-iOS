//
//  ViewController.swift
//  tapped-extreme
//
//  Created by Jeffrey Cabrera on 18/02/2016.
//  Copyright © 2016 jcab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    var maxTaps: Int = 0
    var currTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtTaps: UITextField!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnTap: UIButton!
    @IBOutlet weak var lblTaps: UILabel!
    
    @IBAction func onbtnPlayPressed(sender: UIButton!){
        
        
        if (txtTaps.text != nil && txtTaps.text != "") {
            
            imgLogo.hidden = true
            btnPlay.hidden = true
            txtTaps.hidden = true
            btnTap.hidden = false
            lblTaps.hidden = false
            maxTaps = Int(txtTaps.text!)!
            currTaps = 0
            updateTapsLabel()
            
        }
        
    }
    
    @IBAction func onButtonTap(sender: UIButton!){
        currTaps++
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    
    func restartGame() {
        maxTaps = 0
        txtTaps.text = ""
        
        imgLogo.hidden = false
        btnPlay.hidden = false
        txtTaps.hidden = false
        btnTap.hidden = true
        lblTaps.hidden = true
    }
    
    func isGameOver() -> Bool {
        if currTaps >= maxTaps {
            return true
        }
        else
        {
            return false
        }
    }

    func updateTapsLabel(){
        lblTaps.text = "\(currTaps) Taps"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(false)
        super.touchesBegan(touches, withEvent: event)
    }
    
}

