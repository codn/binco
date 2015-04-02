# BootstrapOnRails

This is a wrapper for adding bootstrap to a project. By includinig this gem you'll add:

* [Bootstrap](https://github.com/twbs/bootstrap-sass)
* [Bootstrap Datepicker](https://github.com/Nerian/bootstrap-datepicker-rails)
* Bootstrap Helpers


## Installation

To install simply include into Gemfile and run 

```
bundle install
```
To include bootstrap and all dependencies.
* 

In your application.scss add:
```
@include "bootstrap-on-rails"
```

In your application.js add:
```
//= require bootstrap-on-rails
```

#### Optional
For customization of datepicker make sure to include your locale js and send it as data attribute when creating a datepicker.
```
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
```


## Usage

```
<%= bootstrap_form_for(@object) do |f| %>
  <%= f.form_group do %>
    <%= f.label :product_id %>
    <%= f.collection_select :product_id, @products, :id, :name, class: 'special-select-class-if-needed' %>
  <% end %>
  
  <%= f.form_group do %>
    <%= f.label :name %>
    <%= f.number_field :name %>
  <% end %>
  
  <%= f.submit 'Great!' %>
<% end %>

This project rocks and uses MIT-LICENSE.
