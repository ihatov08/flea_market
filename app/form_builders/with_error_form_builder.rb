class WithErrorFormBuilder < ActionView::Helpers::FormBuilder
  include ApplicationHelper
  def pick_error(attribute)
    error_message(@object, attribute)
  end

  (field_helpers - [:label, :check_box, :radio_button, :fields_for, :hidden_field, :file_field]).each do |selector|
    class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
      def #{selector}(attribute, options = {})
        return super if options[:no_errors]
        super + pick_error(attribute)
      end
    RUBY_EVAL
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    return super if options[:no_errors]
    super + pick_error(method)
  end
end
