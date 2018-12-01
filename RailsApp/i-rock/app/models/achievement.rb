class Achievement < ApplicationRecord
    enum privacy: [:public_access, :private_access, :frieds_access]
end
