class Gquery < ActiveRecord::Base
  has_many :gresults, :dependent => :destroy
  belongs_to :user
  attr_accessible :interval, :question, :user_id


  def perform
    self.googlesresults
  end
  def googlesresults
    if !self.gresults.empty?
       self.gresults.delete_all
    end

    agent = Mechanize.new
    agent.get("https://www.google.pl/")
    agent.page.forms[0].q = self.question
    search_results = agent.page.forms[0].submit

    links = search_results.parser.xpath('//div[@id="search"]')

      links.css('li h3 a').each_with_index do |link, i|
        href = link["href"].split("&")
        href = URI.extract(href[0])
        href = Nokogiri::HTML.fragment(href[0]).to_s
        self.gresults.new(:title => link.text,
                          :url => href,
                          :position => i+1,
                         ).save
      end
      Delayed::Job.enqueue(self, :run_at => self.interval.to_i.minutes.from_now, :priority => 0)
  end

end
