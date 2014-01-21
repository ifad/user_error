require 'spec_helper'

feature "UserError handles the exeptions" do
  scenario "non existent path" do
    visit '/bad_route'
    page.should have_content "Not found"
  end

  scenario "server error" do
    visit '/tests'
    page.should have_content "Internal Server Error"
  end

  scenario "JSON server error" do
    visit '/tests.json'
    json = JSON.parse(page.source)
    expect(json['error']['name']).to eq('ActiveRecord::ActiveRecordError' )
    expect(json['error']['status']).to eq(500 )
  end

  scenario "XML server error" do
    visit '/tests.xml'
    xml = Nokogiri.parse(page.source)
    expect( xml.xpath('//error/name').inner_html).to eq('ActiveRecord::ActiveRecordError')
    expect( xml.xpath('//error/status').inner_html).to eq('500')
  end

  scenario "Other server error" do
    visit '/tests.csv'
    expect(page.source).to be_blank
  end

  scenario "bad request" do
    visit '/tests/1'
    page.should have_content "Forbidden"
  end

  scenario "custom exception" do
    visit '/tests/new'
    page.should have_content "Forbidden"
  end
end
