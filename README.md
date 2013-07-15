**DOING SOME REWORK FOR ADAPT THIS GEM TO SPREE 2.0-STABLE AND REFACTORING SOME CODE. NOT STABLE** 
SUMMARY
-------

A Point Of Sale (POS) screen for Spree.

POS screen hooks into the Admin Tabs and is meant to be used to sell inside a shop, possibly with a touchscreen and a scanner.

Allows for quick checkout and basic adjustment of line item prices also with discount percentages.

A minimal transaction is one scan, and pressing of print button.

Basic bar scanner input (sku/ean search) or search by name. No Customer, no shipping, no coupons, but these are achievable through the order interface.

POS creates orders (just like the admin/order) and in fact lets you switch between the two views freely by adding links back and forth.

Pressing new customer will create a new order (in checkout), which is finalised when print is pressed.

ONLY pressing print will finalise the order, if you do not press print (ie press new customer) the order will be left
 in "checkout" state and thus not be a sale in your system.

Installation
------------

The best way for use this software is to put this code in the Gemfile: 

```shell
gem "spree_pos", :git => "git://github.com/CodeCantor/spree-pos.git"
gem "spree_html_invoice", :git => "git://github.com/CodeCantor/spree-html-invoice.git"
```

For install the assets neaded and create the default objects run the follow command:

```shell
rails generator spree_pos:install
```

Continue reading the configuration section for see how to finish the setup.

qonfigure
--------
By default, the address chosen by the pos, will be the one setted to the current user logged. You can config this address changing this options:

  * Ship Address: You can config this options setting :pos_ship_address to the id of the Spree::Address you would like to use.
  * Bill Address: You can config this options setting :pos_bill_address to the id of the Spree::Address you would like to use. By default it will use :ship_address if not set

If you would like to use an other shipping method you can change it using, :pos_shipping_method.

You can also change the invoice generator change the url, in wich the pos will redirect after press in print invoice:

  * Pos printing: Change the option :pos_printing to the url you would like to use after pressing print.

If you change this option, the spree_html_invoice gem is not longer required.

What is the EAN?
---------------

Many sales and especially POS systems rely on barcode scanning. A barcode scanner functions identical to keyboard
input  to the product code. You may use the sku field for this but we use that for the suppliers code (or our own).

So there is a migration supplied that provides a ean (European Article code, may be upc too) for the Variant class, and fields to edit it and search by it.

Copyright (c) 2011 [Torsten Ruger], released under the New BSD License
Copyright (c) 2013 [Enrique Alvarez (enrique at codecantor dot com)], released under the New BSD License
