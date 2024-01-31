# frozen_string_literal: true

module EventsHelper
  def image_file_field(form)
    form.file_field(:image, class: 'field')
  end

  def delete_image_option(event)
    tag.div class: 'mb-6 flex items-center' do
      # button_to helper breaks all the new and edit forms functionality.
      link_to 'Delete image', purge_image_event_path(event),
              class: 'btn-1 mb-2 py-0 no-underline', data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }
    end
  end

  def event_image(event, classes='mt-3 mb-4')
    tag.div do
      image_tag event.image, size: '300x300', class: classes
    end
  end

  def preview_event_image(event, classes='mt-3 mb-4')
    tag.div do
      image_tag event.image.variant(:preview), class: classes
    end
  end
end
