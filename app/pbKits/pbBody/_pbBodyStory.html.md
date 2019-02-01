# <%= @kit %> Rails
<%= pb_rails(:pbBody, data: { text: "This is my body paragraph", tag: "p", :show_props => defined?(@kit) }) %>
<%= pb_rails(:pbBody, data: { text: "This is my body paragraph", tag: "p", color: "light", :show_props => defined?(@kit) }) %>
<%= pb_rails(:pbBody, data: { text: "This is my body paragraph", tag: "p", color: "lighter", :show_props => defined?(@kit) }) %>

<br/><hr/><br/>

# <%= @kit %> React
<%= javascript_pack_tag 'pbBody' %>
<%= pb_react('pbBody', {text: 'This is my body paragraph', show_props: defined?(@kit)}) %>
