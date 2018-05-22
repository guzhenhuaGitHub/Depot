// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'

class PurchaseOrderPayType extends React.Component {
  render() {
    return(
      <div>
        <div className="field">
          <label htmlFor="order_po_number">PO #</label>
          <input type="password"
                 name="order[po_number]"
                 id="order_po_number"/>
        </div>
      </div>
    )
  }
}

export default PurchaseOrderPayType