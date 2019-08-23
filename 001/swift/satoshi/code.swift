//
//  ViewController.swift
//  math
//
//  Created by SATOSHI NAKAJIMA on 8/23/19.
//  Copyright © 2019 SATOSHI NAKAJIMA. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    func next(_ i:UInt64) -> UInt64 {
        var ret:UInt64 = 1;
        var num = i;
        while (num > 0) {
            ret = ret * (num % 10);
            num /= 10;
        }
        return ret;
    }
    
    func calc() {
        var i:UInt64=10;
        var max = 0;
        var last:UInt64 = 0;
        while(i < UInt64.max) {
            var num = next(i);
            if (num >= last) { // optimization
                var count = 1;
                while(num >= 10) {
                    num = next(num);
                    count += 1;
                }
                if count > max {
                    print(i, count);
                    last = i;
                    max = count;
                }
            }
            i += 1;
        }
        print("end", last);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .background).async {
            self.calc();
        }
    }


    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

