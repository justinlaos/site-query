class Space < ApplicationRecord
  belongs_to :site

  enum space_type: {
    default: 0,
    commercia: 1,
    residential: 2,
    common: 3
  }
end
