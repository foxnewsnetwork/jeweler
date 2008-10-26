require 'rake'
require 'rake/tasklib'

class Jeweler
  class Tasks < ::Rake::TaskLib
    def initialize(&block)
      @gemspec = Gem::Specification.new(&block)
      @jeweler = Jeweler.new(@gemspec)
      
      define_tasks
    end
    
  private
    def ensure_version_yml(&block)
      unless File.exists? 'VERSION.yml'
        block.call if block
      end
      @jeweler.write_version(ENV['MAJOR'], ENV['MINOR'], ENV['PATCH'])
    end
    
    def define_tasks
      desc "Generate and validates gemspec"
      task :gemspec => ['gemspec:generate', 'gemspec:validate']

      namespace :gemspec do
        desc "Validates the gemspec"
        task :validate do
          @jeweler.validate_gemspec
        end

        desc "Generates the gemspec"
        task :generate do
          ensure_version_yml do
            @jeweler.write_gemspec
          end
        end
      end

      desc "Displays the current version"
      task :version => 'version:display'

      namespace :version do
        desc "Creates an initial version file. Respects the following environment variables, or defaults to 0: MAJOR, MINOR, PATCH"
        task :write do
          @jeweler.write_version(ENV['MAJOR'], ENV['MINOR'], ENV['PATCH'])
        end

        desc "Displays the current version"
        task :display do
          ensure_version_yml do
            puts "Current version: #{@jeweler.version}"
          end
        end

        namespace :bump do
          desc "Bump the gemspec by a major version."
          task :major => 'version:display' do
            ensure_version_yml do
              @jeweler.bump_major_version
            end
          end

          desc "Bump the gemspec by a minor version."
          task :minor => 'version:display' do
            ensure_version_yml do
              @jeweler.bump_minor_version
            end
          end

          desc "Bump the gemspec by a patch version."
          task :patch => 'version:display' do
            ensure_version_yml do
              @jeweler.bump_patch_version
            end
          end
        end
      end
    end
  end
end