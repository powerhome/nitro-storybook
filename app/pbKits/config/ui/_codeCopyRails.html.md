<% component_props ||= nil %>

<% if( !component_props.nil? ) %>
  <div class="pb--codeCopy">
    ```
      = pb_rails(:<%= component_name %><% if( !component_props[:data].nil? ) %>, data: <%= raw(component_props[:data]) %><% end %>)"
    ```
  </div>
<% end %>
