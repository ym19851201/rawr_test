#!ruby -Ku
# encoding: utf-8
require 'open-uri'

class Info
  attr_accessor :name,:ability,:img
  attr_accessor :h,:a,:b,:c,:d,:s
  attr_accessor :map
  attr_accessor :no

  def initialize(no, name, h, a, b , c, d, s)
    @no = no
    @name = name
    @h = h
    @a = a
    @b = b
    @c = c
    @d = d
    @s = s
  end
end

def parse()
  ret = {}

#   url = 'http://bw.yakkun.com/zukan/syuzoku_list.htm'
  url = 'http://yakkun.com/xy/status_list.htm'
  user_agent = 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)'

  doc = Nokogiri::HTML( open(url, 'User-Agent' => user_agent).read )
  doc.css('table>tr').each do |e|
    if e && e.css('td') && e.css('td')[0] && e.css('td')[0]['class'] == 'c1'
      info = Info.new(*e.css('td')[0..-2].map {|e| e.text })
      ret[info.name] = info
    end
  end
  return ret
end

def get_info(no)
  url = "http://www57.atwiki.jp/pokemon6th/pages/#{no}.html"
  user_agent = 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)'
  doc = Nokogiri::HTML(open(url, 'User-Agent' => user_agent))
  doc.css('meta[name=description]').each do |e|
    info = e['content']
    puts info
    types = $1.split('/') if info =~ /タイプ：([^\s]+)/
    normal_abilities = $1.split('　') if info =~ /通常特性：([^ ]+)/
    puts normal_abilities
  end
end
