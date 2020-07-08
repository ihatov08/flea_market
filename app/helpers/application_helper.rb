module ApplicationHelper
  def error_message(resource, column)
    return unless resource
    return if (messages = resource.errors.messages[column]).empty?
    lis = messages.map { |message| "<li>#{resource.errors.full_message(column, message)}</li>" }.join

    %{<ul class="signup-main__has-error-text">#{lis}</ul>}.html_safe
  end
end
