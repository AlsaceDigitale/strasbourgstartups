import Popper from 'popper.js'
window.Popper = Popper
require('bootstrap-material-design')

const Rails = require('@rails/ujs')
Rails.start()

require('trix')
require('@rails/actiontext')

import fontawesome from '@fortawesome/fontawesome'
import {faEdit, faTrashAlt, faSignOutAlt, faExternalLinkAlt, faBriefcase, faPlus} from '@fortawesome/fontawesome-free-solid'
fontawesome.library.add(faEdit, faTrashAlt, faSignOutAlt, faExternalLinkAlt, faBriefcase, faPlus)

require('js/offcanvas.js')
