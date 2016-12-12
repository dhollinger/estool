module Estool
  module Cli
    Dir[File.dirname(__FILE__) + '/cli/*.rb'].each { |file| require file }
  end
end
