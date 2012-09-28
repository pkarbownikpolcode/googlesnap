class Gresult < ActiveRecord::Base
  belongs_to :gquery
  attr_accessible :gquery_id, :position, :title, :url
end
