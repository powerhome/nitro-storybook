# <%= @kit %> Rails
<%= pb_rails(:pbDiv, data: { :text => "I am pbDiv-Rails", :wrapperclass => "div-wrapper", :componentclass => "pb-div", :show_props => defined?(@kit) }) %>

<br/><hr/><br/>

# <%= @kit %> React
<%= javascript_pack_tag 'pbDiv' %>
<%= pb_react('pbDiv', {text: 'I am pbDiv-React', wrapperclass: 'div-wrapper', componentclass: 'pb-div', show_props: defined?(@kit)}) %>
