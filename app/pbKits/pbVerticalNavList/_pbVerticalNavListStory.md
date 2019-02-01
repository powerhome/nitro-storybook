
<%= pb_rails(:pbVerticalNavList) do %>
  <%= pb_rails_no_folder("pbVerticalNavList/pbVerticalNavListItem", data: { text: "Calendar" }) %>
  <%= pb_rails_no_folder("pbVerticalNavList/pbVerticalNavListItem", data: { text: "Settings" }) %>
  <%= pb_rails_no_folder("pbVerticalNavList/pbVerticalNavListItem", data: { text: "Inbox" }) %>
<% end %>

<%= javascript_pack_tag 'pbVerticalNavList' %>
React: <%= react_component('pbVerticalNavList', name: 'pbVerticalNavList') %>

<hr>
