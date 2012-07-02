module AdminHelper
    # @param [Class instance] variable
    def render_error(variable)
        content_tag :div, id: 'error_explanation' do
            [
                content_tag(:h2, pluralize(variable.errors.count, t('error'))),
                content_tag(:ul, raw(variable.errors.full_messages.map { |msg| content_tag :li, msg }.join))
            ].join.html_safe
        end if variable.errors.any?
    end

    def form_title(variable)
        "#{controller.action_name.humanize.titleize} #{variable.class.name}"
    end
end