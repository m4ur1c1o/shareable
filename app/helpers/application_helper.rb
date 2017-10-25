module ApplicationHelper
  def status_label(status)
    status_span_generator status
  end

  private

    def status_span_generator(status)
      case status
      when 'pending'
        content_tag(:span, status.titleize, class: 'label label-warning')
      when 'approved'
        content_tag(:span, status.titleize, class: 'label label-success')
      end
    end
end
