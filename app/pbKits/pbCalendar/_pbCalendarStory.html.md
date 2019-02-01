<%= pb_rails(:pbCalendar, data: { name: "Lisa", :show_props => true }) %>


<%= javascript_pack_tag 'pbCalendar' %>
<%= pb_react('pbCalendar', {name: 'Lisa', show_props: true}) %>
