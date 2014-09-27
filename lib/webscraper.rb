module WebScraper
  class << self
    def configure
      yield self
    end

    def url=(starting_url)
    end

    def method_missing(method_name, *args, &block)
    end
  end
end
