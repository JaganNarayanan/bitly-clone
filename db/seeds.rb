require "byebug"
module UrlsImporter
  def self.import(filename=File.dirname(__FILE__) + "/test.csv")
    field_names = nil
    Url.transaction do
      File.open(filename).each do |line|
        #data = line.chomp.split(',')
        data = line[1..-4]
        if field_names.nil?
          field_names = data
        else
          attribute_hash = {long: data}
          url = Url.create!(attribute_hash)
        end
      end
    end
  end
end

UrlsImporter.import()
