class Room < ApplicationRecord
	has_many :messages
	broadcasts #since the room identifies the stream we don't need to specify
end
