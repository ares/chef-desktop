name             'desktop'
maintainer       "Ares"
maintainer_email "ar3s.cz@gmail.com"
license          "All rights reserved"
description      "Installs/Configures my desktop"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.4.24"

depends	'user', '>= 0.1.0'


attribute 'synergy',
          :display_name => 'Synergy',
          :description => 'Hash of synergy attributes',
          :type => 'hash',
          :required => 'recommended',
          :default => { :server => false }

attribute 'desktop',
          :display_name => 'Desktop adjustments',
          :description => 'Hash of desktop customization values',
          :type => 'hash',
          :requires => 'recommended',
          :default => 'see attribute.rb'
