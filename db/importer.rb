module UrlsImporter
  def self.import(filename=File.dirname(__FILE__) + "/db/urls.csv")
    field_names = nil
    Url.transaction do
      File.open(filename).each do |line|
        #data = line.chomp.split(',')
        data = line[1..-2]
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          url = Url.create!(attribute_hash)
        end
      end
    end
  end
end
