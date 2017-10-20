# Internal dependencies
require_relative "phishtank/db"
require_relative "phishtank/helpers"
require_relative "phishtank/parser"
require_relative "phishtank/raw"
require_relative "phishtank/scanner"
require_relative "phishtank/version"

# External dependencies
require 'json'
require 'rest-client'


include Helpers
module Phishtank
end