const Rails = require('rails-ujs')
Rails.start()

import fontawesome from '@fortawesome/fontawesome'
import {faEdit, faTrashAlt, faSignOutAlt, faExternalLinkAlt} from '@fortawesome/fontawesome-free-solid'
fontawesome.library.add(faEdit, faTrashAlt, faSignOutAlt, faExternalLinkAlt)

import ClassicEditor from '@ckeditor/ckeditor5-build-classic'

document.querySelectorAll('.ckeditor').forEach((node) => {
  ClassicEditor
    .create(node, {
      toolbar: [ 'bold', 'italic', 'link', 'bulletedList', 'numberedList' ],
    })
    .then( editor => {
        console.log( editor )
    })
    .catch( error => {
        console.error( error )
    })
})
