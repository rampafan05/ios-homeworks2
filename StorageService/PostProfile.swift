//
//  PostProfile.swift
//  StorageService
//
//  Created by macbook on 06.11.2022.
//

import Foundation

import UIKit

public struct PostProfile {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
}


let post_1 = PostProfile  (author: "Dog.official" ,
                  description: "Си́ба-и́ну, или сиба-кэн (яп. 柴犬), — порода охотничьих собак, выведенная на японском острове Хонсю, самая мелкая из шести пород исконно японского происхождения. В 1936 году объявлена национальным достоянием Японии, где основное поголовье этих собак находится в деревнях.",
                  image:  "dog",
                  likes: 50,
                  views: 10)

   let post_2 = PostProfile(author: "Ilon Mask",
                            description: "Илон маск - американский предприниматель, инженер и миллиардер. Он является основателем, генеральным директором и главным инженером компании SpaceX; инвестором, генеральным директором и архитектором продукта компании Tesla; основателем The Boring Company и соучредителем Neuralink и OpenAI.",
                            image: "ilon mask",
                            likes: 100,
                            views: 250)
       
       
   let post_3 = PostProfile(author: "Space",
                            description: "Луна – пятый по размеру спутник Солнечной системы. Температура поверхности Луны колеблется от −173 °C ночью до +127 °C в подсолнечной точке. Температура пород на глубине 1 метр постоянна и равна −35 °C. Средний радиус Луны составляет 1737,1 километра, то есть примерно 0,273 радиуса Земли.",
                            image: "planeta1" ,
                            likes: 12, views: 30)
       
    let post_4 = PostProfile (author: "Rus.space",
                              description: "Советская ракета-носитель сверхтяжёлого класса. Разрабатывалась с начала 1960-х годов в ОКБ-1 под руководством Сергея Королёва, а после его смерти — под руководством Василия Мишина",
                              image:  "Raketa1",
                              likes: 55,
                              views: 90)

var posts: [PostProfile] = [post_1, post_2, post_3, post_4]
