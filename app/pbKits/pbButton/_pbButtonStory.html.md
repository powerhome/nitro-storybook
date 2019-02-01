# <%= @kit %> Rails

## Primary
<%= pb_rails(:pbButton, data: { text: "Rails Button", wrapperclass: "kit-btn-wrapper", componentclass: "kit-btn", show_props: defined?(@kit)}) %>


<br/><br/>

## Secondary
<%= pb_rails(:pbButton, data: { text: "Rails Button", wrapperclass: "kit-btn-wrapper", componentclass: "kit-btn red", show_props: defined?(@kit)}) %>

<br/><hr/><br/>

# <%= @kit %> React
<%= javascript_pack_tag 'pbButton' %>
<%= pb_react('pbButton', text: "React Button", wrapperclass: "kit-btn-wrapper", componentclass: "kit-btn", show_props: defined?(@kit)) %>
