# Log Watcher Log File Example App

This is a sample application created for a blog article explaining how to live stream a log file from a Rails server to the browser.

## Setup

1. Clone the repository.
2. Navigate to the project root and install all required gems with `bundle install`.
3. Start the Rails server: `rails s`.
4. To experience live streaming, visit `http://localhost:3000/live_streams/log_file`.
5. Open the default view for the Rails app in another tab: `http://localhost:3000/`.
6. Go back to the live streaming tab, and observe the log file being streamed. You can refresh the default view, and new changes will be appended to the current display.

## Customization

If you wish to live watcher another file, navigate to `app/controllers/live_streams_controller` and update the **log_file_path** inside the `log_file` action to the desired file path.

Now, any changes made to that file will be live-streamed to the browser.
