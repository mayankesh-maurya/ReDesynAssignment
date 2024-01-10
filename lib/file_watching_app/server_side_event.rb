module LogWatchingApp
  class ServerSideEvent
    include ActionView::Helpers::TextHelper

    def initialize(io)
      @io = io
    end

    def write(file_path)
      file_data = tail(file_path)

      file_data.each do |line|
        without_color_codes = remove_color_decorations(line)
        @io.write without_color_codes
      end
    end

    def close
      @io.close
    end

    private

    def tail(file_path)
      file_content = File.readlines(file_path)
      total_lines = file_content.length

      @last_known_line_position ||= initial_line_position(total_lines)

      start_position = @last_known_line_position

      @last_known_line_position = total_lines

      file_content[start_position, total_lines]
    end

    def initial_line_position(total_lines)
      return 0 if total_lines.zero? || total_lines <= 20

      total_lines - 20
    end

    def remove_color_decorations(line)
      line.gsub(/\e\[(\d+)m/, '')
    end
  end
end
