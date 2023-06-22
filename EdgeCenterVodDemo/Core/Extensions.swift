//
//  Extensions.swift
//  EdgeCenterVodDemo
//
//  Created by Evgenij Polubin on 18.07.2022.
//

import UIKit

extension UIColor {
    static let grey800 = UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1)
    static let grey600 = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    static let grey200 = UIColor(red: 245/255, green: 244/255, blue: 244/255, alpha: 1)
    static let blue = #colorLiteral(red: 0, green: 0.4511454105, blue: 0.9919750094, alpha: 1)
}

extension UIImage {
    static var smoothScrollingIcon: UIImage {
        UIImage(named: "smooth_scrolling_icon")!
    }

    static var smoothScrollingIconSelected: UIImage {
        UIImage(named: "smooth_scrolling_icon_selected")!
    }

    static var ecLogo: UIImage { 
        UIImage(named: "ec_logo")!
    }
    
    static var openEyeIcon: UIImage {
        UIImage(named: "icon_open_eye")!
    }
    
    static var closeEyeIcon: UIImage {
        UIImage(named: "icon_eye_close")! 
    }
    
    static var emptyIcon: UIImage {
        UIImage(named: "empty_icon")!
    }
    
    static var vodPreview: UIImage {
        UIImage(named: "vod_preview")!
    }
    
    static var viewingSelectedIcon: UIImage {
        UIImage(named: "viewing_icon_selected")!
    }
    
    static var viewingIcon: UIImage {
        UIImage(named: "viewing_icon")!
    }
    
    static var uploadSelectedIcon: UIImage {
        UIImage(named: "upload_icon_selected")!
    }
    
    static var uploadIcon: UIImage {
        UIImage(named: "upload_icon")!
    }
    
    static var accountSelectedIcon: UIImage {
        UIImage(named: "account_icon_selected")!
    }
    
    static var accountIcon: UIImage {
        UIImage(named: "account_icon")!
    }

    static var soundIcon: UIImage {
        UIImage(named: "sound")!
    }

    static var muteIcon: UIImage {
        UIImage(named: "mute")!
    }
}

extension UIButton {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        alpha = 0.5
    }

    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        alpha = 1
    }

    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        alpha = 1
    }
}
