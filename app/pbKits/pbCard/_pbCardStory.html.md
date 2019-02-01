<%= pb_rails(:pbCard, data: { name: "Tim", :show_props => true }) %>


<%= javascript_pack_tag 'pbCard' %>
<%= pb_react('pbCard', {name: 'Tim', show_props: true}) %>
