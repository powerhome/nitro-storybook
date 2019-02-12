<%= javascript_pack_tag 'pb_vertical_nav_list' %>
React: <%= pb_react('pb_vertical_nav_list', props: {name: 'pb_vertical_nav_list', show_props: defined?(@kit)} ) %>

<%= render 'config/ui/propsTableSimple',
    component_props: { show_props: defined?(@kit) } %>
