function something() 
{
  let x = window.localStorage.getItem('bbb'); // x = hh['bbb']

  x = x * 1 + 1; // x += 1

  window.localStorage.setItem('bbb', x); // hh['bbb'] = x

  alert(x);
}

function add_to_cart(id)
{
  let key = 'product_' + id;
  let x = window.localStorage.getItem(key); // x = hh['product_id']

  x = x * 1 + 1; // x += 1

  window.localStorage.setItem(key, x); // hh['product_id'] = x - то есть присваиваем значение ключу

  update_orders_input();
  update_orders_button();
}

function cart_get_number_of_items()
{
  let cnt = 0;
  for (let i = 0; i < window.localStorage.length; i++){

    let key = window.localStorage.key(i); // Получаем ключ
    let value = window.localStorage.getItem(key); // Получаем значение

    if (key.indexOf('product_') == 0) { // Пока перебираем массив, отбираем нужные нам ключи
      cnt += value * 1;
    }
  }

  return cnt;
}

function cart_get_orders()
{
  let orders = '';
  for (let i = 0; i < window.localStorage.length; i++)
  {
    let key = window.localStorage.key(i); // Получаем ключ
    let value = window.localStorage.getItem(key); // Получаем значения, в Ruby: hh['key'] = x

    if (key.indexOf('product_') == 0) 
    {
      orders += key + ' = ' + value * 1 + ', ';
    }
  }

  return orders;
}

function update_orders_input()
{
  let orders = cart_get_orders();
  $('#orders_input').val(orders);
}

function update_orders_button() {
  let text = 'CART (' + cart_get_number_of_items() + ')';
  $('#orders_button').val(text);
}
