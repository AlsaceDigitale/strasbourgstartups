const Rails = require('@rails/ujs')
Rails.start()

require("trix")
require("@rails/actiontext")

import fontawesome from '@fortawesome/fontawesome'
import {faEdit, faTrashAlt, faSignOutAlt, faExternalLinkAlt, faBriefcase} from '@fortawesome/fontawesome-free-solid'
fontawesome.library.add(faEdit, faTrashAlt, faSignOutAlt, faExternalLinkAlt, faBriefcase)

require('js/offcanvas.js')
