# Foreman Cloudstack Plugin

This plugin enables provisioning and managing a Cloudstack Server in Foreman.

## Installation

The only way I can get this to work today is unzipping the source code here on top of foreman or by using the included Vagrantfile. The typical gem installation is what I want to support but does not work yet.

Please see the Foreman manual for appropriate instructions:

* [Foreman: How to Install a Plugin](http://theforeman.org/manuals/latest/index.html#6.1InstallaPlugin)

The gem name is "foreman_cloudstack2".

## Compatibility

| Foreman Version | Plugin Version |
| ---------------:| --------------:|
| >=  1.7         | 0.1.3          |

## Latest code

You can get the develop branch of the plugin by specifying your Gemfile in this way:

    gem 'foreman_cloudstack2', :git => "https://github.com/bytemine/foreman-cloudstack.git"

## Limitations

Only advanced networking is supported

All user data is gzipped

# Copyright

Copyright (c) 2014 Citrix

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
