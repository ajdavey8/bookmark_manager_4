require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property(:id, Serial)
  property(:name, String)
  property(:url, String)
end

DataMapper::Logger.new(
  File.dirname(File.absolute_path(__FILE__)) + '/log.txt', :debug)

DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
DataMapper.finalize
DataMapper.auto_upgrade!