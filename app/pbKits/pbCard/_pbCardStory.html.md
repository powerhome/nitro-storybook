# Rails
<%= pb_rails(:pbCard, data: { name: "Tim", :show_props => defined?(@kit) }) %>

<br/><hr/><br/>

# React
<%= javascript_pack_tag 'pbCard' %>
<%= pb_react('pbCard', {name: 'Tim', show_props: defined?(@kit)}) %>
