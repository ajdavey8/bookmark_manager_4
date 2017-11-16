class Link
  include DataMapper::Resource

  property(:id, Serial)
  property(:title, String)
  property(:url, String)

  has n, :tags, through: Resource

end

# DataMapper::Logger.new(
#   File.dirname(File.absolute_path(__FILE__)) + '/log.txt', :debug)

Link.raise_on_save_failure = true
