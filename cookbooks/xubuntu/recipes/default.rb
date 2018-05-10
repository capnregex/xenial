#
# Cookbook:: xubuntu
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

package "xubuntu-core"
package "git"
package "wget"
package "curl"
package "vim-gnome"
package "terminator"
package "firefox"
package "chromium-browser"
package "chromium-chromedriver"
package "build-essential"
package "dkms"
package "xvfb"
package "ruby"
package "python"
package "nodejs"
package "npm"
package "apt-transport-https"
package "ca-certificates"
package "curl"
package "mysql-server"
package "postgresql"
package "postgresql-contrib"
package "ruby-pg"
package "libpq"
package "software-properties-common"

# linux-headers-$(uname -r) 
#    service lightdm start
#  SHELL

directory "/etc/lightdm/lightdm.conf.d"

file "/etc/lightdm/lightdm.conf.d/50-myconfig.conf" do
  content <<~AUTOLOGIN
    [SeatDefaults]
    autologin-user=vagrant
  AUTOLOGIN
end

