class CaseflowFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options = {})
    options[:maxwidth] ||= 45
    question_number = options.delete(:question_number)
    label = ("<strong>#{question_number}</strong> " + options.delete(:label)).html_safe
    readonly_class = options[:readonly] ? "cf-form-disabled" : ""

    @template.content_tag :div,
                          id: "#{attribute.to_s.dasherize}-#{question_number}",
                          class: "cf-form-textinput #{readonly_class}" do
      label(attribute, label) + super
    end
  end
end