require 'mechanize'
require File.dirname(__FILE__) + '/lib_icon_rest_xml/scraper'

agent = Mechanize.new
doc = agent.get("http://daponline.scenicrim.qld.gov.au/Common/Common/Terms.aspx")
form = doc.forms.first
# Tick the box.
id = doc.search('input')[4].attribute('name').value
form.checkbox_with(:name => id).check
# Click the button.
doc = doc.forms.first.submit(doc.forms.first.button_with(:value => "I Agree"), "Accept-Encoding" => "identity")

# Use the ICON XML scraper.
scrape_icon_rest_xml("http://daponline.scenicrim.qld.gov.au/Pages/XC.Track/SearchApplication.aspx", "d=last14days&o=xml", false, agent)
