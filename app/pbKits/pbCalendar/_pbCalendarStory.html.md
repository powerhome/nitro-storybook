# <%= @kit %> Rails
<%= pb_rails(:pbCalendar, data: { name: "Lisa", :show_props => defined?(@kit) }) %>

<br/><hr/><br/>

# <%= @kit %> React
<%= javascript_pack_tag 'pbCalendar' %>
<%= pb_react('pbCalendar', {name: 'Lisa', show_props: defined?(@kit)}) %>
