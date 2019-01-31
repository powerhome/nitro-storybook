<h1><%= File.basename( __dir__) %></h1>

ERB:
<%= pb_rails(:pbCard, data: { name: "Tim" }) %>

<hr/>

ERB Child Component:
<%= pb_rails(:pbCard, data: { name: "Tim" }) do %>

  <h5>THIS IS A CHILD:</h5>
  <%= pb_rails(:pbCalendar, data: { name: "Susan" }) %>
<% end %>

<hr/>

<%= javascript_pack_tag 'pbCard' %>
React: <%= react_component('pbCard', name: 'Tim') %>
