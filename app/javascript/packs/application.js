import 'core-js/stable'
import 'regenerator-runtime/runtime'
import 'jquery'
import 'popper.js'
import 'bootstrap'

import 'css/application'
import 'axios'
// Complete SortableJS (with all plugins)
import Sortable from 'sortablejs/modular/sortable.core.esm.js'


const axios = require('axios').default;
const axios_instance = axios.create();

let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
axios_instance.defaults.headers.common['X-CSRF-Token'] = token;
axios_instance.defaults.headers.common['Accept'] = 'application/json';
axios_instance.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

(function() {
  document.addEventListener('DOMContentLoaded', (event) => {
    let users_dashboard = Sortable.create(dashboards, {
      group: "sortedDashboards",
      store: {
          /**
           * Save the order of elements. Called onEnd (when the item is dropped).
           * @param {Sortable}  sortable 
           */
          set: function (sortable) {
              let order = sortable.toArray();
              axios_instance.patch('/dashboards/udpate-postitions', {
                dashboards_order: order
              })
          }
      }
    });
  });

})();