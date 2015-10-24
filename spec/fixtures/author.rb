class Author < ActiveRecord::Base

  include Storext.model
  store :data, coder: JSON

  store_attributes :data do
    name String, default: "Anonymous"
    age Integer
  end

end
