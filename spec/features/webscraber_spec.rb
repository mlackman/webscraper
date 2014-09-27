require 'spec_helper'
require 'webscraper'

RSpec.describe WebScraper do
  it 'picks defined data from single page' do
    define_page(
      'localhost:8080/page',
      '<html><head></head><body><p>some text</p></body></html>'
    )

    WebScraper.configure do |config|
      config.url = 'localhost:8080/page'
      config.set_my_data_matcher'//p/text()'
    end

    result = WebScraper.crawl
    expect(result).to eq [{'my_data' => 'some_text'}]
  end
end
