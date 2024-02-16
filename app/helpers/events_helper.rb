# frozen_string_literal: true

module EventsHelper
  NO_IMAGE_JPG_PATH = 'no_image.jpg'

  def image_file_field(form)
    form.file_field(:image, class: 'field border rounded w-full')
  end

  def delete_image_option(event)
    tag.div class: 'mb-6 flex items-center' do
      # button_to helper breaks all the new and edit forms functionality.
      link_to 'Delete image', purge_image_event_path(event),
              class: 'btn-1 mt-1 mb-2 py-0 no-underline',
              data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }
    end
  end

  def event_image(event, classes = 'mt-3 mb-4')
    image_tag event.image_is_saved_and_exists? ? event.image : NO_IMAGE_JPG_PATH, size: '300x300', class: classes
  end

  def preview_event_image(event, classes = 'mt-3 mb-4')
    if event.image_is_saved_and_exists?
      image_tag event.image.variant(:preview), class: classes
    else
      image_tag NO_IMAGE_JPG_PATH, size: '150x150', class: classes
    end
  end
end
