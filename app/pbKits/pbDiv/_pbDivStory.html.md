<%= pb_rails(:pbDiv, data: { :text => "I am pbDiv-Rails", :wrapperclass => "div-wrapper", :componentclass => "div", :show_props => defined?(@kit) }) %>


<%= javascript_pack_tag 'pbDiv' %>
<%= pb_react('pbDiv', {text: 'I am pbDiv-React', wrapperclass: 'div-wrapper', componentclass: 'div', show_props: defined?(@kit)}) %>
