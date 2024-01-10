module LogWatchingApp
  class LogFile
    INITIAL_DISPLAY_LINES = 100

    def added_lines(file_path)
      file_content = File.readlines(file_path)
      total_lines = file_content.length

      display_start_position = initial_display_start_position(total_lines)

      @last_known_line_position ||= display_start_position
      new_lines = file_content[@last_known_line_position, total_lines - @last_known_line_position]

      @last_known_line_position = total_lines

      new_lines
    end

    private

    def initial_display_start_position(total_lines)
      return 0 if total_lines.zero? || total_lines <= INITIAL_DISPLAY_LINES

      total_lines - INITIAL_DISPLAY_LINES
    end
  end
end
