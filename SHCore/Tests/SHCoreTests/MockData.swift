//
//  MockData.swift
//  RssParser
//
//  Created by Julian Schenkemeyer on 12.04.23.
//

import Foundation


enum MockData {
	static let rssFeed = """
<feed xmlns="http://www.w3.org/2005/Atom">
<title type="text" xml:lang="en">Test Blog</title>
<link type="application/atom+xml" href="TestBlogatom.xml" rel="self"/>
<link type="text/html" href="" rel="alternate"/>
<updated>2023-03-25T05:59:40-04:00</updated>
<id>tag:Test Blog,2015-12-03:Swift</id>
<entry>
  <title>entry #1</title>
  <author>
    <name>Test Blogger</name>
  </author>
  <updated>2015-12-03T06:01:01-04:00</updated>
  <id>1</id>
  <content type="html">
	<p>Welcome to the blog on Test Blog!</p>
  </content>
</entry>
<entry>
 <title>entry #2</title>
 <author>
  <name>Test Blogger</name>
 </author>
 <updated>2015-12-03T07:01:01-04:00</updated>
 <id>2</id>
 <content type="html">
  <p>With the launch of the </p>
 </content>
</entry>
<entry>
 <title>entry #3</title>
 <author>
  <name>Test Blogger</name>
 </author>
 <updated>2015-12-03T08:01:01-04:00</updated>
 <id>3</id>
 <content type="html">
  <p>Guidelines</p>
 </content>
</entry>
</feed>
"""


	static let rssFeedWithoutContent = """
<feed xmlns="http://www.w3.org/2005/Atom">
<title type="text" xml:lang="en">Test Blog</title>
<link type="application/atom+xml" href="TestBlogatom.xml" rel="self"/>
<link type="text/html" href="" rel="alternate"/>
<updated>2023-03-25T05:59:40-04:00</updated>
<id>tag:Test Blog,2015-12-03:Swift</id>
</feed>
"""


	static let rssFeedOneEntry = """
<feed xmlns="http://www.w3.org/2005/Atom">
<title type="text" xml:lang="en">Test Blog</title>
<link type="application/atom+xml" href="TestBlogatom.xml" rel="self"/>
<link type="text/html" href="" rel="alternate"/>
<updated>2023-03-25T05:59:40-04:00</updated>
<id>tag:Test Blog,2015-12-03:Swift</id>
<entry>
  <title>The Test Blog</title>
  <author>
  <name>Test Blog</name>
  </author>
  <updated>2015-12-03T06:01:01-04:00</updated>
  <id>TestBlog/welcome/</id>
  <content type="html"><p>Welcome to the blog on Test Blog!</p></content>
</entry>
</feed>
"""
}
