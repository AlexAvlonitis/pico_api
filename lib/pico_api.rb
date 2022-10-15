# frozen_string_literal: true

require 'roda'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module PicoApi
  def self.root_path
    File.dirname(__dir__)
  end

  def self.lib_path
    File.join(root_path, 'lib/pico_api')
  end

  class Application < Roda
    parser = proc { |data| JSON.parse(data, symbolize_names: true) }

    plugin :symbol_status
    plugin :json_parser, parser: parser
    plugin :json, content_type: 'application/vnd.api+json'
    plugin :error_handler do |e|
      PicoApi::Handlers::Errors.call(e, response)
    end
  end
end

loader.eager_load
