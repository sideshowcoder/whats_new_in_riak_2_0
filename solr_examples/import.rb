require "csv"
require "ruby-progressbar"
require "riak"
require "json"
require 'digest/md5'

I18n.enforce_available_locales = false

$db = Riak::Client.new
$pb = ProgressBar.create(title: "Importing Cities", total: 47979)

class City
  attr_reader :data, :db
  def initialize csv, db
    @data = csv
    @db = db
  end

  def bucket
    @bucket ||= db.bucket("cities")
  end

  def store
    object = bucket.get_or_new(md5)
    object.raw_data = to_json
    object.content_type = "application/json"
    object.store
  end

  def to_json
    {
      country_s: data["Country"],
      city_s: data["City"],
      accentcity_s: data["AccentCity"],
      region_i: data["Region"],
      population_i: data["Population"],
      location_p: "#{data["Latitude"]},#{data["Longitude"]}"
    }.to_json
  end

  def md5
    Digest::MD5.hexdigest(to_json)
  end
end

CSV.foreach("./cities_with_population.csv", headers: true) { |row|
  City.new(row, $db).store
  $pb.increment
}


