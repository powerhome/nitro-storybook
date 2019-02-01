<% component_props ||= nil %>

<% if( !component_props.nil? ) %>
  <div class="pb--codeCopy">
    ```
      = pb_rails(:<%= component_name %><% if( !component_props[:data].nil? && !component_props[:data].empty? ) %>, data: <%= raw(component_props[:data]) %><% end %>)"
    ```
  </div>
<% end %>
