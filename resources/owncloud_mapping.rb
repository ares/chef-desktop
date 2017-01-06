actions :create, :delete

attribute :name, :kind_of => String, :name_attribute => true
attribute :local, :kind_of => String
attribute :target, :kind_of => String
attribute :user, :kind_of => String

default_action :create
