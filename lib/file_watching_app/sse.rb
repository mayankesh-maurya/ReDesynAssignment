require 'json'

module LogWatchingApp
  class ServerSide
    def initialize(io)
      @io = io
    end

    def write(file_lines)
      file_lines.each { |line| @io.write(line) }
    end

    def close
      @io.close
    end
  end
end
