require 'mechanize'
require File.dirname(__FILE__) + '/lib_icon_rest_xml/scraper'

agent = Mechanize.new
doc = agent.get("https://srr-prod-icon.saas.t1cloud.com/Common/Common/Terms.aspx")
form = doc.forms.first
# Tick the box.
form.checkbox_with(:name => 'ctl00$ctMain$chkAgree$chk1').check
# Click the button.
doc = doc.forms.first.submit(doc.forms.first.button_with(:value => "I Agree"), "Accept-Encoding" => "identity")

# Use the ICON XML scraper.
scrape_icon_rest_xml("https://srr-prod-icon.saas.t1cloud.com/Pages/XC.Track/SearchApplication.aspx", "d=last28days&o=xml", false, agent)
