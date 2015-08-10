# Install Sublime Text into /Applications
#
# Usage:
#
#     include sublime_text
class sublime_text($build = '3083') {
  require sublime_text::config

  package { 'Sublime Text':
    provider => 'appdmg',
    source   => "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%20${build}.dmg";
  }

  file { "${boxen::config::bindir}/subl":
    ensure  => link,
    target  => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl',
    mode    => '0755',
    require => Package['Sublime Text'],
  }

  # Fetch Package Control from Repository
  exec { 'SublimeText Package':
    command => "curl -o ${sublime_text::config::packagedir}/Package Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package",
    creates => "${sublime_text::config::packagedir}/Package Control.sublime-package",
  }
}
