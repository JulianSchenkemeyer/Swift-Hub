//
//  BlogView.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 06.05.23.
//

import SwiftUI

struct BlogView: View {
	let items: [demoType] = []

    var body: some View {
		NavigationStack {
			ListView<demoType>(items: items)
		}
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView()
    }
}
