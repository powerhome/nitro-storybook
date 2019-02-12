<%= pb_rails(:pb_vertical_nav_list, :data => {:show_props => defined?(@kit)}) do %>
  <ul>
    <%= pb_rails("pb_vertical_nav_list/pb_vertical_nav_list_item", data: { text: "Calendar" }) %>
    <%= pb_rails("pb_vertical_nav_list/pb_vertical_nav_list_item", data: { text: "Settings" }) %>
    <%= pb_rails("pb_vertical_nav_list/pb_vertical_nav_list_item", data: { text: "Inbox" }) %>
  </ul>
<% end %>
