//
//  SecondViewController.swift
//  rattlemedia
//
//  Created by Max Bilbow on 28/07/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

import UIKit

class SecondViewController: WebViewController {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.http(url: "maxbilbow.com")

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

