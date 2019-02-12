<%= pb_rails("pb_vertical_nav_list", :props => {:show_props => defined?(@kit)}) do %>
  <ul>
    <%= pb_rails("pb_vertical_nav_list/pb_vertical_nav_list_item", props: { text: "Calendar" }) %>
    <%= pb_rails("pb_vertical_nav_list/pb_vertical_nav_list_item", props: { text: "Settings" }) %>
    <%= pb_rails("pb_vertical_nav_list/pb_vertical_nav_list_item", props: { text: "Inbox" }) %>
  </ul>
<% end %>
