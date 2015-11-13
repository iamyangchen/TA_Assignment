class Course < ActiveRecord::Base
	attr_accessible :cid, :name, :credits, :lecturer, :insemail, :area, :description, :ta, :notes, :application_pool_id, :user_id
end
