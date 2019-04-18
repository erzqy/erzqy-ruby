#!/usr/bin/env ruby -wKU

require 'net/http'
require 'nokogiri'

keywords = 'alone'.split(' ').join('+')
alamat = URI("https://www.google.co.id/search?q=#{keywords}&safe=active")
response = Net::HTTP.new(alamat.host, 80).get([alamat.path, alamat.query].join('?'))

Nokogiri::HTML(response.body).search('#ires').each do |ires|
	ires.search('h3.r').each do |link|
		puts link.text, link.search('a')[0].attr('href').gsub(/(\/url\?q\=)/, '').gsub(/(\&sa.*)/, '')
	end
end
