SpreeIdme
=========

Thanks for using our Spree Extension to enable ID.me functionality.

Installation
------------

Add spree_idme to your Gemfile:

```ruby
gem 'spree_idme', :git => "git://github.com/idme/spree_idme.git"
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_idme:install
```

Usage
-----

Visit https://developer.id.me/ and register for an account and obtain an API Key and Secret by creating 
an application for your Spree store. When setting up your ID.me application make sure to set the Base URI
as your site's URL and set the Redirect URI to your store's URL with a path of /idme. For example, if
your website is http://spree.id.me/ you should provide http://spree.id.me/idme as your Redirect URI when
setting up your Spree application on the ID.me developer website.

Open your Spree store's admin settings, click on the ID.me settings tab and enter your API Key and Secret.

Next, open the Spree Promotions tab in the admin interface, and add a new promotion.

Change the promotion's event name to "Order contents changed", then add an action type such as "Create adjustment" 
and enter the desired amount of adjustment.

Next, Add a rule of type "id.me" and choose the affinity group to apply this promotion to.

If you wish to have a discount for each affinity group, create separate promotions for each group.
This will allow you to set a different promotion value for each type of customer.

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_idme/factories'
```

Copyright (c) 2013 ID.me, released under the New BSD License
