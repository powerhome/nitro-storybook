<% component_props ||= nil %>

<% if( !component_props.nil? ) %>
  <div class="pb--codeCopy">
    ```
      = pb_react('<%= component_name %>'<% if( !component_props.nil? ) %>, <%= raw(component_props) %><% end %>)
    ```
  </div>
<% end %>
