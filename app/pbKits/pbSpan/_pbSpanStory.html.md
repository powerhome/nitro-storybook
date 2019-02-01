<%= pb_rails(:pbSpan, data: { :text => "I am pbSpan-Rails", :wrapperclass => "span-wrapper", :componentclass => "span", :show_props => true }) %>


<%= javascript_pack_tag 'pbSpan' %>
<%= pb_react('pbSpan', {text: 'I am pbSpan-React', wrapperclass: 'span-wrapper', componentclass: 'span', show_props: true}) %>
