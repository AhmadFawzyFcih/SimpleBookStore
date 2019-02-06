module FormHelper
    def errors_for(form, field)
        content_tag(:p, form.object.errors.full_messages_for(field).first , class: 'help-block')
    end

    def form_group_for(form, field, opts={}, &block)
        has_errors = form.object.errors[field].present?
        content_tag :div, class: "form-group #{'has-error' if has_errors}" do
            concat capture(&block)
            concat errors_for(form, field)
        end
    end
end
