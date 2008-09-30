require 'hpricot'
require 'open-uri'
require 'cgi'
require 'time'

class Image < ActiveRecord::Base

  def self.tumble(params)

    url = "http://#{params['set']}.tumblr.com/api/read?start=#{params['start']}&num=#{params['num']}&type=#{params['type']}"
    doc = Hpricot.XML(open(url))

    @images= []
    current = params['start'].to_i

    (doc/"post").each do |p|
      if p['type'] == "photo"
        Image.extract_photo(p, current)
      end
      current += 1
    end

    @images
  end

  private

  def self.extract_photo(p, current)
    image = {}
    image["url-big"] = (p/"photo-url").first.inner_html unless (p/"photo-url").first == nil
    image["url-small"] = image["url-big"].to_s.gsub(/_500/, '_75sq')

    image["datetime"] = Time.parse(p["date"])

    image["caption"] = CGI::unescapeHTML((p/"photo-caption").first.inner_html.to_s) unless (p/"photo-caption").first == nil

    image["id"] = p["id"]

    # post["comments"] = Comment.find_all_by_post_id(post["id"])

    image["num"] = current
    @images << image
  end
  
end
