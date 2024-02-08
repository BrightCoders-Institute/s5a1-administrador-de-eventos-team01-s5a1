import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="datetimepicker"
export default class extends Controller {
  connect() {
    new DateRangePicker(this.element, {
      autoApply: true,
      alwaysShowCalendars: true,
      timePicker: true,
      singleDatePicker: true,
      opens: 'left',
      ranges: {
        'Today': [moment().startOf('day'), moment().startOf('day')],
        'Yesterday (No notification)': [moment().subtract(1, 'days').startOf('day'), moment().subtract(1, 'days').endOf('day')],
        'Tomorrow': [moment().add(1, 'days').startOf('day'), moment().add(1, 'days').startOf('day')],
        'Next 7 Days': [moment().add(7, 'days').startOf('day'), moment().add(7, 'days').startOf('day')],
        "Month's end": [moment().endOf('month').startOf('day'), moment().endOf('month').startOf('day')]
      },
      locale: {
        format: "YYYY/MM/DD HH:mm:ss"
      }
    })
  }
}
