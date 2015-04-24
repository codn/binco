# Binco

This is a wrapper for adding bootstrap to a project. By includinig this gem you'll add:

* [Bootstrap](https://github.com/twbs/bootstrap-sass)
* [Bootstrap Datepicker](https://github.com/Nerian/bootstrap-datepicker-rails)
* [Select2](https://github.com/argerim/select2-rails)
* Bootstrap Helpers


## Installation

To install simply include into Gemfile:
```
gem 'binco'
```

and run:

```
bundle install
```

In your application.scss add:
```
@include "binco"
```

In your application.js add:
```
//= require binco
```

#### Optional
For customization of datepicker make sure to include your locale js and send it as data attribute when creating a datepicker.
```
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require select2_locale_es
```


## Usage


```erb
<%= bootstrap_form_for(@object) do |f| %>
  <%= f.form_group do %>
    <%= f.label :product_id %>
    <%= f.collection_select :product_id, @products, :id, :name, class: 'special-select-class-if-needed' %>
  <% end %>

  <%= f.form_group do %>
    <%= f.label :name %>
    <%= f.number_field :name %>
  <% end %>

  <!-- select2 support -->
  <%= f.form_group do %>
    <%= f.label :product %>
    <%= f.collection_select2 :product_id, @products, :name, :id %>
  <% end %>

  <!-- select2 support for checkboxes -->
  <%= f.form_group do %>
    <%= f.label :products %>
    <%= f.collection_check_boxes2 :product_id, @products, :name, :id %>
  <% end %>

  <%= f.submit 'Great!' %>
<% end %>
```

### Modals
```erb
<%= modal 'filter-modal' do %>
  <%= modal_header 'One fine title'%>
  <%= modal_body do %>
    One fine body
  <% end %>
  <%= modal_footer do %>
    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
    <button type="button" class="btn btn-primary" data-dismiss="modal">Submit</button>
  <% end %> <!--  end modal_footer -->
<% end %> <!-- end modal -->
```

### Breadcrumbs
In your layout render the partial wherever your like
```erb
<%= render 'binco/breadcrumb' %>
```
In your views, add an element to breadcrumb with:
```erb
<%= breadcrumb_add(title: 'new', url: pages_new_path) %>
```
Notice that first in first out. So be careful with the order.

Your can configure your placeholder and default url for the breadcrumb in an initializer:

```rb
Binco.configure do |binco|
  binco.breadcrumb_before = { title: 'You are here' }
  binco.breadcrumb_default = [
    { title: 'Index', url: '/' }
  ]
end
```

This project rocks and uses MIT-LICENSE.
