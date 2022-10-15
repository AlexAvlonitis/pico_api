# frozen_string_literal: true

module PicoApi
  module Generators
    class Generator
      class << self
        def call(project_name)
          commands = load_commands
          new(project_name, commands).call
        end

        def load_commands
          skip_commands = %w[base copytemplate createtemplate]

          Dir[File.join(PicoApi.lib_path, '/generators/commands/*.rb')].sort.map do |file_path|
            file_name = file_path.split('/').last.gsub('.rb', '').camelize
            next if skip_commands.include?(file_name.downcase)

            "PicoApi::Generators::Commands::#{file_name}".constantize
          end.compact
        end
      end

      def initialize(project_name, commands = [])
        raise 'Missing project name' unless project_name

        @project_name = project_name
        @commands = commands
      end

      def call
        commands.each { |command| command.call(project_name) }
      end

      private

      attr_reader :project_name, :commands
    end
  end
end
