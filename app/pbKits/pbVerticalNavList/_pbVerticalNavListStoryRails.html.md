# <%= @kit %> Rails
<%= pb_rails(:pbVerticalNavList, :data => {:show_props => defined?(@kit)}) do %>
  <%= pb_rails("pbVerticalNavList/pbVerticalNavListItem", data: { text: "Calendar" }) %>
  <%= pb_rails("pbVerticalNavList/pbVerticalNavListItem", data: { text: "Settings" }) %>
  <%= pb_rails("pbVerticalNavList/pbVerticalNavListItem", data: { text: "Inbox" }) %>
<% end %>

<br/><hr/><br/>

# <%= @kit %> React
<%= javascript_pack_tag 'pbVerticalNavList' %>
React: <%= pb_react('pbVerticalNavList', {name: 'pbVerticalNavList', show_props: defined?(@kit)} ) %>
