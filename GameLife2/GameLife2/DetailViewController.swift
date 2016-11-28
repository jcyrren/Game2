//
//  DetailViewController.swift
//  GameLife2
//
//  Created by Bhavik Nagda on 11/21/16.
//  Copyright © 2016 stulinProject. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    var evolvePace: Double = 0.0
    var timer = Timer()
    
    var c = Colony()
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        c.setCellAlive(5, yCoor: 5)
        c.setCellAlive(5, yCoor: 6)
        c.setCellAlive(5, yCoor: 7)
        c.setCellAlive(6, yCoor: 6)
        slider.setValue(0.0, animated: false)
        // Do any additional setup after loading the view, typically from a nib.
        makeView()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        timer.invalidate()
        let selectedValue = Double(sender.value)
        evolvePace = 4.0 - selectedValue
        if (evolvePace != 4.0) {
            timer = Timer.scheduledTimer(timeInterval: evolvePace, target: self, selector: #selector(evolve), userInfo: nil, repeats: true)
        }
    }

    
    func makeView(){
        let thisView = BoardView(frame: CGRect(x: 200.0, y: 200.0, width: 600.0, height: 600.0), colony: c)
        view.addSubview(thisView)
        self.configureView()
    }
    
    func evolve(){
        c.evolve()
        makeView()
        print(evolvePace)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

