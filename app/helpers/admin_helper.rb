module AdminHelper
    def render_error(variable)
        if variable.errors.any?
            content_tag :div, :id => 'error_explanation' do
                [
                    content_tag(:h2, pluralize(variable.errors.count, 'error') << ' prohibited this user from being saved:'),
                    content_tag(:ul, raw(variable.errors.full_messages.map { |msg| content_tag :li, msg }.join))
                ].join
            end
        end
    end

    def form_title(variable)
        "#{controller.action_name.humanize.titleize} #{variable.class.name}"
    end
end