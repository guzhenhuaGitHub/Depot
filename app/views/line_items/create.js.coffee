cart = document.getElementById('cart')
cart.innerHTML = "<%= j render @cart %>"
# make the notice: 'Your cart is currently empty' hide,
# when you add a product to cart again
notice = document.getElementById('notice')
notice.style.display = 'none' if notice
