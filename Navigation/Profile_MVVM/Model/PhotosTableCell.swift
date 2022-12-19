//
//  PhotosTableCell.swift
//  Navigation
//
//  Created by macbook on 23.10.2022.
//

import UIKit

struct Photos {
    
    var image: String
}

let photo_0 = Photos ( image:  "photo_1")
let photo_1 = Photos (image: "photo_2")
let photo_2 = Photos (image: "photo_3" )
let photo_3 = Photos (image:  "photo_4")
let photo_4 = Photos (image:  "photo_5")
let photo_5 = Photos (image:  "photo_6")
let photo_6 = Photos (image:  "photo_7")
let photo_7 = Photos (image:  "photo_8")
let photo_8 = Photos (image:  "photo_9")
let photo_9 = Photos (image:  "photo_10")
let photo_10 = Photos (image:  "photo_11")
let photo_11 = Photos (image:  "photo_12")
let photo_12 = Photos (image:  "photo_13")
let photo_13 = Photos (image:  "photo_14")
let photo_14 = Photos (image:  "photo_15")
let photo_15 = Photos (image:  "photo_16")
let photo_16 = Photos (image:  "photo_17")
let photo_17 = Photos (image:  "photo_18")
let photo_18 = Photos (image:  "photo_19")
let photo_19 = Photos (image:  "photo_20")

var photos: [Photos] = [photo_0, photo_1, photo_2, photo_3, photo_4, photo_5, photo_6, photo_7, photo_8, photo_9, photo_10, photo_11, photo_12, photo_13, photo_14, photo_15, photo_16, photo_17, photo_18, photo_19]

let arrayImages = (1...20).compactMap({UIImage(named: "photo_\($0)")})
