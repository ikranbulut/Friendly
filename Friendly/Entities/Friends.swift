//
//  Friends.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import Foundation

class Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

class Dob: Codable {
    let date: String
    let age: Int
}

class ID: Codable {
    let name: String
    let value: String?
}

class Location: Codable {
    let street: Street
    let city, state, country: String
    let coordinates: Coordinates
}

class Coordinates: Codable {
    let latitude, longitude: String
}

class Name: Codable {
  let title, first, last: String
}

class Picture: Codable {
    let large, medium, thumbnail: String
}

class Street: Codable {
    let number: Int
    let name: String
}

class Friends: Codable {
    let results: [Result]
    let info: Info
}

class Result: Codable {
    let gender: Gender
    let name: Name
    let location: Location
    let email: String
    let dob: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
  
  var fullName: String {
    return name.first + " " + name.last
  }
}
