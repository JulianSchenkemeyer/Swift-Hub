//
//  BlogView.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 06.05.23.
//

import SwiftUI

struct BlogView: View {
	let fetchService = FetchBlogEntriesService()
	@State var items: [BlogEntry] = []

    var body: some View {
		NavigationStack {
			BlogEntryListView(items: items)
				.navigationTitle("Latest")
		}
		.task {
			self.items = await fetchService.fetch()
		}
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView()
    }
}
