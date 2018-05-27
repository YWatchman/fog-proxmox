# frozen_string_literal: true

# Copyright 2018 Tristan Robert

# This file is part of Fog::Proxmox.

# Fog::Proxmox is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Fog::Proxmox is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Fog::Proxmox. If not, see <http://www.gnu.org/licenses/>.

require 'fog/json'

module Fog
  module Proxmox
    # module MacAddress mixins
    module MacAddress
      def self.extract(value)
        value[/([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})/]
      end
      def self.to_array(nics)
        addresses = []
        nics.each_value { |value| addresses.push(extract(value)) }
        addresses
      end
    end
  end
end