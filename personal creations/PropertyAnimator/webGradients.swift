//
//  webGradients.swift
//  PropertyAnimator
//
//  Created by Alexander Dejeu on 2/14/17.
//  Copyright © 2017 Alexander Dejeu. All rights reserved.
//

import Foundation
import UIKit
/*
 Inspired by https://github.com/itmeo/webgradients
 At time of creation there was only CSS3, .sketch and .PSD files.  I wondered why only web devs could reap
 benifits of this spectacular project!  I ported all of the color gradients over to Swift and added some of my
 own functions that I beilve will be useful for others as well.
 */

class gradients{
  // 001 Warm Flame
  // BL to TR
  static let warmFlameS1 = UIColor.red
  static let warmFlameS2 = UIColor.yellow
  static let warmFlame : [UIColor] = [warmFlameS1, warmFlameS2]
  
  // 002 Night Fade
  // MT to MB
  static let nightFadeS1 = UIColor(red: 251.0/255.0, green: 194.0/255.0, blue: 235.0/255.0, alpha: 1)
  static let nightFadeS2 = UIColor(red: 161.0/255.0, green: 140.0/255.0, blue: 209.0/255.0, alpha: 1)
  static let nightFade : [UIColor] = [nightFadeS1, nightFadeS2]
  
  // 003 Spring Warmth
  // MT to MB
  static let springWarmthS1 = UIColor(red: 255.0/255.0, green: 209.0/255.0, blue: 255.0/255.0, alpha: 1)
  static let springWarmthS2 = UIColor(red: 250.0/255.0, green: 208.0/255.0, blue: 196.0/255.0, alpha: 1)
  static let springWarmth : [UIColor] = [springWarmthS1, springWarmthS2]
  
  // 004 Juicy Peach
  // ML to MR
  static let juicyPeachS1 = UIColor(red: 255.0/255.0, green: 236.0/255.0, blue: 210.0/255.0, alpha: 1)
  static let juicyPeachS2 = UIColor(red: 252.0/255.0, green: 182.0/255.0, blue: 159.0/255.0, alpha: 1)
  static let juicyPeach : [UIColor] = [juicyPeachS1, juicyPeachS2]
  
  // 005 Young Passion
  // TODO: COME BACK TO ADD MULTI SUPPORT?
  static let youngPassionS1 = UIColor(red: 255.0/255.0, green: 236.0/255.0, blue: 210.0/255.0, alpha: 1)
  static let youngPassionS2 = UIColor(red: 255.0/255.0, green: 236.0/255.0, blue: 210.0/255.0, alpha: 1)
  static let youngPassionS3 = UIColor(red: 255.0/255.0, green: 236.0/255.0, blue: 210.0/255.0, alpha: 1)
  static let youngPassionS4 = UIColor(red: 255.0/255.0, green: 236.0/255.0, blue: 210.0/255.0, alpha: 1)
  static let youngPassion : [UIColor] = [youngPassionS1, youngPassionS2, youngPassionS3, youngPassionS4]
  
  // 006 Lady Lips
  // MT to MB
  static let ladyLipsS1 = UIColor(red: 254.0/255.0, green: 207.0/255.0, blue: 239.0/255.0, alpha: 1)
  static let ladyLipsS2 = UIColor(red: 255.0/255.0, green: 152.0/255.0, blue: 156.0/255.0, alpha: 1)
  static let ladyLips : [UIColor] = [ladyLipsS1, ladyLipsS2]
  
  // 007 Sunny Morning
  // TODO: - Look into these TL to BR but ofset :P
  static let sunnyMorningS1 = UIColor(red: 247.0/255.0, green: 206.0/255.0, blue: 104.0/255.0, alpha: 1)
  static let sunnyMorningS2 = UIColor(red: 251.0/255.0, green: 171.0/255.0, blue: 126.0/255.0, alpha: 1)
  static let sunnyMorning : [UIColor] = [sunnyMorningS1, sunnyMorningS2]
  
  // 008 Rainy Ashville
  // TM to BM
  static let rainyAshvilleS1 = UIColor(red: 165.0/255.0, green: 192.0/255.0, blue: 238.0/255.0, alpha: 1)
  static let rainyAshvilleS2 = UIColor(red: 251.0/255.0, green: 197.0/255.0, blue: 236.0/255.0, alpha: 1)
  static let rainyAshville : [UIColor] = [rainyAshvilleS1, rainyAshvilleS2]
  
  // 009 Frozen Dreams
  // TM to BM
  static let frozenDreamsS1 = UIColor(red: 230.0/255.0, green: 222.0/255.0, blue: 233.0/255.0, alpha: 1)
  static let frozenDreamsS2 = UIColor(red: 253.0/255.0, green: 202.0/255.0, blue: 241.0/255.0, alpha: 1)
  static let frozenDreams : [UIColor] = [frozenDreamsS1, frozenDreamsS2]
  
  // 010 Winter Neva
  // TODO: - Look into these TL to BR but ofset :P
  static let winterNevaS1 = UIColor(red: 161.0/255.0, green: 196.0/255.0, blue: 253.0/255.0, alpha: 1)
  static let winterNevaS2 = UIColor(red: 194.0/255.0, green: 233.0/255.0, blue: 251.0/255.0, alpha: 1)
  static let winterNeva : [UIColor] = [winterNevaS1, winterNevaS2]
  
  // 011 Dusty Grass
  // TODO: - Look into these TL to BR but ofset :P
  static let dustyGrassS1 = UIColor(red: 212.0/255.0, green: 252.0/255.0, blue: 121.0/255.0, alpha: 1)
  static let dustyGrassS2 = UIColor(red: 150.0/255.0, green: 230.0/255.0, blue: 161.0/255.0, alpha: 1)
  static let dustyGrass : [UIColor] = [dustyGrassS1, dustyGrassS2]
  
  
  
  
  
}
