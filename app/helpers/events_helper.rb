# frozen_string_literal: true

module EventsHelper
  def render_event_image_if_exists(event, classes='mt-3 mb-4')
    if event.image_exists?
      render_event_image(event, classes)
    end
  end

  def render_image_file_field(form)
    form.file_field(:image, class: 'field')
  end

  def render_delete_option_if_image_attached(form, event)
    if event.image_exists?
      tag.div class: 'mb-6 flex items-center' do
        render_image_deletion_option(event)
      end
    end
  end

  private

  def render_image_deletion_option(event)
    # button_to helper breaks all the new and edit forms functionality.
    link_to 'Delete image', purge_image_event_path(event), class: 'btn-1 mb-2 py-0 no-underline',
    data: { turbo_method: :delete, turbo_confirm: "Are you sure?" }
  end

  def render_event_image(event, classes)
    image_tag event.image, size: '200x200', class: classes
  end
end
