/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import fontawesome from '@fortawesome/fontawesome'
import {faRss, faAngleLeft} from '@fortawesome/fontawesome-free-solid'
fontawesome.library.add(faRss, faAngleLeft)
import {faFacebookF, faTwitter} from '@fortawesome/fontawesome-free-brands'
fontawesome.library.add(faFacebookF, faTwitter)

function importAll(r) {
  return r.keys().map(r);
}

importAll(require.context('images/', true, /\.(ico|png|jpe?g|svg|gif)$/))

let offcancasButtonNodes = document.querySelectorAll('[data-toggle="offcanvas"]')
if (offcancasButtonNodes !== null) {
  offcancasButtonNodes.forEach( (offcancasButtonNode) => {
    offcancasButtonNode.addEventListener('click', function(evt) {
      let offcancasMenus = document.querySelectorAll('.offcanvas-collapse')
      if (offcancasMenus !== null) {
        offcancasMenus.forEach( (offcancasMenu) => {
          offcancasMenu.classList.toggle('open')
        })
      }
    })
  })
}

let offcancasMenus = document.querySelectorAll('.offcanvas-collapse')
if (offcancasMenus !== null) {
  offcancasMenus.forEach( (offcancasMenu) => {
    offcancasMenu.addEventListener('click', function(evt) {
      offcancasMenu.classList.toggle('open')
    })
  })
}
