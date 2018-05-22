// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'

class CheckPayType extends React.Component {
  render() {
    return (
      <div>
        <div className="field">
          <label htmlFor="order_routing_number">Routing #</label>
          <input type="password"
                 name="order[routing_number]"
                 id="order_routing_number"/>
        </div>
        <div className="field">
          <label htmlFor="order_account_number">Account #</label>
          <input type="text"
                 name="order[account_number]"
                 id="order_account_number"/>
        </div>
      </div>
    )
  }
}

export default CheckPayType