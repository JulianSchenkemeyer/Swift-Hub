//
//  File 2.swift
//  
//
//  Created by Julian Schenkemeyer on 24.04.23.
//

import Foundation


enum NetworkError: String, Error {
	case InvalidUrl = "Could not create a valid url."
	case InvalidResponse = "Invalid response from the server. Please try again."
	case InvalidData = "The data received from the server was invalid. Please try again."
}
