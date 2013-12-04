// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .



$(document).ready(function(){

console.log('In document ready')



   $('a.cart').click(function() {
     var $cart = $('#cart');
     if($cart.is(':visible')) {
     	$cart.hide();
     } else {

     $.get('/cart', function(html) {
   	   $cart.html(html).show();
     });
     }
     return false;
   });

	console.log('Applying click handlers to .add_to_cart');
  $('.add_to_cart').click(function(){
  	console.log('Clicked on '+this);
  	try {
      var action = $(this).parents('form').attr('action');
      $.ajax({
        type: "POST",
        url: action,
        dataType: 'json',



        success: function(json) {
        	console.log('Response from Server');
        	console.log('json');
          $('#cart_item_count').text(json.item_count);

       
     var $cart = $('#cart');
     if($cart.is(':visible')) {
     	 $.get('/cart', function(html) {
   	   $cart.html(html).show();
     });
     }


        }
      });
    } catch(e) {
      console.log(e);
    } finally {
  	return false;
    }
  });
});



//  Original code to get cart item list on same page once cart is updated:

//        $('a.cart').click(function() {
//     var $cart = $('#cart');
//     if($cart.is(':visible')) {
//     	$cart.hide();
//     } else {
//
//     $.get('/cart', function(html) {
//   	   $cart.html(html).show();
//     });
//     }
//     return false;
//   });