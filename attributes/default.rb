default[:synergy][:server] = false

default[:desktop][:keepass][:version] = "keepassx-2.0"
default[:desktop][:keepass][:source]  = "https://www.keepassx.org/releases/2.0/#{default[:desktop][:keepass][:version]}.tar.gz"
default[:desktop][:keepass][:enable]  = true

default[:desktop][:de][:environment] = 'kde'
default[:desktop][:de][:enable]      = true

default[:desktop][:chrome][:enable]   = true
default[:desktop][:mplayer][:enable]  = true
default[:desktop][:nextcloud][:enable] =  default[:desktop][:owncloud][:enable] || false
default[:desktop][:psi][:enable]      = false
default[:desktop][:ssh_keys][:enable] = true
default[:desktop][:synergy][:enable]  = false
default[:desktop][:gpg][:enable]      = true
default[:desktop][:'translate-shell'][:enable] = true
default[:desktop][:scripts][:enable]  = true
default[:desktop][:kerberos][:enable] = false
default[:desktop][:kvirc][:enable] = false
default[:desktop][:unison][:enable] = true
