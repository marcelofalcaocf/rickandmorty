//
//  ButtonShadow.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 11/03/23.
//

import UIKit

extension UIView
{
    func setButtonCornerRadiusOnly(getValue:CGFloat)
    {
        self.layer.cornerRadius = getValue
        self.clipsToBounds = true
    }
    
    func setButtonBorderColorAndHeight(getHeight:CGFloat,getColor:UIColor)
    {
        self.layer.borderColor = getColor.cgColor
        self.layer.borderWidth = getHeight
    }
    
    func setBtnWithShadow()
    {
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 1.5
        self.layer.cornerRadius = 10
        self.layer.masksToBounds =  false
    }
}
