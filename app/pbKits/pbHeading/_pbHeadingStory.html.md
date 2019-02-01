# <%= @kit %> Rails
<%= pb_rails(:pbHeading, data: { text: "Heading 1", tag: "div", size: "1", :show_props => defined?(@kit) }) %>
<%= pb_rails(:pbHeading, data: { text: "Heading 2", tag: "div", size: "2", :show_props => defined?(@kit) }) %>
<%= pb_rails(:pbHeading, data: { text: "Heading 3", tag: "div", size: "3", :show_props => defined?(@kit) }) %>
<%= pb_rails(:pbHeading, data: { text: "Heading 4", tag: "div", size: "4", :show_props => defined?(@kit) }) %>

<br/><hr/><br/>

# <%= @kit %> React
<%= javascript_pack_tag 'pbHeading' %>
<%= pb_react('pbHeading', {text: 'Heading 1', show_props: defined?(@kit)}) %>
