# <%= @kit %> Rails
<%= pb_rails(:pbCaption, data: { text: "This is my caption", tag: "p", :show_props => defined?(@kit) }) %>
<%= pb_rails(:pbCaption, data: { text: "This is my caption", tag: "p", large: true, :show_props => defined?(@kit) }) %>


<br/><hr/><br/>

# <%= @kit %> React
<%= javascript_pack_tag 'pbCaption' %>
<%= pb_react('pbCaption', {text: 'This is my caption', show_props: defined?(@kit)}) %>
