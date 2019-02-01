<%= pb_rails(:pbVerticalNavList, :data => {:show_props => defined?(@kit)}) do %>
  <ul>
    <%= pb_rails("pbVerticalNavList/pbVerticalNavListItem", data: { text: "Calendar" }) %>
    <%= pb_rails("pbVerticalNavList/pbVerticalNavListItem", data: { text: "Settings" }) %>
    <%= pb_rails("pbVerticalNavList/pbVerticalNavListItem", data: { text: "Inbox" }) %>
  </ul>
<% end %>
