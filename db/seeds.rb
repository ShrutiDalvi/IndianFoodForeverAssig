# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "nokogiri"
require "open-uri"
   i=1
base_url="http://www.indianfoodforever.com/"

doc=Nokogiri::HTML(open(base_url))
doc.css(".top-link > a").each do |item|
  Category.create(name: item.content)

  rcategory= item.attribute('href').to_s

  doc_rec=Nokogiri::HTML(open(rcategory))
  doc_rec.css("div.mainlinks a").each do |recname|
    rname= recname.attribute('href').to_s
    unless rname == "http://www.indianfoodforever.com/muhroom/"
    doc_detail=Nokogiri::HTML(open(rname))
    doc_detail.css('body').each do |rec_det|
      ingre=rec_det.css('.text')
      procedure=rec_det.css('ul')
      #puts ingre.text
      #puts procedure.text
      Recipe.create([category_id: i, name: recname.content, ingredients: ingre.inner_html, description: procedure.inner_html])
    end
    end
  end
i=i+1
end
